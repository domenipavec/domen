+++
title = "Snow in nativity scene Komenda 2017"
draft = false
date = "2017-12-31T08:20:16+01:00"
categories = ["Electronics"]
tags = ["AVR"]
images = ["/images/electronics/snow-jaslice.jpg"]

+++

{{< youtube 9JvJr9Zzaxw >}}

We had a white Christmas in Komenda this year, even though the weather outside was sunny. Some (over 1000) leds, some AVR control with TLC5925 led controllers and we had a nice snow animation that could be changed to show stars arranged in real constellations. The clouds are made from 5mm white plexiglass and illuminated with leds from begind.

I have been etching my own PCBs for almost 10 years now, but now has come a time, when China is so fast and cheap that making your own PCB just does not make sense. Here in Slovenia material is more expensive than pcbs from <a href="http://www.allpcb.com/setinvite.aspx?inviteid=25847&url=http://www.allpcb.com/">www.allpcb.com</a> including fast DHL shipping. They practically give 5x5cm PCBs away for free ($5.00).

I started this project with simulation in <a href="https://www.pygame.org/">PyGame</a>, just to see what spacing of LEDs is required to make a convincing snow animation. This is a super nice way to verify the design, and the code is a good base for the actual AVR code.

The leds for the snow are arranged in 12x8 grid on a 25x20cm PCBs. They are controlled with TLC5925 and multiplexed in 6 groups. The pcbs can be stacked for different snow fall lengths. The whole assembly has 10 PCBs with 960 leds. Each snowfall under each cloud is controlled by a separate ATTINY841. For the other stars that do not fall on the snow grids I reused the controller from my previous [Project nativity scene 2014]({{< ref "post/electronics/project-nativity-scene-2014.md" >}}). The cloud illumination LEDs are connected to 12V 3 in series with a resistor and controlled by a MOSFET.

All controller boards are interconnected with ethernet cables that carry +5V and +12V and UART for communication. The sequence is controlled by a separated AVR with 2 switches that sends UART commands.

All files are on Github: https://github.com/matematik7/avr-snow
