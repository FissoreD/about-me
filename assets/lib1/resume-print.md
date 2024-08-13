---
layout: cv_print
title: Resume-Print
icon: fas fa-list-alt
permalink: resume/print
math: true
---


{% include cv/career-profile.html %}

{% unless site.data.cv-data.sidebar.education %}
  {% include cv/education.html %}
{% endunless %}

{% include cv/publications.html %}

{% include cv/experiences.html %}

{% include cv/teaching.html %}

{% include cv/certifications.html %}

{% include cv/projects.html %}

{% include cv/oss-contributions.html %}

{% include cv/skills.html %}

