+++
date = "2012-09-23T09:14:35+01:00"
Title = "Lighthouse"
draft = false
categories = ["Electronics"]
tags = ["Tindie"]
image = "/images/electronics/lighthouse/lighthouse.jpg"
+++

{{< image src="/images/electronics/lighthouse/lighthouse.jpg" float="left" >}}
## Description
The circuit uses 555 and 4017 integrated circuits to turn each of the 10 LEDs one after another. The LEDs are placed in a circle to create the effect of spining - just like a light in a lighthouse. The speed can be controlled with a variable resistor.

I am selling on tindie:\\
<a href="https://www.tindie.com/stores/matematik/?ref=offsite_badges&amp;utm_source=sellers_matematik&amp;utm_medium=badges&amp;utm_campaign=badge_large"><img alt="I sell on Tindie" height="104" src="https://d2ss6ovg47m0r5.cloudfront.net/badges/tindie-larges.png" width="200"></a>

## Operation
{{< youtube 8sBn-GJWf3s >}}

## Required skills
- Knowledge of basic electronic components
- Soldering of THT components

## Theory
- LED diodes
- 555 integrated circuit
- 4017 IC

## The kit for building a DIY lighthouse contains following items
{{< image src="/images/electronics/lighthouse/parts.jpg" float="right" >}}

- Main printed circuit board
	- 47k, 10k, 330R resistors
	- 1M variable resistor (trimmer)
	- 100uF, 0,47uF, 100nF capacitors
	- 555, 4017 ICs with sockets
	- 90 degrees header
- LED pcb
	- 10 white LEDs
- Battery connector
- Wire
- Switch

## Assembly

First you have to solder sockets for both ICs on the main pcb (rectangular, green). Be careful to turn them the rightway - the notch has to match the drawing on the pcb.
{{< image "/images/electronics/lighthouse/podnozja.jpg" >}}

Then you should solder the three resistors - values are written on the pcb (color codes of the resistors can be found here). You can turn the resistors either way, it doesn't matter.
{{< image "/images/electronics/lighthouse/resistors.jpg" >}}

Next you add the header and the variable resistor. Solder the shorter part of the header on this pcb (the one with a black plastic on it).
{{< image "/images/electronics/lighthouse/varres.jpg" >}}

Finally solder the capacitors. Values of the capacitors are written on the pcb. Electrolytic capacitors are polarized, so you have to place them the right way. You can place the ceramic capacitor in any orientation.
{{< image "/images/electronics/lighthouse/capacitor.jpg" >}}

On the LED pcb (round, white) solder 10 white LEDs. Bend the LED leads as shown on the picture, than insert them in the PCB. Be careful to insert them the correct way (longer lead of LED is a positive connection, on the pcb a straight line marks a negative connection).
{{< images "/images/electronics/lighthouse/led-pcb.jpg" "/images/electronics/lighthouse/bending.jpg" "/images/electronics/lighthouse/leds-placed.jpg" "/images/electronics/lighthouse/leds-soldered.jpg" >}}

LED pcb solder on the main pcb. Be careful to turn it the right way (inscriptions "by Domen Ipavec" on both pcbs have to be on the same side (see image)).
{{< image "/images/electronics/lighthouse/pcbs-together.jpg" >}}

Solder wires on the switch, main pcb and battery connector. The positive battery connection (red wire) has to go on the positive pcb connection (marked with a "+"). Use the middle and one of the border connections on the switch (see image).
{{< images "/images/electronics/lighthouse/wiring.jpg" "/images/electronics/lighthouse/switch.jpg" >}}

Insert ICs in the sockets. Watch that all pins of IC go nicely in the socket (don't use excesive force, if IC does not want to go in, check all the pins again - bend the pins if necessary). Make sure that the notch on the top of IC matches the notch on the socket and marks on the pcb.
{{< image "/images/electronics/lighthouse/ics.jpg" >}}

Connect a 9V block battery on a battery connector and turn your new lighthouse on. Adjsut the speed with the variable resistor.
{{< image "/images/electronics/lighthouse/battery.jpg" >}}

If the circuit doesn't work check all solder joints and component orientation. If it still doesn't work contact me or describe your problem in the comments.

### Edit 9. september 2014: PCB v2

The new version of PCB for lighthouse is slightly changed:
{{< image "/images/electronics/lighthouse/DSC_2895.JPG" >}}

The R2 resistor is removed, because it is not needed. And the diode D1 is added. When soldering the diode, you have to place it the right way. See the image below to see how the diode must be placed. Notice the white line on PCB and black/silver line on the diode, they must be on the same side.
{{< image "/images/electronics/lighthouse/DSC_2896.JPG" >}}

## House for the light

Now that you have successfully built your light you need a house for it. A few ideas:

- Grey PVC tube
{{< image "/images/electronics/lighthouse/pvc-tube.jpg" >}}
- Paper towel tube
{{< image "/images/electronics/lighthouse/paper-towel-tube.jpg" >}}

If you build your own lighthouse with a better house, post a link to the picture in the comments.

Express your opinion and other things on your mind in the comments.
