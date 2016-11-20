+++
date = "2012-04-02T09:05:35+01:00"
title = "Avr lpt programmer"
draft = false
categories = ["Electronics"]
tags = ["AVR"]
image = "/images/electronics/lpt-avr-programmer/slika.JPG"
+++

{{< image src="/images/electronics/lpt-avr-programmer/slika.JPG" float="left" >}}
This programmer is a simple version of STK-200 ISP AVR programmer. I designed it using several schematics from the internet as a basis. It is not my design, I simply combined several designs and designed the pcb.

The programmer can be connected to computer with a lpt cable. It's a very simple design and uses only one IC - the 74hc244 buffer. It's used to convert different voltage levels between computer and the programmed AVR microcontroller. The programmer needs external power from the connected device. The green LED shows when the power is applied. The red LED is supposed to show when the programming is in progress, but for some reason it doesn't work. As I don't really care about that, I've never tried to fix it. With the jumper you can select the base resistor for the transistor, as there were a lot of different arguments about the resistance one should use. I placed the jumper as can be seen in the picture and the programmer works fine. On the output of 74hc244 the circuit has low-pass filters, that are meant to filter out [EMI](http://en.wikipedia.org/wiki/Electromagnetic_interference).

The connector is not the standard ISP.\\
This is the pinout of the connector (on the picture from bottom to top, on the schematics from top to bottom):

1. VCC
2. GND
3. Reset
4. MOSI
5. SCK
6. MISO

Schematics:
{{< image "/images/electronics/lpt-avr-programmer/shema.png" >}}

Components layout on the pcb:
{{< image "/images/electronics/lpt-avr-programmer/elementi.png" >}}

PCB board:
{{< image "/images/electronics/lpt-avr-programmer/pcb.png" >}}

EAGLE files:

- [schematics](/images/electronics/lpt-avr-programmer/lpt_avr_programmer.sch)
- [board](/images/electronics/lpt-avr-programmer/lpt_avr_programmer.brd)
