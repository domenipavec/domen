+++
date = "2014-06-15T17:52:35+01:00"
title = "GSoC 2014 Update: Raspberry Pi Dashboard - Week 4"
draft = false
categories = ["Programming"]
tags = ["GSoC"]
+++

This week I was working on the dashboard. It is implemented in [AngularJS](https://angularjs.org/) as a single page JavaScript app. Layout is done using [Bootstrap](http://getbootstrap.com/). I use [Google Charts](https://developers.google.com/chart/) for displaying graphs.

I have implemented pages for CPU, memory, network and storage information with graphs.

Graphs display history information for values, but the app will currently freeze if left open too long, because too much data accumulates. I will fix this problem after the value logger is implemented.

Next week I will work on data logger backend.

Code is on [github](https://github.com/matematik7/duda-raspberry).
