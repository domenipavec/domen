+++
date = "2013-07-17T17:04:35+01:00"
title = "Lego robot"
draft = false
categories = ["Electronics"]
tags = ["AVR"]
images = ["/images/electronics/lego-robot/DSC_0075.JPG"]
+++

{{< image src="/images/electronics/lego-robot/DSC_0075.JPG" float="left" >}}
Lego robot is a cheaper alternative to a (too) expensive LEGO NXT. Two [HUB-ee](http://www.creative-robotics.com/About-HUBee-Wheels) wheels are used for driving. It is controlled by two AVR microcontrollers - ATTiny 2313A takes care of PID control, soft-power button and USB communication over ft232, ATMega 32A is user programmable (over USB and ATTiny) and it controls everything else. On main PCB are also a 1117 5v regulator, standard hd44780 2x16 character LCD, a few buttons, a speaker and connectors for external sensors and LEDs. LM393 double comparator is used for low-battery indication and MCU cut-off. Also included are Gens eco 1300mAh 2S 7.4V Li-Po battery and a charger.

Check out my [Lego ball contraption movie](https://www.youtube.com/watch?v=6MSZjHeY0h4) to see it in action.

## Main PCB
- [Schematics](/images/electronics/lego-robot/main.pdf)
- [PCB](/images/electronics/lego-robot/lego-robot-glavna.png)

## Charger
- [Schematics](/images/electronics/lego-robot/batter_charger.pdf)
- [PCB](/images/electronics/lego-robot/lego-robot-charger.png)

## Images
{{< gallery "/images/electronics/lego-robot/gallery/" >}}
