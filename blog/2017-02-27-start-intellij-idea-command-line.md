---
title: Start IntelliJ IDEA from the command line
author: Emmanuel Bernard
layout: blog-post
tags: ["java", "ide", "tool"]
---
You can start IntelliJ IDEA from the command line which is handy when you live in a terminal like me.
But you need to enable that feature.

Open IntelliJ IDEA, go to `Tools->Create Command-Line Launcher...` and optionally adjust the location and name of the script that will start IntelliJ IDEA.
Voilà!
Now from your command line, you can type:

* `idea .` to open the project in the current directory
* `idea pom.xml` to import the Maven project
* `idea diff <left> <right>` to launch the diff tool.

The generated script has an annoying flaw though, it does reference your preference and cache directories in a hard coded fashion.
And for some reason the IntelliJ folks embed the version number in these directories (e.g. `IdeaIC2016.2`)
That's annoying as it will likely break the minute you move to another (major?) version.

[Antonio](https://antoniogoncalves.org) has a solution for that which is a simpler and more forgiving script in good anti-fragile fashion.
The script is not generic and only runs for macOS.

    #!/bin/sh
     
    # check for where the latest version of IDEA is installed
    IDEA=`ls -1d /Applications/IntelliJ\ * | tail -n1`
    wd=`pwd`
    
    # were we given a directory?
    if [ -d "$1" ]; then
    #  echo "checking for things in the working dir given"
      wd=`ls -1d "$1" | head -n1`
    fi
    
    # were we given a file?
    if [ -f "$1" ]; then
    #  echo "opening '$1'"
      open -a "$IDEA" "$1"
    else
        # let's check for stuff in our working directory.
        pushd $wd > /dev/null
    
        # does our working dir have an .idea directory?
        if [ -d ".idea" ]; then
    #      echo "opening via the .idea dir"
          open -a "$IDEA" .
    
        # is there an IDEA project file?
        elif [ -f *.ipr ]; then
    #      echo "opening via the project file"
          open -a "$IDEA" `ls -1d *.ipr | head -n1`
    
        # Is there a pom.xml?
        elif [ -f pom.xml ]; then
    #      echo "importing from pom"
          open -a "$IDEA" "pom.xml"
    
        # can't do anything smart; just open IDEA
        else
    #      echo 'cbf'
          open "$IDEA"
        fi
    
        popd > /dev/null
    fi

[The GitHub gist version of this script](https://gist.github.com/agoncal/8cfabe8e3e261c068902a95443d22079).
It does not offer the call to IDEA's `diff` though.
I'm from an era where we did resolve `>` based diff conflicts in Notepad so that does not bother me much.

I think I'll go for Antonio's solution, that will avoid some nasty WTF moments when the preference directory moves and I will have forgotten all of this.
