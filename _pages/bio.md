---
title: Biography
permalink: /bio/
author: Emmanuel Bernard
layout: single
classes: wide
header:
  overlay_image: /images/emmanuel-conf-1200px.jpg
---

{% comment %}
  Content lives in _data/bio.yml so that the home page, the sidebar and this
  page can never disagree again. Edit there, not here.
{% endcomment %}

If you need my biography for a conference, use the following one (available in English or French). You can also find my picture below.

## English

{{ site.data.bio.long.en }}

{{ site.data.bio.hashtags }}

## Français

{{ site.data.bio.long.fr }}

{{ site.data.bio.hashtags }}

## Pictures

{% for picture in site.data.bio.pictures %}
### {{ picture.label }}

<img width="50%" alt="{{ picture.alt }}" src="{{ picture.url }}"/>
{% endfor %}
