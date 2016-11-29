+++
date = "2013-11-29T21:42:35+01:00"
title = "Game cubes"
draft = false
categories = ["Electronics"]
tags = ["AVR"]
images = ["/images/electronics/game-cubes/gallery/elektronski-goli-29.JPG"]
+++

{{< image src="/images/electronics/game-cubes/gallery/elektronski-goli-29.JPG" float="left" >}}
Game cubes consist of 4 wooden blocks. Primery box with LED display, slave box connected by RF link and two secondary boxes connected only with IR signals. Pairs of boxes are connected with 5 IR lines, with which we can detect passage. The two pairs are connected with CC1101 wireless module. Each box has a 2S LiPo battery and a soft power button. On primary box is an LED display. Boxes are controller with power buttons.

Because IR signals travel everywhere, only one line can be active at a time. A pause has to be made between pulses, because TSOP1838 used for IR detection has a bit of delay. Because of sun interference we need metal tubes in front of LEDs and sensors.

Cubes have 3 modes: goal counting, stop watch and alarm.

## Schematics
- [Primary box](/images/electronics/game-cubes/primary_box.pdf)
- [Secondary box](/images/electronics/game-cubes/secondary_box.pdf)
- [Display](/images/electronics/game-cubes/led_display.pdf)

## Eagle
[Files](/images/electronics/game-cubes/elektronski-goli.zip)

## Software
- https://github.com/matematik7/avr-game-cube-master
- https://github.com/matematik7/avr-game-cube-slave
- https://github.com/matematik7/avr-game-cube-secondary

## Images
{{< gallery "/images/electronics/game-cubes/gallery/" >}}
