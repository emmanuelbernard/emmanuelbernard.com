---
title: SPF for dummies - how to fight spams
author: Emmanuel Bernard
layout: blog-post
tags: [infrastructure]
---
In this post, you will learn everything you need about SPF (Sender Policy Framework),
what it means for your emails and how / if to set it up for your domains.

## What is it for and should I care?

This is a standard that helps reduce spam.
Each domain lists in one DNS record the list of servers that are allowed to send emails for that domain.
So when an email provider like Gmail sees an email sent from an address @example.com
but coming from a server not listed in the SPF record, it knows it is likely a spam.

Conversely, it is important to set such a record to avoid your emails to be considered spam.
More and more email providers consider domains without SPF record as more suspicious than others.
Even if you domain does not send emails, you should set a SPF record,
this will prevent spammers from faking emails from you.

## How does it work ?

As owner of a given domain, you will tell the world which servers you will send emails from.
That is typically your SMTP server.

In practice, this is a TXT entry in the DNS records of your domain.
Something like

    "v=spf1 a include:_spf.google.com ip4:198.51.100.3 -all"

`v=spf1` is the protocol, all entries start with this.

`a` or generally `a:example.com` says that all IPs listed in the DNS A record of the domain should be able to send emails for that domain.
If the domain is not specified (`a`), then it is the domain for which the TXT DNS record lives.

`ip4:198.51.100.3` means that IP 198.51.100.3 is allowed to send emails for your domain.
You can assign ranges as well.
Likewise, there is an `ip6` syntax.

`include:_spf.google.com` means that you should consider the SPF rules stored in the DNS entries of `_spf.google.com`.
This is very useful if you use Google Apps / Gmail or send emails from another domain's SMTP server.
Rules can be composed, so you can have explicit ips, a and includes in the same SPF entry.

There are also `mx` and `ptr` entries but I won't go into details.

Finally, you need to decide what to do when the rules don't match.
That's where the `all` mechanism comes into play:

* `-all` means that servers that do not pass the rules should be considered spammers
* `~all` means that servers that do not pass the rules should be considered spammers but we are not 100% sure
  so let them pass but be suspicious
* `?all` means that servers that do not pass the rules should be considered neutral (i.e. they may be legit or not)

If your list is exhaustive, use `-all` to lock things down.
If people sending emails from your domain might use their own SMTP server, use `?all`.
`~all` is for chickens ;)

You can get a formal description of all the options at [openspf.org](http://www.openspf.org/SPF_Record_Syntax).

You can lookup the SPF entries for any domain by typing

    nslookup -q=TXT example.com

This is useful before you add an `include` clause.

## A few concrete examples

My domain never sends any email: `"v=spf1 -all"`.

I use Gmail / Google Apps to send emails from that domain: `"v=spf1 include:_spf.google.com -all"`.

I use Gmail and Red Hat's SMTP: `"v=spf1 include:_spf.google.com include:redhat.com -all"`.

I use the server hosting example.com and Red Hat's SMTP: `"v=spf1 a include:redhat.com -all"` (this is a short hand for `"v=spf1 a:example.com include:redhat.com -all"`

People sending email as other-example.com use various SMTP servers but for sure 198.51.100.3 and example.com's SMTP servers: `"v=spf1 ip4:198.51.100.3 include:example.com ?all"`

A note on TXT DNS entry, to use (I think) the bind syntax, here is how it looks like

    # let's say it's the DNS zone of example.com
    # some domain
    @ 10800 IN A 198.51.100.3
    # some subdomains
    awesome 10800 IN CNAME example.com.
    blog 10800 IN CNAME example.com.
    # looks like these guys use Google Mail
    @ 10800 IN MX 10 aspmx.l.google.com.
    awesome 10800 IN MX 10 aspmx.l.google.com.
    
    # Here is our subject
    # you need one entry per domain and subdomain sending emails
    @ 10800 IN TXT "v=spf1 a include:_spf.google.com -all"
    awesome 10800 IN TXT "v=spf1 a include:_spf.google.com -all"
    # blog never sends emails
    blog 10800 IN TXT "v=spf1 -all"

## Conclusion and a few recommendations

I prefer domain names over IPs so I use `a` or `mx` entries.
As much as I can, I use `include` and delegate the list to the real guys.

Google and others use special subdomains like `_spf.google.com` to host their SPF rules.
This is useful to separate different ruleset but bind them together in your primary domain via an `include` rule.
If you are one of them, you probably don't need my blog entry in the first place :)

My take out is simple: if you own a domain and send emails, add a SPF entry.
It's relatively simple and the examples I gave you should get you a long way already.

PS: I am relatively new to this domain, feel free to correct me in the comments, if I made a mistake.
