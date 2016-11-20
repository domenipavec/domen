+++
date = "2014-08-10T23:59:35+01:00"
title = "GSoC 2014 Update: Raspberry Pi Dashboard - Week 12"
draft = false
categories = ["Programming"]
tags = ["GSoC"]
+++

This week I first tried implementing WebSockets with RaspberryPi GPIO interrupts. I've written some code, but it seems duda's websockets implementation has some bugs in it, so I did not finish this. The code I've written is now under websocket branch in github.

Instead of using websockets I've written GPIO updating and serial interface in the dashboard using polling the REST api every second.

I've also imporoved several things in dashboard including making the main page modular.

Next week I will be improving the code and documentation. I will also try to make debian package for easier installation.

Code is on [github](https://github.com/matematik7/rpi-dashboard).
