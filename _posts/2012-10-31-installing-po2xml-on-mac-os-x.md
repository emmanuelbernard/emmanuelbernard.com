---
title: Installing po2xml and xml2pot on Mac OS X
author: Emmanuel Bernard
tags: [tool, Mac OS X]
date: 2012-10-31
---
Hibernate documentation system uses po2xml and xml2pot to build translations.
Unfortunately, Homebrew does not have a formula for it and I
don't think I have the knowledge to work on such thing.

The solution is to install Macport. There is a nice UI
[installer][macport-installer]. Make sure to chose the one specific
to your Max OS X version.

MacPort does change your `.bash_profile`. Because I want to give
Homebrew's executable priority, I make sure to put Macport
changes after homebrew in the `PATH` variables.

Update Macport

    sudo port -v selfupdate

Then install po2xml. Unfortunately, po2xml does not come as standalone
package, you have to install all of KDE

    sudo port install kdesdk4

Then wait for freaking ever for everything to compile. By the way, source
packaging is not eco-friendly. Think about the amount of CPU needed every
time you update some package...

Once that is done, add po2xml and xml2pot to your path

    PATH=$PATH:/Applications/MacPorts/KDE4/po2xml.app/Contents/MacOS
    PATH=$PATH:/Applications/MacPorts/KDE4/xml2pot.app/Contents/MacOS

And you are good to go!

[macport-installer]: http://www.macports.org/install.php
