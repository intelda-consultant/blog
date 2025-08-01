---
layout: page
title: "Tutorial Posts"
permalink: /categories/tutorial/
---

# Tutorial Posts

{% for post in site.posts %}
  {% if post.categories contains 'Tutorial' %}
- **{{ post.date | date: "%B %d, %Y" }}** - [{{ post.title }}]({{ post.url }})
  {% endif %}
{% endfor %}
