---
title: Using vim and Evernote
author: Emmanuel Bernard
tags: ["tool"]
date: 2017-03-28
---
I like [Evernote](https://evernote.com) because all my notes are in a single place
and I can access it from everywhere (desktop, phone).
I use it very much as my GTD reference material.
But the editor is subpar compared to vim though - what isn't?

## Geeknote

I found a way to edit my Evernote notes in vim.
I use [Geeknote](https://www.geeknote.me) and specifically this [fork](https://github.com/jeffkowalski/geeknote).

    git clone https://github.com/jeffkowalski/geeknote
    python2 setup.py build
    pip2 install --upgrade .

(I forgot to do the last line and it created a lot of pains.
I also tried the brew formulae but did not work for me.)

You need to log in and select vim as your editor

    geeknote login
    geeknote settings --editor vim

And from there, you're good to go to edit notes

    geeknote edit --note "Moon project meeting"

And boom.
I personally can now edit my notes in Asciidoc markup and be happy :)

## vim-geeknote

There is a more advanced integration with vim: [vim-geeknote](https://github.com/neilagabriel/vim-geeknote).
I am not sure I like it but I'm exploring it.
It gives a navigation panel inside vim.

Make sure to set it to use the plain format and not the markdown one.
Otherwise, all your notes will look weird back in Evernote.

    " in your vim.rc
    " Geeknote options
    let g:GeeknoteFormat="plain"
    " filter the relevent notebooks
    let g:GeeknoteNotebookFilters=[ "my notebook" ]
    " do syntax highlighting with asciidoc syntax
    autocmd FileType geeknote set syntax=asciidoc

## Perfect solution / future

I initially thought about keeping all my notes in sync in a directory with each note exported as Asciidoc,
but I found geeknote before going in development tunnel.

I don't think I really need the directory sync but I would like to be able to have the note as a file that I can render via Asciidoctor (e.g. [asciidoctor.js](https://chrome.google.com/webstore/detail/asciidoctorjs-live-previe/iaalpfgpbocpdfblpnhhgllgbdbchmia)).
