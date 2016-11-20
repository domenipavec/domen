+++
date = "2014-06-01T21:17:35+01:00"
title = "GSoC 2014 Update: Raspberry Pi Dashboard - Week 2"
draft = false
categories = ["Programming"]
tags = ["GSoC"]
+++

This week I was working on basic modules of the REST api. Values are logically grouped in different modules. Each module collects its values, and the code from last week takes care of user management and parsing the values to JSON. I have also documented the REST api interface with descriptions of all values that are currently available.

Modules that I have developed:

- **memory** - info about memory and swap usage
- **cpu** - info about cpu usage, load average, uptime and temperature
- **network** - info about available network interfaces, their IP, MAC addresses and number of bytes/packets send and received on each interface
- **storage** - info about mounted devices, used space on device and throughput read and write info

I spent quiet some time developing code for gathering network device information, so I wrote a short guide with code for anyone interested: [Get IP, IPv6 and MAC addresses using ioctl and procfs on Linux in C]({{< ref "get-ip-ipv6-and-mac-addresses-using-ioctl-and-procfs-linux-c.md" >}}).

Next week I will start developing JavaScript library for accessing the REST api.

Code is on github.

## Work by days:
- 26.5.2014
	- Implemented memory module.
	- Added buffer function for modules
- 27.5.2014
	- Removed buffer function and restructured parsing code.
	- Created CPU module
	- Created network module
- 28.5.2014
	- Added duda_request_t as argument to module's get_value function.
	- Added iface filter to network module
	- Listing of modules when accessing /api/
- 29.5.2014 - Added listing of ip, mac and ipv6 addresses to network module
- 30.5.2014
	- Created storage module
	- Documentation for the REST api
