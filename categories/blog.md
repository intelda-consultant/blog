---
layout: page
title: "blog Posts"
permalink: /categories/blog/
---

# blog Posts

{% for post in site.posts %}
  {% if post.categories contains 'blog' %}
- **{{ post.date | date: "%B %d, %Y" }}** - [{{ post.title }}]({{ post.url }})
  {% endif %}
{% endfor %}
