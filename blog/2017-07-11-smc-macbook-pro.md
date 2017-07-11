---
title: MacBook Pro and the SMC cure
author: Emmanuel Bernard
layout: blog-post
tags: ["apple", "Mac OS X"]
---
The physical parts of your MacBook (fans, ports etc) behaves erratically? I might have a cure.

## A story of crashes

My MacBook Pro was getting on my nerves lately.
When plugged to my Thunderbold dock and thus my **external monitor**, my laptop would **crash randomly**.
Sometimes, once every 2 weeks, sometimes several times a day.
I tried many things, like not starting all of the utilities one usually uses to verify that they were not involved but I could not find a culprit.

Then one day, I saw that one of my **Thunderbolt port would not accept my Thunderbolt-Ethernet adaptor** while the other did (the connection did not show up).
I was convinced my laptop had a faulty hardware and needed repair.

## System Management Controller to the rescue

So I called Apple and the support person told me to try something first:
**reset the SMC** (System Management Controller) by pressing `Shift+Control+Option` on the left side and the power button for 10 seconds while starting the computer (after a full shutdown) -
[full procedure here](https://support.apple.com/en-us/HT201295).

And voila, all my problems are gone.

## What is SMC anyways?

It turns out that there is a chip that manages a lot of hardware inside your laptop: fans, LEDs, IO ports, external displays, battery, etc.
So slapping that chip on the face (figuratively) might make a lot of things go better.
