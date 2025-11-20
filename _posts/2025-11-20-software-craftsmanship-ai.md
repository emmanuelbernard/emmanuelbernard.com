---
title: Software Craftsmanship and AI
author: Emmanuel Bernard
tags: [ "methodology", "AI" ]
classes: wide
header:
  teaser: /images/blog/dog-code.gif
---
Yesterday I went to a presentation by Cyrille Matraire on Software Craftsmanship and AI.
And I ended up surprisingly optimistic about the role of humans in software development.

## A history of software craftsmanship

Cyrille started by showing the history of software craftsmanship and how it was a breath of fresh air in the 2000s.
And how it was probably inevitable with the advent of how the technology changed and how the code feedback loop changed.

He then explained some of the key points it tries to fix, some resisting to this day.
Basically, testing, coding, reviewing, refactoring is the OODA-like loop of software and the smaller it is, the better you are.

Of course by being "democratized", software craftsmanship got corrupted by applying systematic rules and incantations, losing the reason behind these approaches.
But that's a story for another day and to be ignored for this conversation; let's assume people are using software craftsmanship with a brain vs a rulebook.


## Enters AI

Back in the day, the meme of the dog hitting the keyboard having no idea what it was typing was popular.

![A dog pretending to code](/images/blog/dog-code.gif)

And software craftsmanship was a counterbalance to that to bring thinking, discipline, and quality at the core of it.

Now "vibe coding" is the new dog: the AI dog.
That's ok and very useful for one off work and rapid prototyping as long as we throw the code away.
There will be plenty of engineering work for people that will have to decipher a vibe-coded codebase.

Back to AI, you can see how coding with AI is very similar to the testing (spec-ing), coding, reviewing, refactoring loop.
You can minimize hallucination by asking small chunks of work vs big ones, like in good practice refactoring.
And with AI, you can raise the bar by adding feedback loops to your system (both pre- and post-coding).
Linters and other post-coding tools are very useful _and_ deterministic: don't get rid of them, add more with AI help.
Defining ADRs, good practices, and other documentations to inject into coding agents will also improve the code generated. Even ask coding agents to retrofit from a good codebase if you are starting late on documentations.
The better the codebase (and its necessary documentation), the better the Coding Agent will be by being influenced by it.

## The critical engineer thinking in the loop

Your value is and will not be in writing lines of code.
It will be to critically think about why a given architectural choice, a business modeling or other strategic decisions are made,
and making sure the system does not get adrift of it.
The better the documentation, the codebase, the tests, the tooling, the better AI will produce things.
That means engineering will remain at the core of our craft.
And that many software craft strategies are ever more useful today.

Languages (lines of code) are not the key factor so much as good approaches and good technology to build apps on.

Of course, I could be all wrong, Cyrille could be all wrong, and Skynet be right.
That Coding Agents will encompass all engineering knowledge that humans in the loop won't be needed.

![Cyrille skull being crished by a Skynet robot](/images/blog/terminator-crush-cyrille.png)

But we are at a time when the best way to predict the future is to invent it.
I think we will face a equilibrium shift between GenAI and engineers but that it will be the equilibrium of something bigger.
The net result will be more apps and more automation.
