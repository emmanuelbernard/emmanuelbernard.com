---
title: I succumbed to the Cult of vi
author: Emmanuel Bernard
tags: [tool]
date: 2012-08-01
---
I think I am seriously regressing as I grow older.

I mentioned in the past moving from the popular, dynamic and UI
based blog system Wordpress to the Ruby based static generator 
[Awestruct][awestruct]. I also mentioned moving to [Git][git]
and enjoying my [command line][command-line] more and more.
On a tangential note, I do enjoy writing my verb in a pure textual
form thanks to [Markdown][markdown] and use Git as my backup
and memory system if you will.

I think the natural evolution for me was to move to one of those
archaic editors like _vi_ or emacs... And I tried _vi_... and I
can't say I liked it at first.

## Why oh why move to _vi_?

Emacs never attracted me, I have only ten fingers after all and
there is only so much flexibility in my hands.
_vi_ has the immense benefit of literally be available everywhere
you `ssh` in. I have always been acquainted with _vi_: use `i` to type
and `ESC :q!` if things go crazy.

Long time vimers keep claiming that once you get it, it's awesome.
Since I have been proved wrong on Git - I thought Mercurial was
better at that Git UX was an abomination for bearded people - I was
rather curious.

A recent discussion with my friends of [Les Cast Codeurs][lescastcodeurs]
fame convinced me to try once again to jump on the bandwagon.

## So far not so bad

In the beginning I felt that I was slow and that every line of text
was draining a third of my energy for the day. And that was more than
a feeling.

But it's really growing on me and this blog post is an attempt to
understand why really. Yes reader, you're my private therapist.

I love good UIs but to be honest, for text documents, you don't 
really need it. I use [MacVim][macvim] with a decent set of coloring 
and syntax highlighting and I am happy with it. The key is that
_vi_ is extremely powerful to fine-edit text and that even if hard
to learn, you feel that there is something you can gain.

## What's bad about _vi_

For beginners or casual users, _vi_ the most horrible piece of user
experience ever built. There is no visual or otherwise cue in case
you don't know how to do something, no way to navigate menus to figure
what can be done. You even need to be an accomplished _vi_ user and sort
of already know what you do to begin to make sense of the help system.

But let's pretend you used Google and know enough to play around.
Let's face it auto completion is very important in Java. Most of the time
Java developers don't need doc, the API and auto completion are here to
guide them. I often resort to Google for an API in Ruby or JavaScript,
never in Java.

Now what's interesting is that IntelliJ IDEA (my Java editor) has a
[vi plugin][intellij], so does Eclipse. So you can use your _vi_ way of editing
but still benefit from auto completion and code navigation.

The _vi_ plugin for IntelliJ is not perfect. It sometimes stops working and
you need to close and reopen your file, and it has the tendency to override
some common shortcuts (Command click for code navigation for example). But for
the most part it works. I think in 2 weeks of use, I gave up the _vi_ mode twice.
Not bad!

The other thing that's bad with _vi_ is that there is no native project
view to navigate from one file to another in a project. I'm used to
`Command-N` in IntelliJ IDEA to open a Java class with a few camel case
friendly keystrokes.

Vi has plugins to mimic that - _vi_ has plugins for everything by the way
including ASCII diagram drawing tools. I have installed [NERDTree][nerdtree] and
[Command-T][commandt] so far but I don't feel it's sufficient. The visual reminder of
the file hierarchy is quite useful in an IDE.

Likewise, copy / pasting especially between non _vi_ apps is not entirely
fluid to me but I suspect it's a matter of training.

## What made me click

There is no magic trick, you need to train your brain and your fingers to _vi_.
But there are two things that were key to make me understand how to use _vi_:

- stay in insert mode (sort of the normal mode of any other editor) for
  the shortest period of time. Text manipulation is mostly done in command
  mode. So always come back to command mode.
- _vi_ is very regular, operations are made of an action and a move.
  The action describes what you want to do, and the move is about
  what the action will influence. On top of that, you can add a multiplier
  to repeat the operation several times.

So when you learn a new move or a new action, you can compound them to the
ones you know already and create new operations for free.

After a while you like the game. Plus it's very easy to Google a given action
and find how to do it efficiently.

The arrow vs `hjkl` for navigation was essentially a non problem. I use what
I am comfortable with: I started with arrows but I use almost exclusively
`hjkl` to move now as it makes my hand move less on the keyboard.
Likewise, I use the mouse when I feel like moving around a lot. That might
change down the road.

It has been roughly two weeks of coding and writing in _vi_ mode and I am
now feeling that when I move back to a classic editor, I don't feel as efficient
as I thought I was. I'm even tempted to say that I feel a bit more efficient now in
_vi_.

A lot of the efficiency comes from the powerful search tools. It turns out to be very
efficient to navigate around text or code using small searches.

## Resources and conclusion

- a stackoverflow question on [the philosophy of _vi_ commands](http://stackoverflow.com/a/1220118/200911)
- the thought process of someone [moving back to _vi_](http://stevelosh.com/blog/2010/09/coming-home-to-vim/)
- everything you need to know on [tabulation and indenting in _vi_](http://tedlogan.com/techblog3.html)
- graphical [cheat sheet](http://www.viemu.com/a_vi_vim_graphical_cheat_sheet_tutorial.html)

If you want to make the jump, I recommend you:

- print the cheat sheets and keep them in front of you
- read a few blogs on the philosophy of _vi_
- take the time to configure your (graphical) _vi(m)_ environment
- jump and stick to it for most of your work
- use a _vi_ plugin for your IDE: it is good to force you to use _vi_ without losing 
  auto completion and co you need

That's all I have, it's not a tutorial on _vi_, more my thoughts on the process.
I'll keep you posted if I have more interesting things to say on the subject.
Oh and of course this blog entry has been written in _vi_ :)

[awestruct]: /blog/2011/07/08/awestruct-building-dynamic-static-web-sites/
[git]: /blog/2012/05/15/pro-tip-git-rebase/
[command-line]: /blog/2012/02/28/customize-titles-of-your-terminal-window/
[lescastcodeurs]: http://lescastcodeurs.com
[markdown]: http://daringfireball.net/projects/markdown/
[macvim]: http://code.google.com/p/macvim/
[intellij]: http://code.google.com/p/macvim/
[nerdtree]:http://www.vim.org/scripts/script.php?script_id=1658
[commandt]: https://wincent.com/products/command-t/
