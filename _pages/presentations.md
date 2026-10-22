---
layout: page
title: Presentations
permalink: /presentations/
nav: true
nav_order: 2
page_class: presentations-page
stylesheet: /assets/css/presentations.css
---

<ul class="presentation-list">
  {% for presentation in site.data.presentations %}
    <li class="presentation-entry">
      <h2 class="presentation-title">
        {% if presentation.pdf %}
          <a
            href="{{ presentation.pdf | relative_url }}"
            type="application/pdf"
            target="_blank"
            rel="noopener"
            aria-label="{{ presentation.title | escape }} (PDF, opens in a new tab)"
          >{{ presentation.title | escape }}</a>
        {% else %}
          {{ presentation.title | escape }}
        {% endif %}
      </h2>
      <p class="presentation-details">
        {{ presentation.event | escape }}<br>
        {{ presentation.venue | escape }} · {{ presentation.date | escape }}
      </p>
    </li>
  {% endfor %}
</ul>
