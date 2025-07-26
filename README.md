# Intelda Consultant Blog

A Jekyll-powered blog featuring technical articles on AI, Machine Learning, and Data Science.

## Setup Instructions for GitHub Pages

1. **Repository is already created at**: `https://github.com/intelda-consultant/blog/`
2. **Copy all files** from this directory to your repository
3. **Move the markdown file** to the `_posts` directory:

   ```bash
   mkdir _posts
   mv fine-tuning-llms-pdf-guide.md _posts/2025-02-10-fine-tuning-llms-pdf-guide.md
   ```

4. **Enable GitHub Pages** in your repository settings:
   - Go to Settings → Pages
   - Select "Deploy from a branch"
   - Choose "main" branch and "/ (root)" folder
5. **Site will be available at**: `https://intelda-consultant.github.io/blog/`

## Local Development

To run locally:

```bash
bundle install
bundle exec jekyll serve
```

Your site will be available at `http://localhost:4000`

## File Structure

```
.
├── _config.yml          # Jekyll configuration
├── _posts/              # Blog posts directory
│   └── 2025-02-10-fine-tuning-llms-pdf-guide.md
├── Gemfile              # Ruby dependencies
├── index.md             # Homepage
└── README.md            # This file
```

## Customization

- **Theme**: Currently using the `minima` theme. You can change this in `_config.yml`
- **Styling**: Add custom CSS in `assets/css/style.scss`
- **Layout**: Create custom layouts in `_layouts/` directory
- **Navigation**: Modify navigation in `_includes/header.html`

## Features

- ✅ Jekyll-powered static site
- ✅ GitHub Pages compatible
- ✅ Syntax highlighting for code blocks
- ✅ SEO optimized
- ✅ RSS feed
- ✅ Mobile responsive
- ✅ Clean markdown formatting

## Adding More Posts

To add new posts:

1. Create a new file in `_posts/` directory
2. Use the naming convention: `YYYY-MM-DD-title.md`
3. Include front matter at the top:

```yaml
---
layout: post
title: "Your Post Title"
date: 2025-02-10
author: "Your Name"
tags: [tag1, tag2, tag3]
description: "Post description"
---
```

## Original Content

This repository contains a converted Medium article:
- **Original Author**: Ahmed Ibrahim, PhD
- **Published**: February 10, 2025
- **Topic**: Fine-Tuning LLMs with PDF Documents
