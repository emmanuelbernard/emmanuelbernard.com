---
title: Unstuck the unread count of Apple Messages app on Mac OS X
author: Emmanuel Bernard
layout: blog-post
tags: [apple, Mac OS X]
---
The text message synchronization between iOS and Mac OS X devices is very useful.
That is until one of the unread count is stuck.
There is nothing more irritating than a false unread badge.

It has happened to me on Apple Messages (iMessages) in Max OS X Yosemite.
The message would "unread" itself in front of my eyes.
I deleted the message, that solved that part.

But the unread count remained at 1.
I fumed for a couple of days until I found the solution.
Open your `Terminal` application (in `Applications/Utilities`) and type

    killall Dock

The incorrect unread count disappeared.
I can sleep now.
