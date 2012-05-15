---
title: Pro tip on git rebase -i
author: 'Emmanuel Bernard'
layout: blog-post
tags: [ tool, git ]
--- 
Here is a small tip to improve your efficiency when using dynamic rebasing in Git.

I do my work on topic branches that are forked of `master`. Before I push my work for review
via a GitHub pull request, I like to clean it up a bit by:

- reordering some commits
- squashing some commits together
- rewriting commit messages

Nothing fancy but it helps improve history readability.

You can of course do that by using `git rebase -i` and most examples show
how you can go back in time a couple of commits.

    git rebase -i HEAD^4 #go back 4 commits ago

There is a nicer and more efficient to do that when you work on topic branches

    git rebase -i master

That's it. Pretty stupid but, since you can put any Git object reference, why not use
the object where you started to fork off? The rebase will show you all commits between
master and your branch.

If you are on a Mac, I highly recommend using [GitX][gitx] or one of his forks.
In particular, you can amend the last commit and graphically select what should be
staged and unstaged. 

[gitx]: http://gitx.frim.nl/
