---
title: Multiple email aliases in iOS
author: Emmanuel Bernard
tags: [apple, productivity]
date: 2013-03-24
---
I have tons of email identities. Depending on which hat I am wearing, I use one
alias or another. Most are behind my GMail address. It is easy enough to create
and use multiple aliases in the GMail web client or even in Mac OS X's Mail app.
But until recently **I thought it was impossible with iOS Mail app**.

It turns out it is possible but requires a bit of cheating. First off, **instead
of setting up your GMail account as GMail, set it up as IMAP**. I already do
that as I never give my GMail address (in case I change provider).  Once setup,
go in Note or any other editor and type the **list of comma separated email
aliases** (including your primary address) and copy this line. For example:

    scooby@doo.fr, scooby.doo@worldwildlife.org, scooby.doo@gmail.com

Then go to **Setting -> Mail, Contacts, Calendars** and select the email account
you are interested in. In the **Email field, remove the address and paste the
list of comma separated email addresses**. This whole gymnastic is necessary
because iOS does not let you add commas in an email field.

Now you are good to go, **when you create an email, you can change the email
address with any of the aliases**. Note that the last email in the list will be
the default email (experienced on iOS 6.1.3).

I found the tip on [iMore](http://www.imore.com/daily-tip-set-gmail-alias), they
describe a more step-by-step explanation with some screen shot if you get lost.
