+++
date = "2014-08-29T11:58:35+01:00"
title = "GSoC 2014: Raspberry Pi Dashboard final report"
draft = false
categories = ["Programming"]
tags = ["GSoC"]
+++

This summer I was developing a web dashboard on Monkey HTTP server for Raspberry Pi. Monkey is a lightweight and powerful web server and development stack for GNU/Linux. It has been designed to be very scalable with low memory and CPU consumption, the perfect solution for embedded devices. Made for ARM, x86 and x64.

I worked on this project as part of GSoC. [Google Summer of Code](https://www.google-melange.com/gsoc/homepage/google/gsoc2014) is a global program that offers students stipends to write code for open source projects.

Raspberry Pi Dashboard is a web based dashboard for monitoring and controlling your Raspberry Pi. It shows information about CPU, memory, network and storage. It also lets you control GPIO, I2C, SPI and other IO functionality.

The backend offers full access to all features through a simple REST api. It is programmed in C using DUDA IO for Monkey web server. The backend implements user based access permission system.

The frontend is based on AngularJS and Bootstrap and offers a modern single page web application. User can view CPU and memory usage, as well as history logs of those and other statistics. Full control of IO functionality is also supported.

Code is on [github](https://github.com/matematik7/rpi-dashboard).
