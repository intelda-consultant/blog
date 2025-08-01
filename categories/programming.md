---
layout: page
title: "Programming Posts"
permalink: /categories/programming/
---

# Programming Posts

{% for post in site.posts %}
  {% if post.categories contains 'Programming' %}
- **{{ post.date | date: "%B %d, %Y" }}** - [{{ post.title }}]({{ post.url }})
  {% endif %}
{% endfor %}
