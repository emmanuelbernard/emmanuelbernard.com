---
title: Asciidoc folding for Vim
author: Emmanuel Bernard
tags: [tool]
date: 2016-02-11
---
I just learned about the ability to fold in Vim.
For mere mortals, it means hiding parts of the file.

Here is a code to put in your `.vimrc` to allow folding for [Asciidoc(tor)](http://asciidoctor.org) files.
It folds asciidoc files at section boundaries and use nested folds for subsections.

    "" Fold Asciidoc files at sections and using nested folds for subsections
    " compute the folding level
    function! AsciidocLevel()
        if getline(v:lnum) =~ '^== .*$'
            return ">1"
        endif
        if getline(v:lnum) =~ '^=== .*$'
            return ">2"
        endif
        if getline(v:lnum) =~ '^==== .*$'
            return ">3"
        endif
        if getline(v:lnum) =~ '^===== .*$'
            return ">4"
        endif
        if getline(v:lnum) =~ '^====== .*$'
            return ">5"
        endif
        if getline(v:lnum) =~ '^======= .*$'
            return ">6"
        endif
        return "="
    endfunction
    " run the folding level method when asciidoc is here
    autocmd Syntax asciidoc setlocal foldexpr=AsciidocLevel()
    " enable folding method: expression on asciidoc
    autocmd Syntax asciidoc setlocal foldmethod=expr
    " start with text unfolded all the way
    autocmd BufRead *.adoc normal zR
    autocmd BufRead *.asciidoc normal zR
    " TODO following does not work as folding is lost up reloading
    " autocmd Syntax asciidoc normal zR

I'm sure it can be improved - I'd love to fold blocks as well - but that's a start.

Here are a few commands to remember to fold in Vim

* `zo`: open a fold at cursor
* `zO`: open all folds down at cursor
* `zc`: close a fold at cursor
* `zC`: close all levels of folds at cursor
* `za`: / `zA`: toggle fold
* `zm`: close fold by one level across the file
* `zM`: close all folds across the file
* `zr`: open fold by one level across the file
* `zR`: open all folds across the file
* `zj` / `zk`: move to next / previous fold
* `[z` / `]z`: go to begining / end of the fold

Happy folding.
