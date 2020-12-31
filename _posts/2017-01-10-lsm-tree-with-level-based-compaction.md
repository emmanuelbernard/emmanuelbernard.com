---
title: Log-Structured Merge Tree with level-based compaction
author: Emmanuel Bernard
tags: ["computer science"]
date: 2017-01-10
---
It is surprisingly hard to find a good explanation to level-based compaction of a [Log-Structured Merge Tree](https://en.wikipedia.org/wiki/Log-structured_merge-tree).
It turns out that it is best explained in [LevelDB](https://github.com/google/leveldb)'s documentation.
You can find the (html) details [here](https://github.com/google/leveldb/blob/master/doc/impl.md).

This blog post is a collection of key concepts I did not grasp initially.
Sort of a mental note for me.
It should bring you nicely from standard size-based compaction LSM to level-based compaction.

Levelled LSM structures are useful as they  limit greatly the number of files to access when reading a given key.
`nbrOfLevel0Files + (n-1)` where `n` is the number of levels.

You still have levels but level 1 and above have different behaviors:

* there is the in memory level + append only log (non ordered)
* there is level 0 which behaves like a normal LSM level (each file is ordered but has overlapping keys)
* level 1 and above have files containing non overlapping keys

I call _segment_, a given file at a LSM level (containing ordered keys), it is called _sstable_ usually.
Why do I call it segment?
I come from Lucene and I have read Dune and know of sandworms.
Plus segment is a much nicer word than sstable :)

The non-overlapping ranges for a given level `L` are not fixed in stone and are recomputed each time a compaction from level `L` to level `L+1` occurs.
Big ahah moment for me.

When a level `L` is merged into level `L+1` (for `L >= 1`), one segment of `L` and all overlapping segments of `L+1` are read.
New segments are created at level `L+1` from this data and a new level `L+1` is created from these new segments and the existing non-overlapping ones.
When compaction is done, the manifest (reference of segments) is updated and old segments are deleted.
From that data, new segments at a given level are created based on:

* size (e.g. every 2 MB)
* as soon as the key range of a given segment overlaps with more than 10 segments at `L+2`

Tombstones are kept around until the last level (to make sure we hide the possibly older values in higher levels).
They claim that they remove tombstones for a given key if no higher level has a segment with whose range
overlaps the current key but that looks like a minor optimisation.

In LevelDB, the max size of a level is `10^L MB` (e.g. 10 MB for 1, 100MB for 2 etc).
Levels do increase in size exponentially though each segment is of fixed size (at least not exploding).

All this compaction only involves sequential reads and sequential writes (when done right).

I'm well aware that many improvements have been built atop this initial approach but they all rely on you understanding this first cornerstone improvement :)

Cool stuff.
