#!/bin/bash

# Deployment script for Intelda Consultant Blog
# This script will set up and deploy the blog to GitHub Pages

echo "🚀 Deploying Intelda Consultant Blog to GitHub Pages..."

# Check if we're in the right directory
if [ ! -f "_config.yml" ]; then
    echo "❌ Error: _config.yml not found. Please run this script from the blog directory."
    exit 1
fi

# Run the setup script first
if [ -f "setup.sh" ]; then
    echo "📁 Setting up directory structure..."
    ./setup.sh
fi

# Initialize git repository if not already initialized
if [ ! -d ".git" ]; then
    echo "🔧 Initializing git repository..."
    git init
    git branch -M main
fi

# Add remote origin if not already added
if ! git remote | grep -q "origin"; then
    echo "🔗 Adding remote repository..."
    git remote add origin https://github.com/intelda-consultant/blog.git
fi

# Add all files
echo "📦 Adding files to git..."
git add .

# Commit changes
echo "💾 Committing changes..."
git commit -m "Deploy Intelda Consultant Blog with LLM fine-tuning guide

- Add Jekyll configuration for GitHub Pages
- Include complete blog post on LLM fine-tuning with PDFs
- Set up responsive design with Minima theme
- Configure SEO and RSS feeds
- Add custom styling and layouts"

# Push to GitHub
echo "🚀 Pushing to GitHub..."
git push -u origin main

echo ""
echo "✅ Deployment complete!"
echo ""
echo "🌐 Your blog will be available at:"
echo "   https://intelda-consultant.github.io/blog/"
echo ""
echo "📝 To enable GitHub Pages:"
echo "   1. Go to: https://github.com/intelda-consultant/blog/settings/pages"
echo "   2. Under 'Source', select 'Deploy from a branch'"
echo "   3. Select 'main' branch and '/ (root)' folder"
echo "   4. Click 'Save'"
echo ""
echo "⏱️  It may take a few minutes for your site to be live after enabling GitHub Pages."
