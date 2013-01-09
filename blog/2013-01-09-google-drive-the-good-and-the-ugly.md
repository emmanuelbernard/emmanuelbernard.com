---
title: Google Drive - the good and the ugly
author: Emmanuel Bernard
layout: blog-post
tags: [tool]
---
[Google Drive](http://drive.google.com/) is a bit confusing at first
but the [Dropbox](http://db.tt/JXQsjMt) like feature works reasonably well.
They have a desktop client that works pretty much like the Dropbox
client and syncs your local directory with the cloud.

This is quite handy when your friends have maxed out their Dropbox
quota: Google Drive gives you 5 GB free.
Images you store on Google Plus and files you store on Google
Drive count against your quota. The Google Drive documents do not though.

Not everything is rosy in the Google Drive land though.

## Trash or no trash

Data in your trash is counted as used space. It took me a while to figure
that out and I could not get why my free space was lower that it should
have.
I don't think other services do that.

## Bugs

When you delete a non empty directory and then try to remove it from the trash, well
nothing happens. Someone has forgotten to write the recursive part of the
algorithm :) 
You have to go in each subdirectory and remove files and empty directories.

## Simplistic client and speed

It seems to me that Dropbox syncs faster than Google Drive but I have not
properly benched them so that might be subjective.

What is for sure is that the sync up cues on Google Drive are too simplistic.
It tells you synchronization happens and that's it. Dropbox tells you how many
files are uploaded and downloaded, what is the speed rate for each as well
as the estimated time it will take. It's not gimmicky, it shows progress
to the user.

Overall, I tend to stick with [Dropbox](http://db.tt/JXQsjMt) despite the fact
that it is twice as expensive per GB.
