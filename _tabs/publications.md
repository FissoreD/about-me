---
layout: post
icon: fas fa-archive
order: 2
---

<style>
  .publication-authors p {
    display: contents;
  }
  .publication-idhal {
    display: inline;
    font-size: x-small;
  }
</style>

{% assign publications = site.data.cv-data.publications %}

{% for publication in publications.papers %}
  <div class="item">
    <h4>
      {% if publication.link %} <a href="{{ publication.link }}">{{ publication.title }}</a>
      {% else %} <li>{{ publication.title }}</li>
      {% endif %}
      {% if publication.hal_id %} 
        <div class="publication-idhal"> {{ publication.hal_id }}</div> 
      {% endif %}
    </h4>
    <div class="publication-authors">Authors: {{ publication.authors | markdownify }}</div>
    <div class="publication-conference">Conference: {{ publication.conference }}</div>
    {% if publication.address %} <div class="publication-conference">Address: {{ publication.address }}</div> {% endif %}
{% endfor %}