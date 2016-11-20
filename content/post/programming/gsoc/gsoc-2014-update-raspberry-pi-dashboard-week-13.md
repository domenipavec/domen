+++
date = "2014-08-18T00:32:35+01:00"
title = "GSoC 2014 Update: Raspberry Pi Dashboard - Week 13"
draft = false
categories = ["Programming"]
tags = ["GSoC"]
+++

This week I implemented WebSocket support in the dashboard. WebSockets are now used for GPIO updating and serial port receive. If Websocket is unavailable or does not connect, polling is used as fallback.

I've also improved GPIO dashboard page a bit and written documentation for WebSocket.

Pencils down is tomorrow. I have released version 0.2.0 of my dashboard today. It contains all the features that I've planned to implement in my proposal. I will continue to work on this project outside of GSoC. I have several more features planned that I hope to implement.

Code is on [github](https://github.com/matematik7/rpi-dashboard).
