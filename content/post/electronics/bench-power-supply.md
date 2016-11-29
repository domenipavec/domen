+++
date = "2012-09-05T02:08:35+01:00"
title = "Bench power supply"
draft = false
categories = ["Electronics"]
images = ["/images/electronics/supply/napajalnik1.jpg"]
+++
<div class="clearfix">
{{< image src="/images/electronics/supply/napajalnik1.jpg" float="left" >}}
I finally managed to finish my first adjustable bench power supply, that I designed a long time ago when I was just beginning in the field of electronics. That is why it is not the best power supply possible, but it will satisfy most of my needs.
</div>

### Advantages:
- Preselected commonly used voltages and an option to set voltage accurately with a 10-turn potentiometer
- Current limit
- Linear regulator
- Clear and accurate current and voltage meter display
- Small dimensions
- Nice look for a DIY
- Fast and simple on/off switch for output voltage with a simple button

### Disadvantages:
- Because it has only one transformer winding with quiet high voltage (30V) and is linearly regulated a lot of power and heat is produced so current is limited to about 1.5A
- A lot of expensive components used, especially in volt and amper meters - with the use of microcontroller it could have been done a lot cheaper (but this was designed before I mastered those...)

Because of the weaknesses in design and very specific enclosure I will not publish PCBs, but you can get full schematics in pdf: [schematics](/images/electronics/supply/napajalnik.pdf)

### Images
{{< gallery "/images/electronics/supply/gallery/" >}}
