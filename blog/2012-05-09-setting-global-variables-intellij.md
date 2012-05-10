---
title: Setting global environment variables in IntelliJ IDEA and other test config goodies
author: 'Emmanuel Bernard'
layout: blog-post
tags: [ tool, ide ]
--- 
When you run a test from IntelliJ idea, you can customize some of
the settings by selecting the list of tests and click `Edit Configurations`.
From there you can change things like:

- under which module classpath the test is run
- the working directory the test should run from
- virtual machine parameters
- specific environment variables to use

In Hibernate OGM, we use the same test site for all NoSQL solutions. Changing the
module classpath is useful in this situation. We also let you refine via an environment
variable which hostname runs say MongoDB.

Unfortunately in Mac OS X, graphic applications do not inherit your `.bash_profile` config. I know, stupid,
but what can you do against the Empire? Workaround!

You can set environment variables from each test but it gets tedious quickly. Alternatively, you can set
an environment variable globally in IntelliJ - what they call parent environment variables. 
Go to `Preferences` and search for `Path Variables`.
Set your global environment variables here and you are good to go. Note that you can ask a test not to
inherit these global variables if you want to - in the test configuration.

- - -
__Update:__  
It turns out I was wrong. Paths Variables is not where global environment variables can be set. If you
know where, please let me know.

__Update 2:__  
To set an environment variable visible by applications in Mac OS X, use

    launchctl setenv MYPATH myvar

then restart your IDE (you might need to log out and back in as well).

Thanks [@aagahi](http://twitter.com/aagahi) for the info. This is not great as it's remote from my IDE but at least that works.
BTW, `launchctl` is supposed to set the data in `/etc/lanuchd.conf` or `$HOME/.launchd.conf`. Not on my
system. If anyone knows where the data is put, I'm interested.

- - -

Notes to JetBrains:

- your environment variable UI is plain counter productive: either give us a text free area or make tabs and co working
- an option to inherit the `.bash_profile` configuration would be awesome :)

