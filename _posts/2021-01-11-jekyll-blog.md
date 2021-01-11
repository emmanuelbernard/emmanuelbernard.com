---
title: "Jekyll – A new blog infrastructure"
author: Emmanuel Bernard
tags: ["website", "blog", "infrastructure"]
header:
  teaser: /images/blog/jekyll-og.png
---
After 8 and a half venerable years of service, I've retired my Awestruct based blog and migrated it to Jekyll.
Read on for some feedback.

The blog virus has been hitching me in no small part due to [Gunnar's heroic effort](https://www.morling.dev/) of the last 12 months to provide quality blog content out there.

## You still have a blog / website?

Well, year!
Facebook is not your website (remember MySpace?).
Twitter is not a publishing platform, it's more like a public instant messaging solution (read once - find back nowhere) ; more seriously, subjects can't be summarized in 280 characters.
Medium is nice looking but their not so recent move towards monetization is a good reminder that owning _your_ space is important.

I love the blog format because it's a permanent, search engine reachable publishing platform.
My most popular content helping people every day has been written as far back as 2008 and it still can be found.
And as you will see it's relatively easy to set up.
Get a domain name, find a hosting provider (could be GitHub pages) and you're good.
When GitHub pages goes under, you'll relocate to somewhere else in 1h.

RSS. I will show my age but I love syndication.
I'm still using a RSS reader that notifies me of new blog posts of the sites I follow.
It's a bit sad that people believe that publishing on twitter once is enough for maximum and effective visibility.

## Static blog / website generator

Back in 2012, I moved from a [Wordpress deployment to a static website generator](/blog/2012/06/14/migrating-a-wordpress-blog-to-awestruct/).
For a blog it's perfect as you can generate it all and publish these HTML pages anywhere with very low overhead and no fear of database compromise of any sort.
I had been plagued by Wordpress maintenance and updates, no more.

In 2012, I used [Awestruct](http://www.awestruct.org/), started by Bob McWhirther.
This has been an eye opener in simplification (despite Ruby dependency hell and that's saying something).
I siphoned my old content as glorified `.html` and wrote new blog content as Markdown.
But Awestruct is showing its age and today lots of new static website generators exist.
So I moved to another system.

## The case for Jekyll

And it's still a static website generator.

![Jekyll logo](/images/blog/jekyll-og.png)

The gorilla in the category is [Jekyll](https://jekyllrb.com/).
It's written in Ruby (arrgggggg dependency hell!), maintained by a team (some from GitHub), and is the main GitHub pages static generator supported by GitHub.
As the leader, it attracted a gazillion talented theme designers which means you can start your website without having to write a single line of CSS (and it would still look good!).
Big bonus, popular ones are constantly maintained.
Jekyll has matured enough these days that Jekyll itself or any of its mature plugins will do what you need.
I wrote quite a few Awestruct plugins in my day but had no need so far for Jekyll.

A popular alternative is [Hugo](https://gohugo.io/).
The main advantage besides its rendering speed is that being written in Go, the dependency hell is someone else's problem (compared to Ruby that's a relief).
I tried to migrate to it but something did not click for me.
The documentation is not really guiding you nicely from noob to awesomeness.
Jekyll on the other hand is really good at that.
The other issue is I did not fell in love with a theme for Hugo.

There are tons of alternatives like [jbake](https://jbake.org/).
But most suffer from either being semi abandoned or not having a rich theme / plugin ecosystem.

## Migration and feedback

I selected a theme I liked, I read about it and about Jekyll.
I created a new site (from the theme generator) and copied it atop my existing website.
My content started to display almost instantly - at least the blogs.
They were written in Markdown and also share the same Frontmatter syntax and most attributes.

I still had to do a few minor content conversion (mostly removing the layout metadata) and wrote a migration script quickly in Java (more on that on another future post).

The slower part was to rethink my non blog content (home page, projects list...) and deciding how I wanted to display it.
These static pages tend to be dependent on the specific CSS classes you had in the past, so some massaging is in order.
My big advice if like me you do not want to spend time in CSS is to embrace the theme structure and not try to adjust it too much.
That's the best way to inherit all the future improvements without major surgery on your website pages.
Migration is also a good time for content spring cleaning.

One thing I did good was to keep my Markdown blogs free of Awestruct specific syntaxes or structures.
It's OK for your non blog entry pages to use these as rewriting is a one off, but with luck you will have written 150 blog entries by the time you need a migration.
If your blog entries are riddled with generator specific content, you are in for a harder migration.

One thing – I think – I did not do so well is originally to embed the date in the blog entry URL: `/blog/2021/01/06/what-the-hell/` vs `/blog/what-the-hell/`
While putting a date on your entires is important to give context, I really like the nice looking topic centric timeless feel of a URL that has no year-month-day part in the slug.
I might change that in the future with some redirect rules, we will see.

## Parting words

So I have a nice looking blog, full progressive rendering, generating the right metadata to show up nicely on Facebook or twitter reposts (you've got to have pictures in 2021, that's the main requirement).
The best thing about it is that it gave me the energy to blog again, which is good for the world – I hope.
