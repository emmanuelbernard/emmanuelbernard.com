---
title: Unable to update git from homebrew
author: Emmanuel Bernard
layout: blog-post
tags: [tool, git]
---
I have had problems on one machine to upgrade Git from [Homebrew][].
Let me first tell you how to fix the problem and then what homebrew is
about.

## The problem

The probem appeared when I tried to upgrade git

    brew upgrade git

It turned out to be much more complicated than I anticipated to
find the problem. The exact error message was:

    Error: Failed executing: make prefix=/usr/local/Cellar/git/1.7.11.3 CC=/usr/bin/clang CFLAGS=-Os\ -w\ -pipe\ -march=native\ -Qunused-arguments\ -mmacosx-version-min=10.7 LDFLAGS=-L/usr/local/lib install (git.rb:49)
    These existing issues may help you:
        https://github.com/mxcl/homebrew/issues/8643
        https://github.com/mxcl/homebrew/issues/10544
        https://github.com/mxcl/homebrew/issues/11481
        https://github.com/mxcl/homebrew/issues/12344
        https://github.com/mxcl/homebrew/issues/12814
        https://github.com/mxcl/homebrew/issues/13850
    Otherwise, this may help you fix or report the issue:
        https://github.com/mxcl/homebrew/wiki/bug-fixing-checklist

My environment was listed as:

    ==> Build Environment
    HOMEBREW_VERSION: 0.9.2
    HEAD: 53d5bfb44e8644eff1693b2a734f079d10b53043
    CPU: dual-core 64-bit penryn
    OS X: 10.7.4-x86_64
    Xcode: 4.3.3
    CLT: 4.3.0.0.1.1249367152
    X11: 2.6.4 @ /usr/X11
    CC: /usr/bin/clang
    CXX: /usr/bin/clang++ => /usr/bin/clang
    LD: /usr/bin/clang
    CFLAGS: -Os -w -pipe -march=native -Qunused-arguments -mmacosx-version-min=10.7
    CXXFLAGS: -Os -w -pipe -march=native -Qunused-arguments -mmacosx-version-min=10.7
    CPPFLAGS: -isystem /usr/local/include
    LDFLAGS: -L/usr/local/lib
    MACOSX_DEPLOYMENT_TARGET: 10.7
    MAKEFLAGS: -j2

And the last line before the error outputs were

    /usr/bin/clang -isystem /usr/local/include -Os -w -pipe -march=native -Qunused-arguments -mmacosx-version-min=10.7 -I. -DUSE_ST_TIMESPEC -DNO_GETTEXT  -DHAVE_DEV_TTY -DXDL_FAST_HASH -DSHA1_HEADER='<openssl/sha.h>'  -DNO_MEMMEM -DSHELL_PATH='"/bin/sh"' -o git-daemon -L/usr/local/lib  daemon.o libgit.a xdiff/lib.a  -lz  -liconv  -lcrypto -lssl 
    Undefined symbols for architecture x86_64:
      "_iconv_open", referenced from:
    Undefined symbols for architecture x86_64:
      "_iconv_open", referenced from:
          _reencode_string in libgit.a(utf8.o)
          _reencode_string in libgit.a(utf8.o)
      "_iconv", referenced from:
      "_iconv", referenced from:
          _reencode_string in libgit.a(utf8.o)
          _reencode_string in libgit.a(utf8.o)
      "_iconv_close", referenced from:
      "_iconv_close", referenced from:
          _reencode_string in libgit.a(utf8.o)
          _reencode_string in libgit.a(utf8.o)
    ld: symbol(s) not found for architecture x86_64
    ld: symbol(s) not found for architecture x86_64
    clang: error: linker command failed with exit code 1 (use -v to see invocation)
    clang: error: linker command failed with exit code 1 (use -v to see invocation)
    make: *** [git-daemon] Error 1
    make: *** Waiting for unfinished jobs....
    make: *** [git-credential-store] Error 1

It turned out that libiconv was the culprit. Simply uninstall it:

    brew remove libiconv
    brew prune
    brew cleanup

Then run `brew upgrade git` again and things should work now.

I found the inspiration [here][inspiration].

## What is homebrew anyways

Homebrew is very easy to use and maintain package manager for 
Max OS X environments. Anytime you want to install one of those
unix-y tools, Homebrew is your friend.

Passed the initial installation, Homebrew is as simple to use as

    brew install *something*

and you are good to go. Keeping versions up-to-date are very easy too

    # update brew itself
    brew update
    # update tools installed with brew    
    brew upgrade

For example here are a few things I have installed and maintain with 
Homebrew (aka brew for the friends).

- git
- keychain
- mvim
- mongodb
- postgresql
- rsync
- unison
- wget

That also includes some Java tools:

- gradle
- maven
- jboss-as
- ceylon

Homebrew does not install as a privileged user - it is actually discouraged.
That makes it a bit picky when permissions are not right.

I have been using [this trick][permission] quite regularly with success.

    ruby -e "$(curl -fsSL https://gist.github.com/raw/768518/fix_homebrew.rb)"

Enjoy

[Homebrew]: http://mxcl.github.com/homebrew/
[inspiration]: https://gist.github.com/3195360
[permission]: http://academic.cleardefinition.com/2011/01/06/quickie-fix-usrlocal-permissions-for-homebrew-on-mac-os-x/
