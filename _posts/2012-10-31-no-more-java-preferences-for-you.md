---
title: No more Java Preferences for you!
author: Emmanuel Bernard
tags: [Java, Mac OS X]
date: 2012-10-31
---
Java on Max OS X is a moving target to say the least since stewardship
has moved from Apple to Oracle. I had a lot of trouble to make Eclipse
run on my machine making me feel like a customer of 
[The Soup Nazi](http://en.wikipedia.org/wiki/The_Soup_Nazi) in Seinfeld.

Let me explain some changes.

## The failure

I tried to run _Eclipse Juno_ on my machine and got the following encouraging
error

> The JVM shared library /Library/Java/JavaVirtualMachines/openjdk-1.7-x86_64
> does not contain the JNI_CreateJavaVM symbol

Eclipse always uses the system default JVM on Mac OS X and as far as I know
you can't change that. In theory that's not a big deal, you just have to change
the default JVM to use via the _Java Preferences_ application.

## No more Java Preferences application

Apple recently removed the _Java Preferences_ application from Mac OS X
as they deemed it to be useless. In a sort of twisted way - aka we don't
care about developers - they were right.

It has been replaced in the Java Oracle distribution by a panel in
_System Preferences_ under the _Other_ category. Well except that
this panel only deals with Oracle JVMs. So if you happen to have
OpenJDK or any other JVM installed, you can not choose (or "unchoose")
them.

The side effect for me was that OpenJDK was selected as the default JVM
and this created this user friendly error when starting Eclipse.

Hats off to [Henri Gomez](http://blog.hgomez.net) for helping me find a
way out. You basically need to
go to `/Library/Java/JavaVirtualMachines` and remove OpenJDK

    sudo rm -fR openjdk-1.7-x86_64

In my case I actually moved it somewhere else.
What if I want to use OpenJDK too? __F**k you!__ told me Orapple.

The combination of:

- Apple stopping bundling the JVM
- Oracle coming up with an Oracle only replacement
- Apple removing a useful tool

makes the open JDK community at large feel quite unwelcome. So much for
an open source project and community where both Apple and Oracle
are major stakeholders.

By the way that's not the only glitch I've experienced when moving from the
Apple VM to Oracle VM. `JAVA_HOME` now points to the JDK instead of the JRE.

Anyways, moving along.
