---
layout: page
title: Presentations
permalink: /presentations/
nav: true
nav_order: 3
page_class: presentations-page
stylesheet: /assets/css/presentations.css
---

<ul class="presentation-list">
  {% for presentation in site.data.presentations %}
    <li class="presentation-entry">
      <h2 class="presentation-title">
        {{ presentation.title | escape }}
        {% if presentation.pdf %}
          <a
            class="resource-link"
            href="{{ presentation.pdf | relative_url }}"
            type="application/pdf"
            target="_blank"
            rel="noopener"
            aria-label="{{ presentation.title | escape }} (PDF, opens in a new tab)"
          >[PDF]</a>
        {% endif %}
      </h2>
      <p class="presentation-details">
        {% if presentation.event_url %}
          <a href="{{ presentation.event_url | escape }}" target="_blank" rel="noopener">{{ presentation.event | escape }}</a>
        {% else %}
          {{ presentation.event | escape }}
        {% endif %} ·
        {{ presentation.venue | escape }} · <span class="presentation-date">{{ presentation.date | escape }}</span>
      </p>
    </li>
  {% endfor %}
</ul>
