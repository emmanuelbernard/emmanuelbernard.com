---
title: Homebrew formulae for Mutt with sidebar and trash patches
author: Emmanuel Bernard
tags: ["Mac OS X", "tool"]
date: 2016-03-15
---
[Homebrew](http://brew.sh)'s Mutt formulae is in a bit of a disarray.
I can't blame them as [Mutt](http://www.mutt.org) has a bunch of not quite maintained
patches not quite fully compatible with one another.

The problem is that some of these patches are very very useful.
I have created a tap to maintain Mutt with the two key patches I use:

- sidebar
- trash

At the time of writing, it uses Mutt 1.5.24 but I might update it.
To use the formulae, do:

    brew tap emmanuelbernard/mutt
    brew install emmanuelbernard/mutt/mutt
    
    // or alternatively

    brew install https://raw.githubusercontent.com/emmanuelbernard/homebrew-mutt/master/Formula/mutt.rb

I personally build them with the following options

    brew install emmanuelbernard/mutt/mutt --with-sidebar-patch --with-trash-patch --with-gpgme --with-s-lang

`s-lang` supposedly has better support for color schemes like [Solarized](http://ethanschoonover.com/solarized).

You can find the code at <https://github.com/emmanuelbernard/homebrew-mutt>.
