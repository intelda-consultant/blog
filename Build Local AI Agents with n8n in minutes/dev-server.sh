#!/bin/bash

# Local development script for GitHub Pages Jekyll site
# Make sure you have Ruby and Bundler installed

echo "🚀 Starting Jekyll development server..."
echo "📁 Working directory: $(pwd)"

# Check if Bundler is installed
if ! command -v bundle &> /dev/null; then
    echo "❌ Bundler not found. Installing..."
    gem install bundler
fi

# Check if Gemfile exists
if [ ! -f "Gemfile" ]; then
    echo "❌ Gemfile not found. Make sure you're in the right directory."
    exit 1
fi

# Install dependencies
echo "📦 Installing dependencies..."
bundle install

# Start the development server
echo "🌐 Starting Jekyll server..."
echo "📱 Your site will be available at: http://localhost:4000"
echo "🔄 Press Ctrl+C to stop the server"
echo ""

bundle exec jekyll serve --livereload --incremental
