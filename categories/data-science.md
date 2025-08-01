---
layout: page
title: "Data Science Posts"
permalink: /categories/data-science/
---

# Data Science Posts

{% for post in site.posts %}
  {% if post.categories contains 'Data Science' %}
- **{{ post.date | date: "%B %d, %Y" }}** - [{{ post.title }}]({{ post.url }})
  {% endif %}
{% endfor %}
