---
layout: page
title: Education
permalink: /education/
nav: true
nav_order: 0
page_class: education-page
stylesheet: /assets/css/education.css
---

<ul class="education-list">
  {% for education in site.data.education %}
    <li class="education-entry">
      <div class="education-heading">
        <h2 class="education-degree">{{ education.degree | escape }}, {{ education.institution | escape }}</h2>
        <p class="education-period">{{ education.period | escape }}</p>
      </div>
    </li>
  {% endfor %}
</ul>
