---
title: Fixing failing import of Evernote notes to another app
author: Emmanuel Bernard
tags: [ "tool", "writing" ]
classes: wide
header:
  teaser: /images/blog/evernote.png
---
Importing Evernote notes into a new tool can sometimes fail mid way. This post explains how to work around it.

As I explained [earlier](/blog/2021/03/01/notes-app/), I moved away from Everyone and now use [Bear](https://bear.app/). I also tried [Joplin](https://joplinapp.org/).
For both, I did import my entire 2600+ collection of notes.
There was one repeatable glitch and I’d like you to avoid.

## The expected import process
The process is fairly simple, you export your Evernote notes into the `enex` format which is an Evernote XML based format.
It contains both metadata and the note in a HTML format.

Then both Bear and Joplin can swallow the XML file and import the notes.
Since both are using Markdown as their base format, they each have an HTML to Markdown conversion engine that is used as part of the import.

Another cool thing is that the note retain its creation, update time and other metadata.

![](/images/blog/evernote.png)

## The glitch
Both app only imported a subset of my notes.
The processed either hanged or stopped at around 650 for me.

What I realized is that some Evernote HTML is not well understood by the Bear or Joplin import engines during their Markdown conversion.
Luckily, notes are imported in alphabetical order (by title).
So I knew what was imported and what was not.

The solution is then relatively simple. 
Check the name of the last note that has been imported.
Make a copy (backup) and open the `enex` file with your favorite editor. 
I recommend something like Vim which did not sweat even thought the file was 16MB.
Find the note with the title (under `<note><title>…</title>…</note>` remove all previous `<notes>` up to the note after the one with the matching title. 
This is the note that is causing problem.
In my case I think the use of `<span>` was what led to problems.
If the note is important to you, you will copy its content manually so keep it around.

```xml
<?xml version="1.0" encoding="UTF-8"?>
<!DOCTYPE en-export SYSTEM "http://xml.evernote.com/pub/evernote-export3.dtd">
<en-export export-date="20210326T164626Z" application="Evernote" version="10.8.6">

<!-- Start removing content from here as we have already imported the first notes -->
  <note>
    <title>A note that got imported</title>
    <created>20110405T130212Z</created>
    <updated>20110405T130236Z</updated>
    <note-attributes>
    </note-attributes>
    <content>
      <![CDATA[<?xml version="1.0" encoding="UTF-8" standalone="no"?>
<!DOCTYPE en-note SYSTEM "http://xml.evernote.com/pub/enml2.dtd">
<en-note style="word-wrap: break-word; -webkit-nbsp-mode: space; -webkit-line-break: after-white-space;">
[...]
</en-note>      ]]>
    </content>
  </note>

  <note>
    <title>Last correctly imported note</title>
    <created>20110405T130212Z</created>
    <updated>20110405T130236Z</updated>
    <note-attributes>
    </note-attributes>
    <content>
      <![CDATA[<?xml version="1.0" encoding="UTF-8" standalone="no"?>
<!DOCTYPE en-note SYSTEM "http://xml.evernote.com/pub/enml2.dtd">
<en-note style="word-wrap: break-word; -webkit-nbsp-mode: space; -webkit-line-break: after-white-space;">
[...]
</en-note>      ]]>
    </content>
  </note>

<!-- Failing note (first missing one), let's remove it too so the import no longer hangs -->
  <note>
    <title>First missing note – that's the failing one that we need to remove</title>
    <created>20110405T130212Z</created>
    <updated>20110405T130236Z</updated>
    <note-attributes>
    </note-attributes>
    <content>
      <![CDATA[<?xml version="1.0" encoding="UTF-8" standalone="no"?>
<!DOCTYPE en-note SYSTEM "http://xml.evernote.com/pub/enml2.dtd">
<en-note style="word-wrap: break-word; -webkit-nbsp-mode: space; -webkit-line-break: after-white-space;">
[...] <span>Something fishy in this note</span>
</en-note>      ]]>
    </content>
  </note>

<!-- Stop removing content here – the import will start from here! -->

  <note>
    <title>Second missing note – probably good so let's start from here</title>
    <created>20110405T130212Z</created>
    <updated>20110405T130236Z</updated>
    <note-attributes>
    </note-attributes>
    <content>
      <![CDATA[<?xml version="1.0" encoding="UTF-8" standalone="no"?>
<!DOCTYPE en-note SYSTEM "http://xml.evernote.com/pub/enml2.dtd">
<en-note style="word-wrap: break-word; -webkit-nbsp-mode: space; -webkit-line-break: after-white-space;">
[...]
</en-note>      ]]>
    </content>
  </note>

</en-export>
```

Save the file which will contains only new notes to import and run the import process again.
In my case, I had to repeat these steps 4 or 5 times.

Note that Bear will finish the import (it is really quick by the way), while Joplin will just hang.
For Joplin, wait long enough to be sure notes are no longer processed (in my case I looked at the Dropbox sync status) and force quit the app before restarting it.


