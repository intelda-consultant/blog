# 🚀 GitHub Pages Deployment Guide

Follow these steps to deploy your n8n AI agents tutorial to GitHub Pages.

## 📋 Prerequisites

- GitHub account
- Git installed on your computer
- Basic familiarity with Git commands

## 🔧 Setup Steps

### 1. Create GitHub Repository

1. Go to [GitHub](https://github.com) and sign in
2. Click the **"+"** button → **"New repository"**
3. Name your repository (e.g., `n8n-ai-agents-tutorial`)
4. Make it **Public** (required for free GitHub Pages)
5. **Don't** initialize with README (we already have files)
6. Click **"Create repository"**

### 2. Upload Your Files

**Option A: Using Git (Recommended)**

```bash
# Navigate to your project directory
cd "/Users/fakhri/Downloads/Build Local AI Agents with n8n in minutes"

# Initialize git repository
git init

# Add all files
git add .

# Commit files
git commit -m "Initial commit: n8n AI agents tutorial"

# Add remote repository (replace with your repo URL)
git remote add origin https://github.com/YOUR_USERNAME/YOUR_REPO_NAME.git

# Push to GitHub
git branch -M main
git push -u origin main
```

**Option B: Using GitHub Web Interface**

1. On your repository page, click **"uploading an existing file"**
2. Drag and drop all the files from your local directory
3. Commit the changes

### 3. Enable GitHub Pages

1. Go to your repository on GitHub
2. Click **"Settings"** tab
3. Scroll down to **"Pages"** in the left sidebar
4. Under **"Source"**, select **"GitHub Actions"**
5. The workflow will automatically trigger

### 4. Access Your Site

- Your site will be available at: `https://YOUR_USERNAME.github.io/YOUR_REPO_NAME`
- It may take a few minutes for the first deployment
- Check the **"Actions"** tab to monitor deployment progress

## ⚙️ Configuration

### Update Site URLs

1. Edit `_config.yml`:
   ```yaml
   url: "https://YOUR_USERNAME.github.io"
   baseurl: "/YOUR_REPO_NAME"
   ```

2. Update social links and author information as needed

### Customize Content

- **Main tutorial**: Edit `index.md`
- **About page**: Edit `about.md`
- **Site config**: Edit `_config.yml`
- **Add pages**: Create new `.md` files with front matter

## 🔍 Troubleshooting

### Common Issues

1. **Site not loading**: Check the Actions tab for build errors
2. **Images not showing**: Verify images are in `assets/images/` directory
3. **Styling issues**: Check Jekyll build logs in Actions

### Getting Help

- Check [Jekyll documentation](https://jekyllrb.com/docs/)
- Review [GitHub Pages documentation](https://docs.github.com/en/pages)
- Examine the Actions tab for detailed error logs

## 🎨 Customization Options

### Themes
- Current theme: **Minima**
- Change in `_config.yml`: `theme: THEME_NAME`
- Popular alternatives: `jekyll-theme-cayman`, `minimal-mistakes-jekyll`

### Add Features
- Comments: Add Disqus integration
- Analytics: Add Google Analytics tracking ID
- SEO: Already included via `jekyll-seo-tag`

## 📁 File Structure Reference

```
your-repo/
├── .github/workflows/jekyll.yml    # Auto-deployment
├── .gitignore                      # Git ignore rules
├── _config.yml                     # Jekyll configuration
├── Gemfile                         # Ruby dependencies
├── README.md                       # Repository documentation
├── DEPLOYMENT.md                   # This guide
├── index.md                        # Main tutorial page
├── about.md                        # About page
├── assets/images/                  # Tutorial screenshots
└── imgs/                          # Original images (optional)
```

## ✅ Next Steps

After deployment:

1. **Share your tutorial**: The live URL can be shared with others
2. **Update content**: Make changes locally and push to update the site
3. **Monitor traffic**: Add Google Analytics for visitor insights
4. **Enhance SEO**: Add meta descriptions and optimize content

---

🎉 **Congratulations!** Your n8n AI agents tutorial is now live on GitHub Pages!
