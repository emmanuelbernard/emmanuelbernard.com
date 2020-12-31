---
title: Encrypt your Dropbox or any folder with EncFS on Mac OS X
author: Emmanuel Bernard
tags: [tool]
date: 2013-07-01
---
This entry describes how to install EncFS on Mac OS X with homebew without
breaking other tools using osxfuse (like TrueCrypt).


## Why EncFS

I have been looking of a smart solution to encrypt a directory file by file.
[TrueCrypt](http://www.truecrypt.org) is an awesome tool but does not play 
well with backups or [Dropbox](http://db.tt/U63QbWK) / Google Drive / SkyDrive like syncing: a TrueCrypt
volume appears like a single big file which has to be synced entirely for
each tiny change.

I just discovered this week-end [EncFS](http://en.wikipedia.org/wiki/EncFS). This
is the exact tool I was looking for:

- encrypts a directory file by file: each file and its name is encrypted
- when one file is changed, only this encrypted file has to be synced
- support for each major platform (Windows, Mac OS X, Linux)

I did choose EncFS over [eCryptfe](http://ecryptfs.org) for its cross platform support.

Note that some [metadata still
leak](http://en.wikipedia.org/wiki/EncFS#Disadvantages) in such system (as
opposed to TrueCrypt) but I can happily live with that.

## Installing EncFS with homebrew without breaking everything else

It took me far too much experimentation for my taste. Basically EncFS in
Homebrew is using [fuse4x](http://fuse4x.github.io) which is incompatible with
[osxfuse](http://osxfuse.github.io) - the now preferred solution. TrueCrypt - that
I still use for disk encryption - happens to be using osxfuse and my attempts to
make osxfuse cohabit with fuse4x and TrueCrypt to cohabit with fuse4x failed.

Here is the working solution:

- install osxfuse via the `.dmg` install - I did install the MacFUSE compatibility layer for good measure
- install TrueCrypt (`.dmg` install)
- install the EncFS version compatible with osxfuse via brew

The last step requires to use a non standard recipe

    brew install https://raw.github.com/jollyjinx/encfs.macosx/master/encfsmacosxfuse.rb

From what I gathered, osxfuse build is too complicated to be made a standard
brew recipe. Too bad as I don't like to manage these externalities.

### Versions

At the time, we are talking about:

- Max OS X 10.7.5
- OSXFUSE 2.5.6
- EncFS 1.7.4

## Using EncFS

Once installed, it is super easy to use

    encfs ~/Dropbox/Private.enc/ ~/Private/
    # or with a custom volume name
    encfs ~/Dropbox/Private.enc/ ~/Private/ -- -o volname="Dropbox private"

mounts the encrypted `~/Dropbox/Private.enc` directory as `~/Private/` and
under the volume name `Dropbox private`.

If you add or change files from `~/Private`, you will see an encrypted equivalent under
`~/Dropbox/Private.enc`.

To unmount, simply do

    umount ~/Dropbox/Private.enc/

That's it. Happy secure data.

_**Update:**_

I was wrong in assuming a few things:

* Dropbox can do partial sync of a big file, so the whole file is not reuploaded
  in its entirety. Reference [here](http://serverfault.com/questions/52861/how-does-dropbox-version-upload-large-files).
* TrueCrypt does encrypt by block so changing one file does not change the whole TrueCrypt container file.
* Mac OS SpaceBundle does roughly like TrueCrypt and split a bundle into files of 8MB each.
  Reference [here](http://crucialsecurityblog.harris.com/tag/sparsebundle/).

It remains that encfs is a nice tool but not for the reasons I mentioned :)

Thanks for Renaud and Jekyll for pointing these errors.
Bad karma for Jekyll for not resisting the urge to express it like a dick.
