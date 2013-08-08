---
title: One line per idea
author: Emmanuel Bernard
layout: blog-post
tags: [writing]
---
Now that most of my writing is done in
a markup language like [Markdown](http://daringfireball.net/projects/markdown/)
or [Asciidoc](http://asciidoctor.org/docs/what-is-asciidoc/),
and now that I do version my writing in an SCM
(Git to be specific),
I have been wondering about how to spit text.
I have considered
80 characters per line (plus auto wrapping)
or one sentence per line.

## Line wrapping

Automatic line wrapping is aesthetically pleasant
but if I change the very beginning of a paragraph,
my whole paragraph is marked as changed in diff.

     The problem with the former is that if I
    -change the very beginning of a paragraph,
    -my whole paragraph is marked as changed
    -in diff. The problem with the latter is
    -that sentences tend to be quite long and
    -thus wrap and changes are hard to track
    -to even though it is easier than with the
    -former approach.
    +happen to change the very beginning of a
    +paragraph, my whole paragraph is marked
    +as changed in diff. The problem with the
    +latter is that sentences tend to be quite
    +long and thus wrap and changes are hard
    +to track even though it is easier than
    +with the former approach.

## One line per sentence

One sentence per line partly solves the diff problem
but sentences tend to be quite long (and thus wrap)
and changes are not fully obvious to track
even though it is easier than with the line wrapping approach.

    -The problem with the former is that if I change the very beginning of a paragraph, my whole paragraph is marked as changed in diff.
    +The problem with the former is that if I happen to change the very beginning of a paragraph, my whole paragraph is marked as changed in diff.
     The problem with the latter is that sentences tend to be quite long and thus wrap and changes are hard to track even though it is easier than with the former approach.

## One line per idea

I came across this [post](http://rhodesmill.org/brandon/2012/one-sentence-per-line/)
which proposes to have line breaks between ideas
(punctuation is a good indicator
but clauses is probably even better).

     The problem with the former is that
    -if I change the very beginning of a paragraph,
    +if I happen to change the very beginning of a paragraph,
     my whole paragraph is marked as changed in diff.
     The problem with the latter is that
     sentences tend to be quite long and thus wrap

This offers the advantages of the line per sentence without its disadvantages.
What's interesting is that this approach has been proposed at least as far as 1974 :)
and focuses on changes rather than the initial blurb. Clever!

That's on paper at least.
I will try this approach from now on
and see if that works for me.
