---
title: Autocompletion is crap
author: Emmanuel Bernard
tags: [java, tool, ide]
date: 2013-05-28
---
I can't believe autocompletion is still so stupid in 2013. Alright, I said it, I
feel better.  It's actually not quite true and a lot of smart things are going
on in Eclipse or IntelliJ IDEA but completion remains incredibly stupid when it
comes to discovering an API and offering the most appropriate choice.

It is very important for fluent APIs tailored to offer only the APIs that make
sense in a particular context. So when the autocompletion offers you the full
monty of useless methods of `Object`, it kills the hours of work an API designer
put into his fluent API and its discoverability. Seriously `notify()`,
`notifyAll()` and `wait()` x 3!

I developed, help develop or gave advice on a number of fluent APIs in Java
including:

- Hibernate Search and Hibernate Validator programmatic mapping API,
- an upcoming Hibernate OGM programmatic configuration API
- ShrinkWrap API
- Hibernate Search Query DSL API

So I feel very personally offended when something gets between my work and the
end user.

## Eclipse

I use Eclipse these days and the sort by relevance works only in so far as
relevance is synonymous to alphabetical. In other words it sucks... but in a
predictably alphabetical way.

![Eclipse autocompletion](/images/blog/autocompletion-eclipse.png)

## IntelliJ IDEA

IntelliJ IDEA is smarter as it puts in bold the methods hosted on the type and
leave supertype methods in regular.

![IntelliJ IDEA autocompletion](/images/blog/autocompletion-intellij-idea.png)

If you dig enough though, you can find a setting 

    Sort lookup items lexicographically

by opening up preferences and search of autocompletion. Weirdly enough, if you uncheck
this box, IntelliJ IDEA does the better thing and put the elements in bold next
to each others.

![IntelliJ IDEA smarter
autocompletion](/images/blog/autocompletion-intellij-idea-smart.png)

And that concludes this half rant, half tip, half call to action to IDE
developers. Yes I know but it takes at least 3 halfs for a good cocktail :)
