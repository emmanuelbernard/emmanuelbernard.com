---
title: Presentations
author: Emmanuel Bernard
header:
  overlay_image: /images/emmanuel-conf-1200px.jpg
  show_overlay_excerpt: true
excerpt: The talk materials that stand on their own.

layout: single
---

Most of my talks never land here.
Slides are a prop for whoever is on stage, and without the talk they are not worth much.
What I publish is the material that stands on its own: courses and long-form decks you can read without me in the room.

## Presentation materials

{% comment %} Entries live in _data/presentations.yml — edit them there. {% endcomment %}
{% for material in site.data.presentations %}
**[{{ material.title }}]({{ material.url }})** — {{ material.date }}

{{ material.description }}
{% if material.links %}
{% for link in material.links %}[{{ link.name }}]({{ link.url }}){% unless forloop.last %} · {% endunless %}{% endfor %}
{% endif %}
{% endfor %}
