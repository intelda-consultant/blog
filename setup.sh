#!/bin/bash

# Script to set up GitHub Pages directory structure
# Run this script to organize files for GitHub Pages deployment

echo "Setting up GitHub Pages structure..."

# Create necessary directories
mkdir -p _posts
mkdir -p _layouts
mkdir -p _includes
mkdir -p assets/css

# Move the blog post to _posts directory with proper naming
if [ -f "fine-tuning-llms-pdf-guide.md" ]; then
    mv fine-tuning-llms-pdf-guide.md _posts/2025-02-10-fine-tuning-llms-pdf-guide.md
    echo "✅ Moved blog post to _posts directory"
fi

# Create a basic custom CSS file
cat > assets/css/style.scss << 'EOF'
---
---

@import "minima";

// Custom styles
.highlight {
    border-radius: 5px;
}

.post-content {
    h2, h3, h4 {
        margin-top: 2rem;
    }
    
    code {
        background-color: #f8f8f8;
        padding: 2px 4px;
        border-radius: 3px;
    }
    
    blockquote {
        border-left: 4px solid #e1e5e9;
        padding-left: 1rem;
        color: #6a737d;
        font-style: italic;
    }
}
EOF

echo "✅ Created custom CSS file"

# Create a basic post layout
cat > _layouts/post.html << 'EOF'
---
layout: default
---

<article class="post h-entry" itemscope itemtype="http://schema.org/BlogPosting">

  <header class="post-header">
    <h1 class="post-title p-name" itemprop="name headline">{{ page.title | escape }}</h1>
    <p class="post-meta">
      <time class="dt-published" datetime="{{ page.date | date_to_xmlschema }}" itemprop="datePublished">
        {%- assign date_format = site.minima.date_format | default: "%b %-d, %Y" -%}
        {{ page.date | date: date_format }}
      </time>
      {%- if page.author -%}
        • <span itemprop="author" itemscope itemtype="http://schema.org/Person"><span class="p-author h-card" itemprop="name">{{ page.author }}</span></span>
      {%- endif -%}
    </p>
  </header>

  <div class="post-content e-content" itemprop="articleBody">
    {{ content }}
  </div>

  {%- if site.disqus.shortname -%}
    {%- include disqus_comments.html -%}
  {%- endif -%}

  <a class="u-url" href="{{ page.url | relative_url }}" hidden></a>
</article>
EOF

echo "✅ Created custom post layout"

echo ""
echo "🎉 GitHub Pages setup complete!"
echo ""
echo "Next steps:"
echo "1. Push these files to: https://github.com/intelda-consultant/blog/"
echo "2. Enable GitHub Pages in repository settings"
echo "3. Your site will be available at: https://intelda-consultant.github.io/blog/"
echo ""
echo "To run locally:"
echo "  bundle install"
echo "  bundle exec jekyll serve"
