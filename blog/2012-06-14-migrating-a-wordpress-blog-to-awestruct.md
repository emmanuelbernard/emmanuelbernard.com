---
title: Migrating a Wordpress blog to Awestruct
author: Emmanuel Bernard
layout: blog-post
tags: [website, awestruct, blog]
---
As I said [earlier][blog migration], I moved my blog from a Wordpress instance to
[Awestruct][awestruct], a framework for creating static HTML sites and blogs.

The process is roughly made of these steps:

1. Move comments to Disqus or another hosted service
1. Initialize Awestruct's structure
1. Import the blog posts from Wordpress to Awestruct
1. Add the necessary Awestruct extensions
1. Write the correct redirect rules

## Moving comments to a hosted service

Because Awestruct is a static HTML generator, you need to use a hosted service
like [IntenseDebate][intense-debate] or [Disqus][disqus]. I personally use Disqus.
The import process is easy and involve installing a Disqus plugin in your Wordpress
instance.

## Initialize Awestruct's structure

Awestruct has a decent [getting started][getting-started] section but I find the easiest 
approach is to fork an existing Awestruct example and change what you want. You can take
[my website source][source-emmanuel] as an example if you want.

## Import blog posts

I wanted to keep my old content and get rid of the Wordpress instance. In Wordpress,
export your blog content (`Tools->Export`, all content). The XML file will be used
to create the various blog entries in Awestruct.

The import script is available [here][import] and takes the Wordpress xml file
and the output directory. In my case my blog is at <http://emmanuelbernard.com/blog/>

    ./_bin/import ~/Downloads/wordpress-export.xml ./blog

Edit it to reference your previous blog URL. With that the script
will make sure local images, PDF etc are properly imported as well instead of
simply referenced.

For each blog entry, a `.erb` file is created.

> Note that the import process might fail. Don't worry, simply read the error message and
> try and fix the xml file and run the import process again. In my case, I needed to add
> an empty line right before `</pre>` or `</blockquote>` elements. After a few stop and go
> you will have your data fully imported.

## Add the necessary Awestruct extensions

Blogs in Awestruct are build by a few extensions:

- `Posts`: creates the blog structure and pages based on the content of a directory
- `Paginator` (optional): paginate the blog entries
- `Tagger` (optional): generate the tag structure and pages
- `TagCloud` (optional): generate a tag cloud
- `Atomizer`: generate the atom feed
- `Disqus`: add the Disqus integration to your site

Check out [my website source][source-emmanuel] for an example. Note that at the time of writing,
I use some custom versions of these extensions but these changes are being pushed to Awestruct.

## Write the correct redirect rules

If your URL structure has changed either because of a relative URL change, because you move
to a new (sub)domain or both, you will need to write 301 redirect rules:

- old links spread on the internet will still work
- people registered to your old feed will not get lost
- Google will understand you moved your blog, reindex it and remove the old references
- Disqus will move your comments from the old blog to the new blog

In my .htaccess file, you can see 5 main redirections:

- redirect / from the old domain to the new domain
- redirect the old feed to the new feed
- redirect old posts to new posts (with a regexp or manual)
- redirect category urls to the new tag urls
- redirect anything else to the new blog

Let's look at the file

    RewriteEngine on
    RewriteCond %{HTTP_HOST} ^blog.emmanuelbernard.com$

    # Old feed redirected
    RewriteRule feed/ http://emmanuelbernard.com/blog/feed.atom [R=301,L]

    # Redirect 2012/04/07/something to http://emmanuelbernard.com/blog/2012/04/07/something
    RewriteRule ([0-2][0-9][0-9][0-9])/([0-1][0-9])/([0-3][0-9])/([^/]+)/ http://emmanuelbernard.com/blog/$1/$2/$3/$4/ [R=301,L]

    # Redirect category/slug to http://emmanuelbernard.com/tags/slug
    RewriteRule category/([^/]+)/ http://emmanuelbernard.com/blog/tags/$1/ [R=301,L]

    # Top level url redurect
    RewriteRule ^/?$ http://emmanuelbernard.com/blog/ [R=301,L]

    # Manual redirect form old URL scheme yyyy/mm to new blog
    RewriteRule 2007/01/activerecord-pattern-so-what[/]? http://emmanuelbernard.com/blog/2007/01/07/activerecord-pattern-so-what/ [R=301,L]
    # ...

    # Redirect anything else to new blog
    RewriteRule ^(.*)$ http://emmanuelbernard.com/blog/

Because my old url scheme was `yyyy/mm/slug` and the new one is `yyyy/mm/dd/slug`,
I could not write a regexp based redirect rules. But I used a small Ruby script
to convert the old URLs to the new URLs based on the content of my Awestruct blog
directory. Check out the [script here][htaccess-generator].

    #!/usr/bin/env ruby
    #
    # Generate a htaccess rule for each old blog entry from
    # http://blog.emmanuelbernard.com/yyyy/mm/slug to http://emmanuelbernard.com/blog/yyyy/mm/dd/slug
    # Has to be manual as the day is unknown in the URL
    #
    Dir.foreach("../blog") { |file| 
    	if (file =~ /(20[0-1][0-9])-([0-1][0-9])-([0-3][0-9])-([^\/]+).html.erb/)
    		result = "RewriteRule " << $1 << "/" << $2 << "/" << $4 << "[/]?"
    		result = result << " http://emmanuelbernard.com/blog/"
    		result = result << $1 << "/" << $2 << "/" << $3 << "/" << $4 << "/ [R=301,L]"
    		puts result
    	end
    }

## Publish

Publish your Awestruct website on your server and test :)

The final step is to ask Disqus to listen to the 301 redirects to attach the old comments to the new 
Blog entries. It's in `Admin -> Migrate tools -> Redirect Crawler`.

And voilà! You have a fully upgraded blog :)

[blog migration]: /blog/2012/04/10/the-perfect-storm-creates-new-website-and-blog/
[awestruct]: http://awestruct.org
[import]: https://github.com/emmanuelbernard/emmanuelbernard.com/blob/master/_bin/import
[intense-debate]: http://intensedebate.com/
[disqus]: http://disqus.com/
[source-emmanuel]: https://github.com/emmanuelbernard/emmanuelbernard.com/
[.htaccess]: https://github.com/emmanuelbernard/emmanuelbernard.com/blob/master/.htaccess
[htaccess-generator]: https://github.com/emmanuelbernard/emmanuelbernard.com/blob/master/_bin/htaccess-generator.rb
[getting-started]: http://awestruct.org/getting_started/
