---
title: Fixing Page Up and Page Down in Mac OS X Terminal.app
author: Emmanuel Bernard
tags: [Mac OS X, tool]
date: 2013-12-12
---
I am currently trying to move from [iTerm](http://www.iterm2.com) to Terminal.app.

Terminal.app maps the Page Up/Down action to move around its buffer.
This is quite annoying when you use text applications with their own buffer
like mutt, vim, weechat etc).

Fortunately, there are two solutions, one easy and one more permanent.

## Use Shift + Page Up

The easy one is to use `Shift` + `Page Up` instead of `Page Up`.
Page Down works the same.
The inconvenient is that you need to train your muscle memory.

## Update the Terminal.app mapping

The more permanent one is to change the Terminal.app behavior.

Go in Preferences->Settings, select the right profile and go in the Keyboard tab.
Find the Page Up entry and edit it to send text. Then type the `ESC` key followed by `[5~`.
For good measure, I mapped Shift + Page Up to the Scroll Page Up action.  
Do the same for page down with the following text `ESC` key followed by `[6~`.

You're all set.
