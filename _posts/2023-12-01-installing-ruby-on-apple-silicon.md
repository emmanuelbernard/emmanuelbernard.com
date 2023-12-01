---
title: Installing Ruby on Apple Silicon
author: Emmanuel Bernard
tags: [ "language" , "Mac OS X" ]
#classes: wide
header:
  teaser: /images/blog/ruby-300x300.jpg
---
I have been struggling to install Ruby on Apple Silicon, this was due to an OpenSSL version misalignment.
This entry can be useful to you in this situations.

![Ruby language logo](/images/blog/ruby-300x300.jpg)

## RVM

I use [RVM](https://rvm.io/) as my multi environment installation for Ruby.
Whether you use rbenv, RVM or some alternative, do yourself a favor and use one. It brings some sanity to dependency management for you various projects.

## No compile for you!

I was in need to reinstall my Ruby version on an Apple Silicon M1 and I've been struggling more than I expected. 
Let me share a few things that helped me along the way.

First off, I am not using Rosetta and want to use a native ARM / Apple Silicon compilation.
In RVM it's simple, you run `rvm install ruby-2.7.7`.
But no luck for me.

## Look for the right version

First use the right version.
For people running Ruby 2 based projects, I recommend you use at least 2.7.7, I've seen (not not tested) that older versions would not necessary properly compile.
Upgrading to `2.7.7` for me helped.

But even with that version, I hit a compilation wall. 

```
ruby-2.7.7 - #post-configuration - please wait
ruby-2.7.7 - #compiling - please wait
ruby-2.7.7 - #installing - please wait
Error running '__rvm_make install',
please read /Users/emmanuel/.rvm/log/1701382397_ruby-2.7.7/install.log
There has been an error while running make install. Halting the installation.
```

When you look at the log file, you'll find something like

```
/Users/emmanuel/.rvm/src/ruby-2.7.7/lib/rubygems/core_ext/kernel_require.rb:83:in `require': cannot load such file -- openssl (LoadError)
    from /Users/emmanuel/.rvm/src/ruby-2.7.7/lib/rubygems/core_ext/kernel_require.rb:83:in `require'
    from /Users/emmanuel/.rvm/src/ruby-2.7.7/lib/rubygems/specification.rb:2430:in `to_ruby'
    from ./tool/rbinstall.rb:846:in `block (2 levels) in install_default_gem'
    from ./tool/rbinstall.rb:279:in `open_for_install'
    from ./tool/rbinstall.rb:845:in `block in install_default_gem'
    from ./tool/rbinstall.rb:835:in `each'
    from ./tool/rbinstall.rb:835:in `install_default_gem'
    from ./tool/rbinstall.rb:799:in `block in <main>'
    from ./tool/rbinstall.rb:950:in `block in <main>'
    from ./tool/rbinstall.rb:947:in `each'
    from ./tool/rbinstall.rb:947:in `<main>'
make: *** [do-install-nodoc] Error 1
+__rvm_make:0> return 2
```

This is due to a mismatched version of OpenSSL.

## Pointing to the right OpenSSL version

I am using [Homebrew](https://brew.sh) for package management so for me, the following compilation step was required.

`rvm install 2.7.7 --with-openssl-dir=$(brew --prefix openssl@1.1)`

And voilà!
