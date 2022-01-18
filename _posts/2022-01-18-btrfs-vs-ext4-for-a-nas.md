---
title: BTRFS vs Ext4 for a NAS
author: Emmanuel Bernard
tags: [ "infrastructure" ]
header:
  teaser: /images/blog/Btrfs_logo.png
---
Assuming you have a new NAS for your backups and personal files hosting.
Which file system should you use: [BTRFS](https://btrfs.wiki.kernel.org/index.php/Main_Page) or [Ext4](https://ext4.wiki.kernel.org/index.php/Main_Page)?
This is a surprisingly unsettled question on the internet.
You can find very opinionated choices on Reddit or other forums and of course, they do not agree with one another.

Here is my perspective after some reading and some chats with geekier friends.

![](/images/blog/Btrfs_logo.png)

For my backup and personal file hosting usage, I ended up using BTRFS.

## Some plus for Ext4

Sure, Ext4 has been there for a long time so the likelyhood of encountering a bug is really low.
But BTRFS has been on Linux stable since 2013.
Sure Ext4 has less overhead (no copy on write nor checksum) and is therefore theoretically faster and less resource hungry.
So if you are after the most speed for the buck and if your NAS is already doing RAID 5 or more, you could go for Ext4.

## But... Some different plus for BTRFS

Backup is about data safety.
And BRTFS has some really nice features in that area.

**Checksum**: if your file (or some metadata) gets corrupted, the checksum will detect and in some case fix it. You will not propagate bit rot and that's a big deal.

**Snapshot**: if you want to snapshot a directory before trying something crazy with your photos, no need to do a long copy, the snapshot will be really fast. 

**Deduplication of data**: if you copy the same data in different places (He Who Is Not With 5 Copies Of The Same Movie Cast The First Stone), the file system will detect that and points to the same block. That can be a real space saver without having to think about it.

One drawback for BTRFS is that the notion of free space is... complicated but as long as you are not flirting with the disk size limit, things should be fine.

Overall, it feels like a worthwhile bet to go for BTRFS for my data.
Do you have some thoughts on the subject? [Share them with me](https://twitter.com/emmanuelbernard/status/1483369304712220674?s=20).
