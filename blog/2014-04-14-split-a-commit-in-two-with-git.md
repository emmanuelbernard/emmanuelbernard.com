---
title: Split a commit in two with Git
author: Emmanuel Bernard
layout: blog-post
tags: [tool, git]
---
Ever wanted a commit was actually made of two? Read on.

There are several reasons why you could wish a commit was actually made of several distinct ones:

* because it makes the history more readable
* because you are trying to reorder some commits and it creates nasty conflicts
* just because

Merging two commits into one is easy: look for **squashing** for more info.
While I am relatively versed in Git, I never knew how to efficiently do the opposite
- **splitting commits** - until today.

## Split a commit in two for the busy ones

Let's see the sequence first before explaining it

    git rebase -i <oldsha1>
    # mark the expected commit as `edit` (replace pick in front of the line), save a close
    git reset HEAD^
    git add ...
    git commit -m "First part"
    git add ...
    git commit -m "Second part"
    git rebase --continue

What did we do?

## A detailed explanation

### Interactive rebase

`git rebase -i <oldsha1>` opens a list of commits from oldsha1 to the latest commit in the branch.
You can:

* reorder them,
* change the commit message of some,
* squash (merge) two commits together,
* and edit a commit.

We use edit in our case as we want to change the commit.
Simply replace the `pick` word with `edit` on the line of the commit you want to split.
When you save and close this "file",
you will be placed at that commit in the command line.

### Undo the actual commit

If you do a `git status` or a `git diff`,
you will see that git places you right **after** the commit.
What we want is to **undo** the commit
and place the changes in our working area.

This is what `git reset HEAD^` does: **reset the state to the second last commit**
and leave the changes of the last commit in the working area.
`HEAD^` means the commit at `HEAD` minus 1.

### Create the two commits

Next is simple gittery where you add changes and commit them the way you wish you had.

### Finish the interactive rebasing

Make sure to **finish the rebase** by calling `git rebase --continue`.
Hopefully, there won't be any conflicts and your history will contain the new commits.

## A few more tips

This tip becomes much more powerful
when you know how to add to the staging area parts of a file changes
- instead of all the file changes that is.

The magic tool for that is `git add -p myfile` but it is quite arid.
I recommend you use either [GitX](http://gitx.frim.nl) (Mac OS X, GUI)
or [tig](http://jonas.nitro.dk/tig/) (CLI).
They offer a more friendly interactive way to add chunks of changes (up to line by line additions).

Another interesting tip for people that work on topic branches forked off `master`.
You can do `git rebase -i master` which will list the commits between master and your branch.
See my previous post [on the subject](/blog/2012/05/15/pro-tip-git-rebase/)
for more info.
