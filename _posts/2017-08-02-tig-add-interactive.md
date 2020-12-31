---
title: tig and add interactive
author: Emmanuel Bernard
tags: ["tool", "git"]
date: 2017-08-02
---
[Tig](http://jonas.nitro.dk/tig/) is a textual GUI for git which lets you manipulate your git repo like GitX or SourceTree but without leaving your terminal.
In particular, you can "graphically" do `git add --interactive`.
I find it easier to do my chunk surgery when I only want to apply parts of a file change.

The documentation is a bit terse so let me give you a rundown.

![Tig add interactive in action](/images/blog/tig-animation.gif)


## Navigate diffs

launch `tig`  
`s` # to see the status view  
`arrows` or `j`/`k` # to select the file diff to look at  
`enter` # to see changes in that file, this is the stage view, alternatively hit `c`  
`j`/`k` # to navigate up and down the file lines  

## Select specific chunks

(go down to a specific chunk)  
`u` # to select the whole chunk  
`!` # to delete/reset the whole chunk change (you must be on the chunk header line) ; caution this change will be gone forever  

## Select specific lines

(in a chunk on a specific line)  
`1` (one) to add the specific line to stage  
`!` and then `y` to delete/reset the specific line ; caution this line will be gone forever  

To undo the staging and remove the line, select the file in the `changes to be committed` section  
`1` (one) to move the line back to the non-stage area

## Other goodies

`Shift+R` to refresh the diff changes in case you update the file in your editor and want a updated diff

You can delete/reset changes to a whole file by hitting `!` and then `y` in the status view.
Make sure to select the right file as the changes will be gone forever.
