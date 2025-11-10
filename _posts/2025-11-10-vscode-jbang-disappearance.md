---
title: JBang, Visual Studio Code, and the mysterious disappearing changes
author: Emmanuel Bernard
tags: [ "tool", "IDE" ]
classes: wide
header:
  teaser: /images/blog/vscode.png
---
I recently spent time automating some of my repetitive tasks using JBang scripts, with Claude Code helping me along the way in VSCode (oh sorry, it's called Visual Studio Code now).
Everything seemed great until I hit a classic "what the hell" moment that probably every Visual Studio code user has encountered at least once.
If you've ever found yourself wondering why your changes aren't being picked up by JBang (or any other tool watching your files), this post is for you.

![JBang and Visual Studio code](/images/blog/vscode.png)

## The setup

[JBang](https://www.jbang.dev/) is fantastic for writing quick Java scripts (not JavaScript!) without the ceremony of a full project setup.
I was using it to automate some workflow tasks, and I had [Claude Code](https://www.anthropic.com/code) helping me iterate on the scripts directly in Visual Studio code.
For that I used [Claude Code for VSCode](https://marketplace.visualstudio.com/items?itemName=Anthropic.claude-code) (wait is that Visual Studio Code or VSCode, I'm all confused now ;P).

Then it's classic AI loop: Claude Code would suggest changes, I'd review them, and then run the script with `jbang MyScript.java`.

## The problem

Except... JBang wasn't seeing my changes. Well it was but only two third of the time.
And there is nothing worse than a tool that works 75% of the time: this drains your energy.

I'd make an edit in Visual Studio code, save the file (or so I thought), run `jbang MyScript.java`, and get the old behavior.
I'd check the file in Visual Studio code and could not make heads or tails of the behavior (it it my code or something else that's causing the trouble).

This is the classic Visual Studio code "what the hell" moment, and if you've used Visual Studio code long enough, you've probably hit it before with various tools like test runners, linters, or file watchers.

## The culprit: Auto Save

I first thought that JBang was at fault, so I used the `jbang --fresh MyScript.java` to force a cache refresh.
But I think it was VSCode.

Visual Studio code has an auto save feature, but by default it's set to `off` (2005 is calling back to get his floppy disk icon back).
You need to save manually with `Cmd+S` (or `Ctrl+S` on Windows/Linux).
But even when you enable auto save, the *timing* of when it saves matters enormously.

The problem is that Visual Studio code's default auto save behavior can be too lazy for tools that are watching your filesystem or that you're running manually after edits.

## The fix

Go to your Visual Studio code settings (`Cmd+`, or `Code > Settings > Settings`), search for `Auto Save`, and change it to `onFocusChange`.

This tells Visual Studio code to automatically save your file whenever you switch away from it like when you switch to your terminal to run `jbang`, or when Claude Code switches context, or when you click on another application.

I initially tried `afterDelay` but found it unreliable for my workflow.
The delay meant that sometimes I'd switch to terminal and run the command before Visual Studio code had gotten around to saving.
`onFocusChange` is immediate and predictable.

## The other options

For completeness, here are the auto save options Visual Studio code offers:

* `off`: You must manually save with Cmd+S (default, and the source of much confusion)
* `afterDelay`: Saves after a configured delay (default is 1000ms). This is unreliable if you're a fast switcher like me.
* `onFocusChange`: Saves when you click away from the file. This is what I recommend.
* `onWindowChange`: Saves when you switch away from Visual Studio code entirely. This is more conservative and might miss some cases.

## Why this happens

The fundamental issue is that Visual Studio code, like many modern editors, keeps an in-memory representation of your files.
When you edit, you're editing that in-memory version.
Tools like JBang, test runners, linters, and file watchers are looking at the actual file on disk.

If Visual Studio code hasn't flushed the in-memory changes to disk yet, there's a disconnect between what you see in your editor and what your tools see.

This is by design for performance reasons, but it creates confusion when you're rapidly iterating with external tools.

## Visual Studio code and AI coding assistants

This issue becomes particularly noticeable when using AI coding assistants like Claude Code, GitHub Copilot, or Cursor.
These tools make suggestions, you accept them, and you want to immediately test the results.
The rapid edit-test cycle means you're switching contexts frequently, and that's exactly when auto save timing matters most.

Setting `onFocusChange` creates a smooth workflow where edits are immediately persisted when you switch to test them.

And voilà! No more mysterious disappearing changes.
