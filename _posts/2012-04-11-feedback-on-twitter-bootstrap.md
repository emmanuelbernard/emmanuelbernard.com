---
title: 'Feedback on Twitter Bootstrap'
author: 'Emmanuel Bernard'
tags: [ css, website, tool ]
date: 2012-04-11
---
Everyone and his dog is in love with [Twitter Bootstrap][bootstrap], so I figured I would give it a try and
build my website with it. 

## What is Twitter Bootstrap

Twitter Bootstrap is a HTML(5), CSS and JavaScript toolkit offering a grid based scaffolding and a set of
UI components to quickly get started. And best of all it does not look bad :)

It is not too difficult to get into it. While it will not really revolutionize people already familiar with 
[Blueprint CSS][blueprint] and CSS in general, it does however bring a set of standardized components
that tend to bring good practice to your website:

- nice styling for common constructs like code, tables, inputs etc
- nice set of sprited icons for various elements
- good looking buttons and labels
- nice navigation tools like breadcrumbs, pagination, and of course nav bars
- good largely spaced headline styles
- closable alert and informative messages
- progress bar
- and many more things both static and dynamic

### Responsive design

One very interesting feature is built-in support for responsive design. By combining the grid scaffolding
and a bit of JavaScript magic, the content of the page adjusts itself to look best for your browser
size. That's particularly useful to make a website that looks nice for both big screens and smartphones.

Check it out, change the size of your browser's window and you will see how the website reacts.
It's not perfect and cannot match a dedicated website but that's pretty good.

## Using it

Understanding how Twitter Bootstrap works and how to use it is relatively easy and quick.
The documentation is pretty good and driven by examples. It could use a few extra
examples here and there though.

It is not exempt of bugs but overall things are working as expected. I stumbled upon several bugs
but most of them were fixed in their latest version (2.0.3). I am unfortunately stuck on version 2.0.1.
Does it work on Internet Explorer? Good question, I don't have a IE installed to check it out.
If my website looks like crap and you are using Internet Explorer, then the answer is no.

Twitter Bootstrap is built using [Less][less]. I unfortunately use [SCSS][scss] and had to use
a port that has not upgraded to 2.0.3 yet.

## The curse

Now the big problem with Twitter Bootstrap is that pretty much all websites using it look alike.
The most defining element is the nav bar that unfortunately is one of the main signature component
of a website. Some themes exist, otherwise you will have to use Less or their 
[Boostrap customizer][customizer] to get something more unique. I am also not a big fan of their
default font style and size which I changed personally.

## Verdict

Overall it was a good experience and the UI components at my disposal helped me make a better
website. Yes my site look like many Twitter Bootstrap sites out there ; though I took the extra
time to customize it more than the average Joe. It is hopefully different enough :)

If you want to explore Twitter Bootstrap with a practical example, check out my website 
[source code][site code].

[bootstrap]: http://github.com/bootstrap/
[blueprint]: http://blueprintcss.org/
[less]: http://lesscss.org/
[scss]: http://sass-lang.com/
[customizer]: http://twitter.github.com/bootstrap/download
[site code]: https://github.com/emmanuelbernard/emmanuelbernard.com
