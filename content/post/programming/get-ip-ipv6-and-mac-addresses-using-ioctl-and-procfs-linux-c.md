+++
date = "2014-05-30T09:03:35+01:00"
title = "Get IP, IPv6 and MAC addresses using ioctl and procfs on Linux in C"
draft = false
categories = ["Programming"]
tags = ["C", "Linux", "Networking"]
+++

Getting IP, IPv6 and MAC addresses on Linux is no easy task if you do not use *ifconfig*. The information on the internet is not very good, and the process is quite complicated. I have spent most of yesterday writing the code, so I decided to describe it here.

The whole code can be found at the [bottom]({{< relref "get-ip-ipv6-and-mac-addresses-using-ioctl-and-procfs-linux-c.md#code" >}}).

## Listing the interfaces

The first thing we need to do is get the names of network interfaces available on the system. We will parse [sysfs](http://en.wikipedia.org/wiki/Sysfs). Interfaces are available as folders inside the */sys/class/net/* directory.

First we open the directory and check for errors:
{{< highlight c >}}
d = opendir("/sys/class/net/");
if (d == NULL) {
	return -1;
}
{{< /highlight >}}

Then we iterate over directory and ignore current (".") and parent ("..") directory entries:
{{< highlight c >}}
while (NULL != (de = readdir(d))) {
	if (strcmp(de->d_name, ".") == 0 || strcmp(de->d_name, "..") == 0) {
		continue;
	}
{{< /highlight >}}

Finally we print the interface name, call functions that will display mac and ip info, close the folder and we are done.
{{< highlight c >}}
	printf("Interface %s\\n", de->d_name);
	parse_ioctl(de->d_name);
	parse_inet6(de->d_name);
	printf("\\n");
}
closedir(d);
{{< /highlight >}}

## Get MAC, MTU and IPv4 info using ioctl

All calls to [ioctl](http://man7.org/linux/man-pages/man2/ioctl.2.html) need [ifreq struct](http://linux.about.com/library/cmd/blcmdl7_netdevice.htm):
{{< highlight c >}}
struct ifreq {
    char    ifr_name[IFNAMSIZ];/* Interface name */
    union {
            struct sockaddr ifr_addr;
            struct sockaddr ifr_dstaddr;
            struct sockaddr ifr_broadaddr;
            struct sockaddr ifr_netmask;
            struct sockaddr ifr_hwaddr;
            short   ifr_flags;
            int     ifr_ifindex;
            int     ifr_metric;
            int     ifr_mtu;
            struct ifmap ifr_map;
            char    ifr_slave[IFNAMSIZ];
            char    ifr_newname[IFNAMSIZ];
            char *  ifr_data;
    };
};
{{< /highlight >}}

First thing we need to do is define our function and variables.
{{< highlight c >}}
void parse_ioctl(const char *ifname)
{
    int sock;
    struct ifreq ifr;
    struct sockaddr_in *ipaddr;
    char address[INET_ADDRSTRLEN];
    size_t ifnamelen;
{{< /highlight >}}

Next we need to copy ifname to the ifreq struct that will be pased to ioctl. Because ifreq.ifr_name is a fixed length buffer we have to make sure it will fit.
{{< highlight c >}}
    /* copy ifname to ifr object */
    ifnamelen = strlen(ifname);
    if (ifnamelen >= sizeof(ifr.ifr_name)) {
        return ;
    }
    memcpy(ifr.ifr_name, ifname, ifnamelen);
    ifr.ifr_name[ifnamelen] = \'\\0\';
{{< /highlight >}}

For ioctl calls we also need an active socket number, so we have to create one:
{{< highlight c >}}
    /* open socket */
    sock = socket(PF_INET, SOCK_DGRAM, IPPROTO_IP);
    if (sock < 0) {
        return;
    }
{{< /highlight >}}

First we call ioctl with *SIOCGIFHWADDR* to get mac address and print it out:
{{< highlight c >}}
    /* process mac */
    if (ioctl(sock, SIOCGIFHWADDR, &ifr) != -1) {
        printf("Mac address: %02x:%02x:%02x:%02x:%02x:%02x\\n",
                (unsigned char)ifr.ifr_hwaddr.sa_data[0],
                (unsigned char)ifr.ifr_hwaddr.sa_data[1],
                (unsigned char)ifr.ifr_hwaddr.sa_data[2],
                (unsigned char)ifr.ifr_hwaddr.sa_data[3],
                (unsigned char)ifr.ifr_hwaddr.sa_data[4],
                (unsigned char)ifr.ifr_hwaddr.sa_data[5]);
    }
{{< /highlight >}}

To get MTU we do the same but with *SIOCGIFMTU*:
{{< highlight c >}}
    /* process mtu */
    if (ioctl(sock, SIOCGIFMTU, &ifr) != -1) {
        printf("MTU: %d\\n", ifr.ifr_mtu);
    }
{{< /highlight >}}

We try to get IP address with *SIOCGIFADDR*. If there is an error we return, because IP configuration does not exist and we would not be able to get broadcast and netmask anyway. Then we process binary IP with [inet_ntop](http://linux.die.net/man/3/inet_ntop) to get a string we can print:
{{< highlight c >}}
    /* die if cannot get address */
    if (ioctl(sock, SIOCGIFADDR, &ifr) == -1) {
        close(sock);
        return;
    }

    /* process ip */
    ipaddr = (struct sockaddr_in *)&ifr.ifr_addr;
    if (inet_ntop(AF_INET, &ipaddr->sin_addr, address, sizeof(address)) != NULL) {
        printf("Ip address: %s\\n", address);
    }
{{< /highlight >}}

For broadcast and netmask we use *SIOCGIFBRDADDR* and *SIOCGIFNETMASK* respectively. We convert them to string with *inet_ntop* and print them out. Finally we close the opened socket:
{{< highlight c >}}
    /* try to get broadcast */
    if (ioctl(sock, SIOCGIFBRDADDR, &ifr) != -1) {
        ipaddr = (struct sockaddr_in *)&ifr.ifr_broadaddr;
        if (inet_ntop(AF_INET, &ipaddr->sin_addr, address, sizeof(address)) != NULL) {
            printf("Broadcast: %s\\n", address);
        }
    }

    /* try to get mask */
    if (ioctl(sock, SIOCGIFNETMASK, &ifr) != -1) {
        ipaddr = (struct sockaddr_in *)&ifr.ifr_netmask;
        if (inet_ntop(AF_INET, &ipaddr->sin_addr, address, sizeof(address)) != NULL) {
            printf("Netmask: %s\\n", address);
        }
    }

    close(sock);
}
{{< /highlight >}}

## Parsing IPv6 from /proc/net/if_inet6

The ioctl calls do not support IPv6. Because of that we have to use another way. We will parse [/proc/net/if_inet6](http://www.tldp.org/HOWTO/Linux+IPv6-HOWTO/proc-net.html).

First initialize function and open file, check for errors:
{{< highlight c >}}
void parse_inet6(const char *ifname) {
    FILE *f;
    int ret, scope, prefix;
    unsigned char ipv6[16];
    char dname[IFNAMSIZ];
    char address[INET6_ADDRSTRLEN];
    char *scopestr;

    f = fopen("/proc/net/if_inet6", "r");
    if (f == NULL) {
        return;
    }
{{< /highlight >}}

We will use [fscanf](http://www.cplusplus.com/reference/cstdio/fscanf/) to parse the file. The IPv6 in the file is stored in hexadecimal number. We cannot read it as one big number because endianness is a problem. We parse it in a unsigned char array 2 characters at a time, so fscanf becomes huge, but we save ourselves some trouble later on.
{{< highlight c >}}

    while (19 == fscanf(f,
                        " %2hhx%2hhx%2hhx%2hhx%2hhx%2hhx%2hhx%2hhx%2hhx%2hhx%2hhx%2hhx%2hhx%2hhx%2hhx%2hhx %*x %x %x %*x %s",
                        &ipv6[0],
                        &ipv6[1],
                        &ipv6[2],
                        &ipv6[3],
                        &ipv6[4],
                        &ipv6[5],
                        &ipv6[6],
                        &ipv6[7],
                        &ipv6[8],
                        &ipv6[9],
                        &ipv6[10],
                        &ipv6[11],
                        &ipv6[12],
                        &ipv6[13],
                        &ipv6[14],
                        &ipv6[15],
                        &prefix,
                        &scope,
                        dname)) {
{{< /highlight >}}

We only want the entries for current interface, so we skip if the name does not match. Than we try to convert IPv6 to string using *inet_ntop*.
{{< highlight c >}}
        if (strcmp(ifname, dname) != 0) {
            continue;
        }
        if (inet_ntop(AF_INET6, ipv6, address, sizeof(address)) == NULL) {
            continue;
        }
{{< /highlight >}}

We want scope to be in readable format, so we use switch to differentiate different values:
{{< highlight c >}}
#define IPV6_ADDR_GLOBAL        0x0000U
#define IPV6_ADDR_LOOPBACK      0x0010U
#define IPV6_ADDR_LINKLOCAL     0x0020U
#define IPV6_ADDR_SITELOCAL     0x0040U
#define IPV6_ADDR_COMPATv4      0x0080U
        switch (scope) {
        case IPV6_ADDR_GLOBAL:
            scopestr = "Global";
            break;
        case IPV6_ADDR_LINKLOCAL:
            scopestr = "Link";
            break;
        case IPV6_ADDR_SITELOCAL:
            scopestr = "Site";
            break;
        case IPV6_ADDR_COMPATv4:
            scopestr = "Compat";
            break;
        case IPV6_ADDR_LOOPBACK:
            scopestr = "Host";
            break;
        default:
            scopestr = "Unknown";
        }
{{< /highlight >}}

Finally we print the info, close the file and we are done.
{{< highlight c >}}
        printf("IPv6 address: %s, prefix: %d, scope: %s\\n", address, prefix, scopestr);
    }
    fclose(f);
}
{{< /highlight >}}

## The whole code
{{< highlight c >}}
#include <stdio.h>
#include <string.h>
#include <net/if.h>
#include <sys/ioctl.h>
#include <arpa/inet.h>
#include <dirent.h>

#define IPV6_ADDR_GLOBAL        0x0000U
#define IPV6_ADDR_LOOPBACK      0x0010U
#define IPV6_ADDR_LINKLOCAL     0x0020U
#define IPV6_ADDR_SITELOCAL     0x0040U
#define IPV6_ADDR_COMPATv4      0x0080U

void parse_inet6(const char *ifname) {
    FILE *f;
    int ret, scope, prefix;
    unsigned char ipv6[16];
    char dname[IFNAMSIZ];
    char address[INET6_ADDRSTRLEN];
    char *scopestr;

    f = fopen("/proc/net/if_inet6", "r");
    if (f == NULL) {
        return;
    }

    while (19 == fscanf(f,
                        " %2hhx%2hhx%2hhx%2hhx%2hhx%2hhx%2hhx%2hhx%2hhx%2hhx%2hhx%2hhx%2hhx%2hhx%2hhx%2hhx %*x %x %x %*x %s",
                        &ipv6[0],
                        &ipv6[1],
                        &ipv6[2],
                        &ipv6[3],
                        &ipv6[4],
                        &ipv6[5],
                        &ipv6[6],
                        &ipv6[7],
                        &ipv6[8],
                        &ipv6[9],
                        &ipv6[10],
                        &ipv6[11],
                        &ipv6[12],
                        &ipv6[13],
                        &ipv6[14],
                        &ipv6[15],
                        &prefix,
                        &scope,
                        dname)) {

        if (strcmp(ifname, dname) != 0) {
            continue;
        }

        if (inet_ntop(AF_INET6, ipv6, address, sizeof(address)) == NULL) {
            continue;
        }

        switch (scope) {
        case IPV6_ADDR_GLOBAL:
            scopestr = "Global";
            break;
        case IPV6_ADDR_LINKLOCAL:
            scopestr = "Link";
            break;
        case IPV6_ADDR_SITELOCAL:
            scopestr = "Site";
            break;
        case IPV6_ADDR_COMPATv4:
            scopestr = "Compat";
            break;
        case IPV6_ADDR_LOOPBACK:
            scopestr = "Host";
            break;
        default:
            scopestr = "Unknown";
        }

        printf("IPv6 address: %s, prefix: %d, scope: %s\n", address, prefix, scopestr);
    }

    fclose(f);
}

void parse_ioctl(const char *ifname)
{
    int sock;
    struct ifreq ifr;
    struct sockaddr_in *ipaddr;
    char address[INET_ADDRSTRLEN];
    size_t ifnamelen;

    /* copy ifname to ifr object */
    ifnamelen = strlen(ifname);
    if (ifnamelen >= sizeof(ifr.ifr_name)) {
        return ;
    }
    memcpy(ifr.ifr_name, ifname, ifnamelen);
    ifr.ifr_name[ifnamelen] = '\0';

    /* open socket */
    sock = socket(PF_INET, SOCK_DGRAM, IPPROTO_IP);
    if (sock < 0) {
        return;
    }

    /* process mac */
    if (ioctl(sock, SIOCGIFHWADDR, &ifr) != -1) {
        printf("Mac address: %02x:%02x:%02x:%02x:%02x:%02x\n",
                (unsigned char)ifr.ifr_hwaddr.sa_data[0],
                (unsigned char)ifr.ifr_hwaddr.sa_data[1],
                (unsigned char)ifr.ifr_hwaddr.sa_data[2],
                (unsigned char)ifr.ifr_hwaddr.sa_data[3],
                (unsigned char)ifr.ifr_hwaddr.sa_data[4],
                (unsigned char)ifr.ifr_hwaddr.sa_data[5]);
    }

    /* process mtu */
    if (ioctl(sock, SIOCGIFMTU, &ifr) != -1) {
        printf("MTU: %d\n", ifr.ifr_mtu);
    }

    /* die if cannot get address */
    if (ioctl(sock, SIOCGIFADDR, &ifr) == -1) {
        close(sock);
        return;
    }

    /* process ip */
    ipaddr = (struct sockaddr_in *)&ifr.ifr_addr;
    if (inet_ntop(AF_INET, &ipaddr->sin_addr, address, sizeof(address)) != NULL) {
        printf("Ip address: %s\n", address);
    }

    /* try to get broadcast */
    if (ioctl(sock, SIOCGIFBRDADDR, &ifr) != -1) {
        ipaddr = (struct sockaddr_in *)&ifr.ifr_broadaddr;
        if (inet_ntop(AF_INET, &ipaddr->sin_addr, address, sizeof(address)) != NULL) {
            printf("Broadcast: %s\n", address);
        }
    }

    /* try to get mask */
    if (ioctl(sock, SIOCGIFNETMASK, &ifr) != -1) {
        ipaddr = (struct sockaddr_in *)&ifr.ifr_netmask;
        if (inet_ntop(AF_INET, &ipaddr->sin_addr, address, sizeof(address)) != NULL) {
            printf("Netmask: %s\n", address);
        }
    }

    close(sock);
}

int main(void)
{
    DIR *d;
    struct dirent *de;

    d = opendir("/sys/class/net/");
    if (d == NULL) {
        return -1;
    }

    while (NULL != (de = readdir(d))) {
        if (strcmp(de->d_name, ".") == 0 || strcmp(de->d_name, "..") == 0) {
            continue;
        }

        printf("Interface %s\n", de->d_name);

        parse_ioctl(de->d_name);

        parse_inet6(de->d_name);

        printf("\n");
    }

    closedir(d);

    return 0;
}
{{< /highlight >}}
