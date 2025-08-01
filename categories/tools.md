---
layout: page
title: "Tools Posts"
permalink: /categories/tools/
---

# Tools Posts

{% for post in site.posts %}
  {% if post.categories contains 'Tools' %}
- **{{ post.date | date: "%B %d, %Y" }}** - [{{ post.title }}]({{ post.url }})
  {% endif %}
{% endfor %}
