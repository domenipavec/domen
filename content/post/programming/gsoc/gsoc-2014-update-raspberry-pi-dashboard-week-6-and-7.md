+++
date = "2014-07-06T20:16:35+01:00"
title = "GSoC 2014 Update: Raspberry Pi Dashboard - Week 6 and 7"
draft = false
categories = ["Programming"]
tags = ["GSoC"]
+++

This update is for weeks 6 and 7, because I was on holiday last Thursday through Tuesday and could not write an update last weekend.

In week 6 I fixed a few bugs in Dashboard mostly related to login issues and removed a major memory leak from [angular-google-chart](https://github.com/bouil/angular-google-chart) that was causing the Dashboard to freeze.

In week 7 I added support for logged data to the Dashboard. Now the user can change the time frame for history graphs and appropriate data is loaded from logger backend.

Next week I will write the missing documentation and installation guide. I will also introduce the project on some RPi related forums and try to get some feedback. If I have time I will also start on GPIO interface

Code is on [github](https://github.com/matematik7/duda-raspberry).
