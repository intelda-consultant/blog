#!/usr/bin/env python3
"""
Blog Post Organizer and Enhancer
Analyzes and improves the converted blog posts
"""

import os
import re
import yaml
from collections import defaultdict, Counter
from pathlib import Path

def analyze_posts(posts_dir):
    """Analyze all posts and generate statistics"""
    post_stats = {
        'total_posts': 0,
        'posts_by_month': defaultdict(int),
        'posts_by_category': defaultdict(int),
        'word_counts': [],
        'posts_without_proper_titles': [],
        'short_posts': [],
        'topics': Counter(),
    }
    
    for filename in os.listdir(posts_dir):
        if filename.endswith('.md'):
            filepath = os.path.join(posts_dir, filename)
            
            with open(filepath, 'r', encoding='utf-8') as f:
                content = f.read()
            
            # Split front matter and content
            parts = content.split('---', 2)
            if len(parts) >= 3:
                front_matter_str = parts[1]
                post_content = parts[2]
                
                try:
                    front_matter = yaml.safe_load(front_matter_str)
                except:
                    front_matter = {}
            else:
                front_matter = {}
                post_content = content
            
            # Basic stats
            post_stats['total_posts'] += 1
            
            # Date analysis
            if 'date' in front_matter:
                date_str = str(front_matter['date'])
                month = date_str[:7]  # YYYY-MM
                post_stats['posts_by_month'][month] += 1
            
            # Word count
            word_count = len(post_content.split())
            post_stats['word_counts'].append(word_count)
            
            # Check for short posts (less than 100 words)
            if word_count < 100:
                post_stats['short_posts'].append({
                    'filename': filename,
                    'title': front_matter.get('title', 'No title'),
                    'word_count': word_count
                })
            
            # Topic extraction (simple keyword analysis)
            title = front_matter.get('title', '').lower()
            content_lower = post_content.lower()
            
            keywords = [
                'ai', 'artificial intelligence', 'machine learning', 'llm', 'language model',
                'python', 'java', 'programming', 'code', 'development',
                'docker', 'n8n', 'automation', 'workflow',
                'data', 'analysis', 'algorithm', 'tutorial', 'guide',
                'neural network', 'deep learning', 'gpt', 'ollama',
                'knowledge graph', 'rag', 'pdf', 'extraction'
            ]
            
            for keyword in keywords:
                if keyword in title or keyword in content_lower:
                    post_stats['topics'][keyword] += 1
    
    return post_stats

def enhance_posts_with_categories_and_tags(posts_dir):
    """Add appropriate categories and tags to posts based on content"""
    
    category_keywords = {
        'AI': ['ai', 'artificial intelligence', 'machine learning', 'llm', 'language model', 'gpt', 'neural', 'deep learning'],
        'Programming': ['python', 'java', 'code', 'programming', 'development', 'algorithm', 'data structure'],
        'Tools': ['docker', 'n8n', 'automation', 'workflow', 'tool', 'vscode', 'ollama'],
        'Data Science': ['data', 'analysis', 'feature engineering', 'extraction', 'pipeline', 'knowledge graph'],
        'Tutorial': ['guide', 'tutorial', 'step-by-step', 'how to', 'hands-on'],
    }
    
    tag_keywords = {
        'python': ['python'],
        'java': ['java'],
        'machine-learning': ['machine learning', 'ml', 'model'],
        'llm': ['llm', 'large language model', 'language model'],
        'docker': ['docker'],
        'automation': ['automation', 'n8n', 'workflow'],
        'ai-agents': ['agent', 'multi-agent'],
        'tutorial': ['tutorial', 'guide', 'step-by-step'],
        'data-science': ['data science', 'data analysis', 'feature engineering'],
        'pdf': ['pdf'],
        'knowledge-graph': ['knowledge graph'],
        'prompt-engineering': ['prompt engineering', 'prompt'],
    }
    
    enhanced_count = 0
    
    for filename in os.listdir(posts_dir):
        if filename.endswith('.md'):
            filepath = os.path.join(posts_dir, filename)
            
            with open(filepath, 'r', encoding='utf-8') as f:
                content = f.read()
            
            # Split front matter and content
            parts = content.split('---', 2)
            if len(parts) >= 3:
                front_matter_str = parts[1]
                post_content = parts[2]
                
                try:
                    front_matter = yaml.safe_load(front_matter_str)
                except:
                    continue
            else:
                continue
            
            # Analyze content for categories and tags
            full_text = (front_matter.get('title', '') + ' ' + post_content).lower()
            
            # Determine categories
            categories = []
            for category, keywords in category_keywords.items():
                for keyword in keywords:
                    if keyword in full_text:
                        if category not in categories:
                            categories.append(category)
                        break
            
            # Determine tags
            tags = []
            for tag, keywords in tag_keywords.items():
                for keyword in keywords:
                    if keyword in full_text:
                        if tag not in tags:
                            tags.append(tag)
                        break
            
            # Update front matter if we found categories or tags
            if categories or tags:
                if categories:
                    front_matter['categories'] = categories
                if tags:
                    front_matter['tags'] = tags
                
                # Reconstruct the file
                new_front_matter = yaml.dump(front_matter, default_flow_style=False)
                new_content = f"---\n{new_front_matter}---\n{post_content}"
                
                with open(filepath, 'w', encoding='utf-8') as f:
                    f.write(new_content)
                
                enhanced_count += 1
    
    return enhanced_count

