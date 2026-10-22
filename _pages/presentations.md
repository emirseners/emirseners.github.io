---
layout: page
title: presentations
permalink: /presentations/
nav: true
nav_order: 2
---

{% for presentation in site.data.presentations %}
## {{ presentation.title }}

{{ presentation.event }} · {{ presentation.venue }} · {{ presentation.date }}

{% if presentation.pdf %}
[Slides (PDF)]({{ presentation.pdf | relative_url }})
{% endif %}

{% endfor %}
