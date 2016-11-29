+++
date = "2014-12-28T18:12:35+01:00"
title = "Project nativity scene 2014"
draft = false
categories = ["Electronics"]
tags = ["AVR", "Raspberry Pi", "I2C"]
images = ["/images/electronics/jaslice/celota.jpg"]
+++

{{< image src="/images/electronics/jaslice/celota.jpg" >}}
The nativity scene is a several years project, that I upgrade every year. This year I decided they are complex enough to describe on my website.

First a few pictures of the scene, followed by the description of electronics that run the thing.
{{< images "/images/electronics/jaslice/img_0041.jpg" "/images/electronics/jaslice/img_0042.jpg" "/images/electronics/jaslice/img_0044.jpg" "/images/electronics/jaslice/img_0045.jpg" "/images/electronics/jaslice/img_0048.jpg" "/images/electronics/jaslice/nebo/img_0039.jpg" >}}

## Control
The system is controlled by Raspberry Pi. It provides a web interface for the system. The RPi communicates with all parts of the system via an I2C bus. Because longer ethernet cables are used, I use P82B96 ics, that convert I2C communication to 12V. I have a hub, that contains 10 rj45 jacks, that supply 12V and 5V power and communication.
{{< images "/images/electronics/jaslice/kontrola.jpg" "/images/electronics/jaslice/hub/img_0003.jpg" "/images/electronics/jaslice/hub/img_0004.jpg" >}}

## Sky with constellations

The oldest part of the system is sky with constellations. It has 20 chains of LEDs, that are fixed on a plywood and covered with blue fabric. The chains are joined in 10 channels, that are individually controlled by an AVR microcontroller. This was originally a standalone system, that was upgraded with I2C control.
{{< images "/images/electronics/jaslice/nebo/img_0039.jpg" "/images/electronics/jaslice/nebo/img_0040.jpg" "/images/electronics/jaslice/nebo/ozvezdja.jpg" "/images/electronics/jaslice/nebo/img_0025.jpg" "/images/electronics/jaslice/nebo/img_0026.jpg" "/images/electronics/jaslice/nebo/img_0027.jpg" "/images/electronics/jaslice/nebo/img_0028.jpg" "/images/electronics/jaslice/nebo/img_0037.jpg" >}}

## Falling stars

Last year I added falling stars to the sky. They are made of two PCBs with 16 LEDs each. LEDs are controller with TLC5925 ics, that get the data from avr microcontroller. This year I have 3 falling stars on the sky.
{{< images "/images/electronics/jaslice/utrinki/img_0049.jpg" "/images/electronics/jaslice/utrinki/img_0005.jpg" "/images/electronics/jaslice/utrinki/img_0006.jpg" "/images/electronics/jaslice/utrinki/img_0007.jpg" "/images/electronics/jaslice/utrinki/img_0008.jpg" "/images/electronics/jaslice/utrinki/img_0011.jpg" "/images/electronics/jaslice/utrinki/img_0012.jpg" "/images/electronics/jaslice/utrinki/img_0032.jpg" >}}

## Moon
This year I added a moon. Moon is made of 5 EL Panels, that can light up in different lunar phases. Each panel is connected to a high voltage power supply via a relay, that are controlled over ULN2003 ic by avr microcontroller.
{{< images "/images/electronics/jaslice/luna/img_0023.jpg" "/images/electronics/jaslice/luna/img_0024.jpg" "/images/electronics/jaslice/luna/img_0009.jpg" "/images/electronics/jaslice/luna/img_0010.jpg" "/images/electronics/jaslice/luna/img_0021.jpg" "/images/electronics/jaslice/luna/img_0030.jpg" >}}

### Different lunar phases
{{< images "/images/electronics/jaslice/luna/img_0050.jpg" "/images/electronics/jaslice/luna/img_0051.jpg" "/images/electronics/jaslice/luna/img_0052.jpg" "/images/electronics/jaslice/luna/img_0053.jpg" "/images/electronics/jaslice/luna/img_0054.jpg" "/images/electronics/jaslice/luna/img_0055.jpg" "/images/electronics/jaslice/luna/img_0056.jpg" "/images/electronics/jaslice/luna/img_0057.jpg" >}}

## Fires
In the nativity scene are fires, that are made of 12 dual color LEDs. LEDs are red-yellow and can be set any color. The twinkle rate and intensity can also be set.
{{< images "/images/electronics/jaslice/ogenjcki/img_0043.jpg" "/images/electronics/jaslice/ogenjcki/img_0013.jpg" "/images/electronics/jaslice/ogenjcki/img_0014.jpg" "/images/electronics/jaslice/ogenjcki/img_0015.jpg" >}}

## Power sockets
Three controllable power sockets are used for controlling mains appliances, e.g. water pump.
{{< images "/images/electronics/jaslice/vticnice/DSC_0120.JPG" "/images/electronics/jaslice/vticnice/DSC_0122.JPG" "/images/electronics/jaslice/vticnice/DSC_0123.JPG" "/images/electronics/jaslice/vticnice/DSC_0124.JPG" "/images/electronics/jaslice/vticnice/img_0016.jpg" "/images/electronics/jaslice/vticnice/img_0019.jpg" >}}

## Problems
Of course it did not go without problems. A faulty ethernet cable caused a short circuit on one of the supply lines. The ethernet socket melted and the cable was stuck in it. Luckily I had a spare connector for replacement. I also added fuses to prevent similar thing in the future.
{{< images "/images/electronics/jaslice/tezave/img_0033.jpg" "/images/electronics/jaslice/tezave/img_0034.jpg" "/images/electronics/jaslice/tezave/img_0035.jpg" >}}
