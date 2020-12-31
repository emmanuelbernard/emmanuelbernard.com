---
title: Synology rsync and non standard ports
author: Emmanuel Bernard
tags: [infrastructure]
date: 2016-03-09
---
Recently running rsync to my Synology diskstation stopped working.
I had just changed my default SSH port to a non standard one.
Learn how to fix it.

Synology recommends to change the default SSH port to a non standard one.
What they forgot to tell you is that it will break your ability to rsync into the machine.
Here is a way to fix it.

## The workaround way

One way to fix it is to use the `--rsync-path=/usr/syno/bin/rsync` option.

    rsync -avz --rsync-path=/usr/syno/bin/rsync from-dir/ synology:/volume1/Backups/to-dir

Since you use a non standard SSH port, make sure to also update your `.ssh/config` file to point to the right one.

    
    Host synology
        User alice
        Hostname 192.168.2.34 # my synology IP
        Port 911 # my new SSH port and a nice car

That works around the Synology quirk but it requires to update all your rsync scripts.

## The proper way

Log to the web management console and open the `Backup & Replication` application.
Select `Backup Services` and update the `SSH encryption port` to match your new SSH port,
in my example `911`.
Note that for some reason the UI forbids certain port numbers.
Make sure to use a non restricted number for your SSH port in the first place or use trial and error.

The SSH port can be changed in the `Control panel`, `Terminal & SNMP`.
