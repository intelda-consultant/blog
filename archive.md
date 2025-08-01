---
layout: page
title: Archive
permalink: /archive/
---

# Post Archive

Browse all blog posts by date and category.

## Posts by Category

### AI & Machine Learning
{% for post in site.posts %}
  {% if post.categories contains 'AI' or post.categories contains 'Machine Learning' or post.content contains 'LLM' or post.content contains 'AI' or post.title contains 'AI' %}
- [{{ post.title }}]({{ post.url }}) - {{ post.date | date: "%B %d, %Y" }}
  {% endif %}
{% endfor %}

### Programming & Development
{% for post in site.posts %}
  {% if post.categories contains 'Programming' or post.content contains 'Java' or post.content contains 'Python' or post.title contains 'Programming' %}
- [{{ post.title }}]({{ post.url }}) - {{ post.date | date: "%B %d, %Y" }}
  {% endif %}
{% endfor %}

### Tools & Automation
{% for post in site.posts %}
  {% if post.content contains 'n8n' or post.content contains 'Docker' or post.content contains 'tool' or post.title contains 'tool' %}
- [{{ post.title }}]({{ post.url }}) - {{ post.date | date: "%B %d, %Y" }}
  {% endif %}
{% endfor %}

## All Posts by Date

{% for post in site.posts %}
- **{{ post.date | date: "%B %d, %Y" }}** - [{{ post.title }}]({{ post.url }})
{% endfor %}

---

*Total Posts: {{ site.posts | size }}*
