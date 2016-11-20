+++
date = "2014-07-21T00:00:35+01:00"
title = "GSoC 2014 Update: Raspberry Pi Dashboard - Week 9"
draft = false
categories = ["Programming"]
tags = ["GSoC"]
+++

This week I tried 2 different libraries for GPIO on Raspberry Pi: [bcm2835](http://www.airspayce.com/mikem/bcm2835/) and [WiringPi](http://wiringpi.com/).

I've decided to use WiringPi, because it allows consistent pin numbers across different RPi versions, i2c, SPI, serial, software PWM, tone and several extensions. I've installed the library, spent some time testing it out and figured out how it is going to fit in the REST api.

Next week I will integrate the GPIO, i2c, SPI and serial in the REST api and the Dashboard.

Code is on [github](https://github.com/matematik7/duda-raspberry).
