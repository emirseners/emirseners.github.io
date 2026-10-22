---
layout: page
title: Publications
permalink: /publications/
nav: true
nav_order: 1
page_class: publications-page
stylesheet: /assets/css/publications.css
---

<div class="publication-sections">
  {% for section in site.data.publications %}
    <section aria-labelledby="{{ section.id | escape }}">
      <h2 class="publication-section-title" id="{{ section.id | escape }}">{{ section.title | escape }}</h2>
      <ol class="publication-list">
        {% for publication in section.entries %}
          <li class="publication-entry">
            <h3 class="publication-title">{{ publication.title | escape }}</h3>
            <p class="publication-authors">{{ publication.authors | escape }} ({{ publication.year | escape }}).</p>
            <p class="publication-details">
              {{ publication.details | escape }}
              {% if publication.url %}
                <a
                  href="{{ publication.url | escape }}"
                  target="_blank"
                  rel="noopener"
                  aria-label="{{ publication.link_label | escape }} for {{ publication.title | escape }} (opens in a new tab)"
                >{{ publication.link_label | escape }}</a>
              {% endif %}
            </p>
          </li>
        {% endfor %}
      </ol>
    </section>
  {% endfor %}
</div>
