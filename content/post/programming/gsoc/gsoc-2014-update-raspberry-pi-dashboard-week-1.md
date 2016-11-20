+++
date = "2014-05-25T21:16:35+01:00"
title = "GSoC 2014 Update: Raspberry Pi Dashboard - Week 1"
draft = false
categories = ["Programming"]
tags = ["GSoC"]
+++
This week I was working on the security part of REST api. I have made HTTP auth login option based on Monkey's auth plugin. I have added the configuration files in which, the access permission are set. Then I have created a mock-up module, and written the code to parse it to JSON.

Besides coding I spent a lot of time thinking how the different parts of code will work together. Another thing that took a lot of time was browsing through DUDA source code, because I found the api documentation is not as good as it could be.

Now I have a working infrastructure for the REST api, with user login and permission configuration.

Next week I will start working on different modules, getting some actual data flowing on the api.

I seem to have done the work that was planned for first two weeks in only one, I guess I am on good track. Had a lot of fun this week, hopefully my success and fun continues :)

Code is on github: https://github.com/matematik7/duda-raspberry

## Work by days:
- 19.5.2014
	- main DUDA callback
	- mk_list of modules
	- calls to unimplemented security functions
- 20.5.2014
	- module.conf configuration file with options for disabling and user access permissions
	- security function that checks user permissions
	- http auth login based on Monkey's auth
- 21.5.2014
	- fixed duda sha1 documentation and session folder problem, submitted pull request
	- fixed http auth login
	- global configuration file
	- started writing documentation in gitbook format
- 22.5.2014
	- stopped using sessions for login
	- global callback path changed to /api/
	- fixed comparison in modules_find
	- values tree structure and module_init function
- 23.5.2014
	- parsing values tree structure to json
	- mock-up memory module for testing
	- parsing of request path

## Some statistics:
I have made 20 git commits, averaging 4 per day.

My code is now 716 lines of code, averaging 143.2 line per day. That is a line of code every 3.352 minutes of my working time.

I have written 383 lines of documentation, but some of it (for structure of config files) is copied from monkey.


