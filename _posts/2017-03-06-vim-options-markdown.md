---
title: Embedding Vim options in Markdown
author: Emmanuel Bernard
tags: ["tool"]
date: 2017-03-06
---
I've been wrestling with an issue for quite a while: embed vim options into a Markdown file.
I finally found a solution.

## Context

You can customize the options set when opening a specific file in Vim.
This is pretty handy when you want to customize things like tab vs spaces or the language to spellcheck with.

This is typically done by adding some vim incantation as a comment in the file.

    // vim: set softtabstop=2 shiftwidth=2 expandtab:
    public class JavaClassExample {
      public String name;
    }

## Vim options in Markdown

I've been really struggling to get this working on Markdown because unfortunately Markdown does not have a comment syntax.
That's until I remembered that Markdown defaults to HTML the minutes it does not know how to express things. `<!-- -->` to the rescue!
Without further due, an example:


    # Un exemple en Markdown
    
    <!-- ask vim to use French to spellcheck -->
    <!-- vim:set spelllang=fr : -->
    
    <!-- ask vim to use 2 spaces for indent
         (a blog does not have lots of space) -->
    <!-- vim: set softtabstop=2 shiftwidth=2 expandtab: -->
    
    Ceci est un test montrant la validation orthographique en Français.
    
    ## Et ça marche ?
    
    Carrément !
    
        public class JavaClassExample {
          public String name;
        }

Enjoy!
