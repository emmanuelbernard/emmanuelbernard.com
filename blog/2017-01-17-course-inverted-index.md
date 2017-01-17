---
title: Course on inverted index
author: Emmanuel Bernard
layout: blog-post
tags: ["computer science", "conference"]
---
I gave a three hours course on inverted index to students from [Telecom SudParis](http://www.telecom-sudparis.eu) an engineering school here in... Paris :)
It was fun to refresh my knowledge on all the fundamental structures that make Lucene what it is.

I covered quite some ground for this three hours course (a bit to much to be honest).
Amongst other things: b-tree, inverted index, how analyzers and filters do most of the magic (synonym, n-gram, phonetic approximation, stemming, etc.),
how fuzzy search work in Lucene (state machine based), scoring, log-structured merge and the actual physical representation of a Lucene index
and a few of the tricks the Lucene developers came up with. My list of reference link is pretty rich too.

Without further ado, [here is the presentation](/presentations/inverted-index/).
I tend to be sparse on my slides so make sure to press `s` to see the speaker notes.
The presentation is released under Creative Commons and sources are [on GitHub](http://github.com/emmanuelbernard/presentation-inverted-index/).

It is a first revision and can definitely benefit from a few improvements but there is only so much time per day :)
