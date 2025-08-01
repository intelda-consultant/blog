# Build Local AI Agents with n8n - GitHub Pages

This repository contains a tutorial on building local AI agents using n8n workflow automation platform.

## 🚀 Quick Start

### Option 1: View Online
Visit the GitHub Pages site: [Your GitHub Pages URL]

### Option 2: Run Locally

1. **Install Jekyll** (if you haven't already):
   ```bash
   gem install bundler jekyll
   ```

2. **Clone and setup**:
   ```bash
   git clone [your-repo-url]
   cd [repo-name]
   bundle install
   ```

3. **Serve locally**:
   ```bash
   bundle exec jekyll serve
   ```

4. **View at**: `http://localhost:4000`

## 📁 Project Structure

```
├── _config.yml          # Jekyll configuration
├── Gemfile              # Ruby dependencies
├── index.md             # Main tutorial content
├── about.md             # About page
├── assets/
│   └── images/          # Tutorial screenshots
├── imgs/                # Original images (can be removed after setup)
└── README.md            # This file
```

## 🛠 Customization

### Update Site Configuration
Edit `_config.yml` to customize:
- Site title and description
- Author information
- Social links
- Google Analytics (optional)

### Modify Content
- Main tutorial: `index.md`
- About page: `about.md`
- Add new pages by creating `.md` files with front matter

### Styling
This site uses the Minima theme. You can:
- Override styles by creating `_sass/` directory
- Add custom CSS in `assets/css/style.scss`
- Switch themes by updating the `theme` in `_config.yml`

## 📖 Tutorial Content

The tutorial covers:
- What is n8n and why use AI agents
- Installing n8n locally with Docker
- Building AI agent workflows
- Integrating with external tools (Airtable)
- Testing and scaling your automations

## 🤝 Contributing

1. Fork the repository
2. Create a feature branch
3. Make your changes
4. Submit a pull request

## 📝 License

This tutorial content is available under [your chosen license].

---

**Ready to build AI agents?** Start with the [main tutorial](index.md)!