def create_category_pages(base_dir, posts_dir):
    """Create category pages for better navigation"""
    categories = set()
    
    # Collect all categories
    for filename in os.listdir(posts_dir):
        if filename.endswith('.md'):
            filepath = os.path.join(posts_dir, filename)
            
            with open(filepath, 'r', encoding='utf-8') as f:
                content = f.read()
            
            parts = content.split('---', 2)
            if len(parts) >= 3:
                try:
                    front_matter = yaml.safe_load(parts[1])
                    if 'categories' in front_matter:
                        if isinstance(front_matter['categories'], list):
                            categories.update(front_matter['categories'])
                        else:
                            categories.add(front_matter['categories'])
                except:
                    continue
    
    # Create category directory
    categories_dir = os.path.join(base_dir, 'categories')
    os.makedirs(categories_dir, exist_ok=True)
    
    # Create a page for each category
    for category in categories:
        category_slug = category.lower().replace(' ', '-')
        category_page = f"""---
layout: page
title: "{category} Posts"
permalink: /categories/{category_slug}/
---

# {category} Posts

""" + """{% for post in site.posts %}
  {% if post.categories contains '""" + category + """' %}
- **{{ post.date | date: "%B %d, %Y" }}** - [{{ post.title }}]({{ post.url }})
  {% endif %}
{% endfor %}
"""
        
        category_file = os.path.join(categories_dir, f"{category_slug}.md")
        with open(category_file, 'w', encoding='utf-8') as f:
            f.write(category_page)
    
    return len(categories)

def generate_report(stats, posts_dir):
    """Generate a comprehensive report about the blog"""
    
    avg_words = sum(stats['word_counts']) / len(stats['word_counts']) if stats['word_counts'] else 0
    
    report = f"""
# Blog Analysis Report

## Overview
- **Total Posts**: {stats['total_posts']}
- **Average Word Count**: {avg_words:.0f} words
- **Date Range**: {min(stats['posts_by_month'].keys())} to {max(stats['posts_by_month'].keys())}

## Posts by Month
"""
    
    for month in sorted(stats['posts_by_month'].keys()):
        report += f"- {month}: {stats['posts_by_month'][month]} posts\n"
    
    report += "\n## Popular Topics\n"
    for topic, count in stats['topics'].most_common(10):
        report += f"- {topic.title()}: {count} posts\n"
    
    if stats['short_posts']:
        report += f"\n## Short Posts (< 100 words)\n"
        for post in stats['short_posts'][:10]:  # Show first 10
            report += f"- {post['title']} ({post['word_count']} words)\n"
    
    report += f"\n## Recommendations\n"
    report += f"- Consider expanding short posts with more detailed content\n"
    report += f"- Add more images and code examples to improve readability\n"
    report += f"- Create series of related posts for popular topics\n"
    report += f"- Add author information and social sharing buttons\n"
    
    return report

def main():
    """Main function to analyze and enhance the blog"""
    base_dir = "/Users/fakhri/Downloads/Blog/github-pages-blog"
    posts_dir = os.path.join(base_dir, "_posts")
    
    print("🔍 Analyzing blog posts...")
    stats = analyze_posts(posts_dir)
    
    print("✨ Enhancing posts with categories and tags...")
    enhanced_count = enhance_posts_with_categories_and_tags(posts_dir)
    
    print("📁 Creating category pages...")
    category_count = create_category_pages(base_dir, posts_dir)
    
    print("📊 Generating analysis report...")
    report = generate_report(stats, posts_dir)
    
    # Save report
    report_file = os.path.join(base_dir, "BLOG_ANALYSIS_REPORT.md")
    with open(report_file, 'w', encoding='utf-8') as f:
        f.write(report)
    
    print(f"\n✅ Blog enhancement complete!")
    print(f"- Analyzed {stats['total_posts']} posts")
    print(f"- Enhanced {enhanced_count} posts with categories/tags")
    print(f"- Created {category_count} category pages")
    print(f"- Generated analysis report: BLOG_ANALYSIS_REPORT.md")
    
    # Show summary
    print(f"\n📈 Quick Stats:")
    print(f"- Most popular topics: {', '.join([topic for topic, _ in stats['topics'].most_common(3)])}")
    print(f"- Average post length: {sum(stats['word_counts']) / len(stats['word_counts']):.0f} words")
    print(f"- Posts need review: {len(stats['short_posts'])} short posts")

if __name__ == "__main__":
    main()
