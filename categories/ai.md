---
layout: page
title: "AI Posts"
permalink: /categories/ai/
---

# AI Posts

{% for post in site.posts %}
  {% if post.categories contains 'AI' %}
- **{{ post.date | date: "%B %d, %Y" }}** - [{{ post.title }}]({{ post.url }})
  {% endif %}
{% endfor %}
