---
title: macOS powerline and Python interpreters
author: Emmanuel Bernard
layout: blog-post
tags: ["tool", "Mac OS X"]
---
tl;dr; using powerline and having it fail after a homebrew update? Read on.

If you have tuned a bit your terminal in macOS, you might be using [Powerline](https://github.com/powerline/powerline).
It prettities your command line enough to warrant some trouble installing it.
And it does it to vim status lines too.

Now if you also use [homebrew](https://brew.sh), every so often you see something like this when starting a new terminal window

    -bash: /usr/local/bin/powerline-daemon: /usr/local/opt/python/bin/python3.6: bad interpreter: No such file or directory

I always fiddle with things until I get it fixed again.
So here it is reported for posterity.
The Python interpreter has been updated behind your back and the installed modules end up referencing the old interpreter.

For powerline, here are the steps

    pip uninstall -y powerline-status
    brew update && brew upgrade python
    pip install powerline-status

Note that I use Python 2 and not Python 3.
From what I remember, I had troubles making it run properly on v3.

Here is a more generic solution, courtesy of [bnaecker at StackOverflow](https://stackoverflow.com/questions/41470483/how-to-update-macos-python-packages).

    pip list | cut -d " " -f 1 > package-list.txt # Store package names without versions
    pip uninstall -y $(cat package-list.txt) # Cannot use redirection
    brew update && brew upgrade python
    pip install $(cat package-list.txt)

Back to work.
