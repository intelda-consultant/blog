#!/bin/bash

# GitHub Pages Blog Setup Script
# This script helps you deploy your converted blog to GitHub Pages

echo "🚀 GitHub Pages Blog Setup"
echo "=========================="
echo

# Check if we're in the right directory
if [ ! -f "_config.yml" ]; then
    echo "❌ Error: Please run this script from the github-pages-blog directory"
    echo "Usage: cd github-pages-blog && bash setup.sh"
    exit 1
fi

echo "📋 Blog Statistics:"
echo "- Total posts: $(ls _posts/*.md | wc -l | tr -d ' ')"
echo "- Categories: $(ls categories/*.md 2>/dev/null | wc -l | tr -d ' ')"
echo "- Configuration files: $(ls *.yml *.md | wc -l | tr -d ' ')"
echo

# Function to prompt for user input
prompt_for_input() {
    local prompt="$1"
    local default="$2"
    local varname="$3"
    
    if [ -n "$default" ]; then
        read -p "$prompt [$default]: " input
        if [ -z "$input" ]; then
            input="$default"
        fi
    else
        read -p "$prompt: " input
    fi
    
    eval $varname="'$input'"
}

echo "🔧 Let's configure your blog..."
echo

# Get user configuration
prompt_for_input "Enter your blog title" "My Tech Blog" BLOG_TITLE
prompt_for_input "Enter your email" "your-email@example.com" BLOG_EMAIL
prompt_for_input "Enter your GitHub username" "" GITHUB_USERNAME
prompt_for_input "Enter your repository name" "blog" REPO_NAME
prompt_for_input "Enter a description for your blog" "A collection of posts about AI, programming, and technology" BLOG_DESCRIPTION

# Determine the site URL
if [ "$REPO_NAME" = "${GITHUB_USERNAME}.github.io" ]; then
    SITE_URL="https://${GITHUB_USERNAME}.github.io"
else
    SITE_URL="https://${GITHUB_USERNAME}.github.io/${REPO_NAME}"
fi

echo
echo "📝 Updating configuration files..."

# Update _config.yml
cat > _config.yml << EOF
title: $BLOG_TITLE
email: $BLOG_EMAIL
description: >-
  $BLOG_DESCRIPTION
baseurl: ""
url: "$SITE_URL"
github_username: $GITHUB_USERNAME

# Build settings
markdown: kramdown
theme: minima
plugins:
  - jekyll-feed
  - jekyll-sitemap
  - jekyll-seo-tag

# Pagination
paginate: 10
paginate_path: "/page:num/"

# Exclude from processing
exclude:
  - Gemfile
  - Gemfile.lock
  - node_modules
  - vendor/bundle/
  - vendor/cache/
  - vendor/gems/
  - vendor/ruby/
  - setup.sh
  - enhance_blog.py
  - convert_to_github_pages.py

# Collections
collections:
  pages:
    output: true
    permalink: /:name/

# Defaults
defaults:
  - scope:
      path: ""
      type: "posts"
    values:
      layout: "post"
      author: "$GITHUB_USERNAME"
  - scope:
      path: ""
      type: "pages"
    values:
      layout: "page"

# SEO settings
author: $GITHUB_USERNAME
social:
  name: $GITHUB_USERNAME
  links:
    - https://github.com/$GITHUB_USERNAME

# Google Analytics (uncomment and add your tracking ID)
# google_analytics: UA-XXXXXXXX-X
EOF

# Update Gemfile
cat > Gemfile << EOF
source "https://rubygems.org"

gem "github-pages", group: :jekyll_plugins
gem "jekyll-feed", "~> 0.12"
gem "jekyll-sitemap"
gem "jekyll-seo-tag"

# Windows and JRuby does not include zoneinfo files, so bundle the tzinfo-data gem
# and associated library.
platforms :mingw, :x64_mingw, :mswin, :jruby do
  gem "tzinfo", "~> 1.2"
  gem "tzinfo-data"
end

# Performance-booster for watching directories on Windows
gem "wdm", "~> 0.1.1", :platforms => [:mingw, :x64_mingw, :mswin]
EOF

# Create a navigation file
mkdir -p _data
cat > _data/navigation.yml << EOF
- name: Home
  url: /
- name: About
  url: /about/
- name: Archive
  url: /archive/
- name: Categories
  url: /categories/
EOF

# Create a categories index page
cat > categories.md << EOF
---
layout: page
title: Categories
permalink: /categories/
---

# Post Categories

Browse posts by category:

