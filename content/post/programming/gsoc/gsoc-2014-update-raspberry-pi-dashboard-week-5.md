+++
date = "2014-06-22T17:33:35+01:00"
title = "GSoC 2014 Update: Raspberry Pi Dashboard - Week 5"
draft = false
categories = ["Programming"]
tags = ["GSoC"]
+++

This week I worked on backend logger. I used [RRDtool](http://oss.oetiker.ch/rrdtool/index.en.html) for storing the information. The information is available through the REST api.

The logger stores CPU-usage, CPU-temperature, memory, network-throughput and storage-throughput information for this hour, day, week, month and year.

Next week I will be working on displaying the logged information in the dashboard. I will also try to provide direct access to RRDtool graphs from the REST api.

Next weekend I am going on holiday from Thursday to Monday and I will not have access to the internet, so I will not post an update next week.

Code is on [github](https://github.com/matematik7/duda-raspberry).
