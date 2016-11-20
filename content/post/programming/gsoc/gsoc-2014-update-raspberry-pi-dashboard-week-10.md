+++
date = "2014-07-27T21:25:35+01:00"
title = "GSoC 2014 Update: Raspberry Pi Dashboard - Week 10"
draft = false
categories = ["Programming"]
tags = ["GSoC"]
+++

This week I developed REST api interface for GPIO (input, output, PWM, square wave and shift in/out), I2C (read/write general, 8-bit and 16-bit registers), SPI (duplex send/receive) and serial (send and read input buffer). I've used [wiringPi](http://wiringpi.com/) library I've tested last week.

I've written full documentation for those modules and added a POST method to jQuery RPiJS plugin.

Next week I will integrate those modules in the Dashboard and try using WebSockets for GPIO and serial connection.

Code is on [github](https://github.com/matematik7/rpi-dashboard).