{% for category in site.categories %}
## {{ category[0] }}
{% for post in category[1] %}
- [{{ post.title }}]({{ post.url }}) - {{ post.date | date: "%B %d, %Y" }}
{% endfor %}
{% endfor %}
EOF

# Update the main README
cat > README.md << EOF
# $BLOG_TITLE

$BLOG_DESCRIPTION

This blog is built with Jekyll and hosted on GitHub Pages.

## 📊 Stats

- **Total Posts**: $(ls _posts/*.md | wc -l | tr -d ' ')
- **Categories**: $(ls categories/*.md 2>/dev/null | wc -l | tr -d ' ')
- **Site URL**: $SITE_URL

## 🚀 Quick Start

### Local Development

1. Install Ruby and Bundler
2. Install dependencies:
   \`\`\`bash
   bundle install
   \`\`\`
3. Serve the site locally:
   \`\`\`bash
   bundle exec jekyll serve
   \`\`\`
4. Open http://localhost:4000

### Deployment

1. Push to GitHub repository: \`$GITHUB_USERNAME/$REPO_NAME\`
2. Enable GitHub Pages in repository settings
3. Your blog will be available at: $SITE_URL

## 📝 Adding New Posts

Create new files in \`_posts/\` with the format: \`YYYY-MM-DD-title.md\`

\`\`\`yaml
---
layout: post
title: "Your Post Title"
date: YYYY-MM-DD
categories: [Category1, Category2]
tags: [tag1, tag2]
---

Your post content in Markdown format.
\`\`\`

## 🛠️ Customization

- Edit \`_config.yml\` for site settings
- Modify layouts in \`_layouts/\` (create this directory)
- Add custom CSS in \`assets/css/style.scss\`
- Add images to \`assets/images/\`

## 📚 Resources

- [Jekyll Documentation](https://jekyllrb.com/docs/)
- [GitHub Pages Documentation](https://docs.github.com/en/pages)
- [Minima Theme](https://github.com/jekyll/minima)

## 🤝 Contributing

Feel free to submit issues and enhancement requests!

## 📄 License

This project is licensed under the MIT License.

---

*Generated on $(date)*
EOF

echo "✅ Configuration updated successfully!"
echo

echo "🔗 Next Steps:"
echo "=============="
echo
echo "1. 📂 Create a new GitHub repository:"
echo "   - Go to https://github.com/new"
echo "   - Repository name: $REPO_NAME"
echo "   - Make it public"
echo "   - Don't initialize with README"
echo
echo "2. 🚀 Deploy to GitHub:"
echo "   git init"
echo "   git add ."
echo "   git commit -m \"Initial blog setup with $(ls _posts/*.md | wc -l | tr -d ' ') posts\""
echo "   git branch -M main"
echo "   git remote add origin https://github.com/$GITHUB_USERNAME/$REPO_NAME.git"
echo "   git push -u origin main"
echo
echo "3. 🌐 Enable GitHub Pages:"
echo "   - Go to repository Settings → Pages"
echo "   - Source: Deploy from a branch"
echo "   - Branch: main, folder: / (root)"
echo "   - Save"
echo
echo "4. 🎉 Your blog will be available at:"
echo "   $SITE_URL"
echo
echo "💡 Pro Tips:"
echo "- Review and edit posts in _posts/ before publishing"
echo "- Add your own About page content in about.md"
echo "- Customize the theme by creating _layouts/ and assets/ directories"
echo "- Add Google Analytics by uncommenting the line in _config.yml"
echo
echo "🔍 For local testing:"
echo "   bundle install"
echo "   bundle exec jekyll serve"
echo "   Open http://localhost:4000"
echo

# Create a quick git setup script
cat > git-setup.sh << EOF
#!/bin/bash
# Quick Git Setup for GitHub Pages Blog

echo "🔧 Setting up Git repository..."

git init
git add .
git commit -m "Initial blog setup with $(ls _posts/*.md | wc -l | tr -d ' ') posts"
git branch -M main

echo "✅ Local repository initialized!"
echo
echo "📤 To push to GitHub, run:"
echo "git remote add origin https://github.com/$GITHUB_USERNAME/$REPO_NAME.git"
echo "git push -u origin main"
echo
echo "Remember to create the repository on GitHub first!"
EOF

chmod +x git-setup.sh

echo "📦 Created git-setup.sh for easy repository initialization"
echo "   Run: ./git-setup.sh"
echo
echo "🎯 Setup complete! Your blog is ready for deployment."
