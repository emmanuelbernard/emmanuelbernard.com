---
title: Get notified when terminal commands end
author: Emmanuel Bernard
tags: [tool]
date: 2015-03-26
---
Here is a tiny little tool that will speed up the multi-tasking life of terminal users:
be notified when a command finishes.

How many times have you started a command in the terminal to realise that it will take a while?
How many times did you then move to emails or twitter "in the mean time"?
How many times have you forgotten about it and read our twitter feed for 30 minutes aka 25 minutes longer than the actual command?

This small tool solves that problem.

    #!/bin/bash
    # Notify you when a task is done
    #
    # $ notify mvn clean install
    # runs 'mvn clean install'
    # notify you when it's done
    #
    # A notification is sent upon build completion if your OS supports it:
    # - on Mac OS, install Growl and grownnotifier
    # - on Linux, install send-notify
    #
    # Released under the WTFPL license version 2 http://sam.zoy.org/wtfpl/
    #
    # Copyright (c) 2010 David Gageot
    # Copyright (c) 2011 Sanne Grinovero
    # Copyright (c) 2010-2015 Emmanuel Bernard
    
    say() {
        if [ `uname -s` == "Darwin" ]; then 
            # On Mac OS, notify via Growl
            which -s growlnotify && growlnotify --name "Command line" --sticky --message "'$CMD_DISPLAY' has finished - $RESULT"
        fi
        if [ `uname -s` == "Linux" ]; then
            # On Linux, notify via notify-send
            which notify-send && notify-send "'$CMD_DISPLAY' has finished" "$RESULT"
        fi
    }
    
    if [[ $# -eq 0 ]]; then 
      echo "Usage notify <command to run>"
    else
      CMD_DISPLAY="$@"
    fi
    
    $@
    EXIT_CODE=$?
    
    if [ $EXIT_CODE -eq 0 ]; then
      RESULT="SUCCESS"
      echo $RESULT    
      say
    else
      RESULT="FAILURE"
      echo $RESULT
      say
      exit $EXIT_CODE
    fi


When you want to monitor the completion of a command, simply prefix it with `notify`.

    # Longish command you will forget about
    rake clean publish
    
    # Longish command you will be notified of upon completion
    notify rake clean publish

A few things I particularly like:

* I can decide which command to monitor
* it reports the status (success or failure)

[No more excuse](https://xkcd.com/303/) for Twitter or other time sinkers.
