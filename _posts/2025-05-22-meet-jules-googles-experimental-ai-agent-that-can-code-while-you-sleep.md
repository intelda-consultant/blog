---
categories:
- AI
- Programming
- Tools
- Data Science
- Tutorial
date: 2025-05-22
layout: post
tags:
- machine-learning
- automation
- ai-agents
- prompt-engineering
title: "Meet Jules: Google\u2019s Experimental AI Agent That Can Code While You Sleep"
---


* * *

![](https://cdn-images-1.medium.com/max/800/1*36r7kNUsscmM3DuKI83ptQ.png)

### Meet Jules: Google’s Experimental AI Agent That Can Code While You Sleep

Recently, I learned about an experimental project from Google named Jules, which you can check out at [jules.google/](https://jules.google/). It functions more like an autonomous engineering intern who comprehends your project rather than just a co-pilot riding alongside you.

> Not a paid member? [Read here for Free](https://medium.com/@swengcrunch/meet-jules-googles-experimental-ai-agent-that-can-code-while-you-sleep-5c87e77d8882?sk=bbdaad748f487f04c87c1a82a556511f)!

 **What is Jules, Anyway?**

According to the folks at Google, Jules is an **experimental AI-powered coding agent** that’s currently in public beta. The key difference from tools you might know is its **autonomous, asynchronous** nature. This means:

  1.  **Autonomous:** You give it a high-level goal, and it figures out the steps needed to achieve it. It doesn’t just wait for you to type; it actively works through the problem.
  2.  **Asynchronous:** You submit a task, and it works in the background. You close your laptop, go to class, grab lunch, or maybe even sleep, and Jules keeps churning away in a secure cloud environment.

![](https://cdn-images-1.medium.com/max/800/1*N-GEZgrOItj6k1TW8zshTQ.png)Screenshot after signing in to Jules with your Google credentials!

 **How Does It Work Its Magic?**

Jules isn’t just looking at a few lines of code. When you give it access to your GitHub repository, it reportedly:

  *  **Clones your whole project:** It pulls your entire codebase into a secure virtual machine (VM) in the Google Cloud.
  *  **Understands the big picture:** By having the full repo, it can grasp the context of your project — how different files connect, what libraries you’re using, and the overall structure.
  *  **Installs dependencies:** Just like you would, it sets up the environment needed to actually _run_ and _test_ your code.
  *  **Executes a plan:** Based on your task, it forms a detailed plan (more on this below) and starts making changes.

 **What Kind of Tasks Can You Give It?**

Based on the description, Jules is designed for practical coding work:

  *  **Bug Fixing:** Point it to an issue, and it might figure out the fix.
  *  **Feature Building:** Ask it to add a small, well-defined feature.
  *  **Writing Tests:** A seemingly perfect use case for AI — let it generate those test cases you keep putting off!
  *  **Updating Dependencies:** Keep your project’s libraries fresh.
  *  **Generating Changelogs:** A neat feature — it can even create audio summaries of what’s changed recently.

 **Let’s Look at a Prompt Example**

Okay, so what would you actually _ask_ Jules to do? Here’s a prompt you could use to build a cool project — a live soccer score website:

    Build a simple live soccer score website for fans. The site should:  
      
    Fetch and display live scores for ongoing soccer matches using a public football API (such as Sportmonks or Live Score API).  
      
    Show key information for each match: league name, date and time, home and away teams, current score, and match status.  
      
    Refresh the live scores automatically every minute.  
      
    Use a modern frontend framework (React or Vue) for the user interface.  
      
    Style the site with a clean, responsive design using Bootstrap or similar.  
      
    Include clear instructions in the README for how to set up API keys, run the project locally, and deploy it.  
      
    Organize the codebase for easy future enhancements, such as filtering by league or adding match event details.

This prompt is great because it’s clear and specific about the goal (live scores, key info, auto-refresh) but also gives Jules flexibility on _how_ to achieve it (choosing between React/Vue, Bootstrap/similar, specific API if not specified). It covers fetching data, building a UI, styling, and even documentation — a complete mini-project! This really tests Jules’ ability to act as an agent, handling multiple parts of the development process.

 **The Workflow: You’re Still in Control**

This isn’t about handing over the keys entirely. Jules works _with_ you:

  1.  **You Submit a Task:** Write a clear prompt, like the soccer score website example above, or something smaller like “Write a unit test for the calculateDiscount function in utils.js.”
  2.  **Jules Plans:** Before touching anything, it creates a detailed plan outlining how it intends to solve the task, along with its reasoning. For the soccer site, this plan might include steps like “Set up React project,” “Find and integrate API,” “Build components for match display,” “Implement refresh logic,” “Add Bootstrap styling,” and “Write README.”
  3.  **You Review & Approve:** **This is key.** You look at the plan. Does it make sense? Does it match what you want? You can modify the plan or approve it.
  4.  **Jules Works:** Once approved, it starts executing the plan in its secure VM. You can apparently see its progress in real-time.
  5.  **You Review Changes:** As it completes steps or the whole task, you get to see the exact code changes (the “diffs”). You can ask for revisions via chat if needed.
  6.  **Push to GitHub:** When you’re happy, Jules pushes the changes to a new branch in your repo, with you listed as the pull request (PR) author.

 **Privacy and Security**

Giving an AI access to your private code might sound scary, but Google says:

  *  **Your code is private:** Jules does not train its underlying AI model on your private code.
  *  **Isolated environment:** All the work happens in temporary, secure VMs that are specifically spun up for your task and then discarded.

 **Getting Started (According to the Description)**

The description says you can apparently sign up and try it out:

1\. Visit [jules.google/](https://www.google.com/url?sa=E&q=https%3A%2F%2Fjules.google%2F)

2\. Sign in with your Google account and connect your GitHub.

![](https://cdn-images-1.medium.com/max/800/1*QgalFdgIpATqZ1QBAe9Dog.png)Task to submit to Jules

3\. Choose a repo and a branch.

4\. Submit a task prompt (like the soccer site example!).

![](https://cdn-images-1.medium.com/max/800/1*WR3T7ZUV7qsr6uxDErclhQ.png)

5\. Review Jules’ plan, approve it, and monitor progress.

![](https://cdn-images-1.medium.com/max/800/1*l1UegppxspD-KcULeXlsag.png)Jules is working on the submitted prompt!

6\. Review the code changes and finalize by pushing to GitHub.

![](https://cdn-images-1.medium.com/max/800/1*AywpNF4qr6pQjNHf4yS8Ew.png)The generated website landing page!

###  **Current Status**

Jules is described as being in **Public Beta** and is currently **free to use** , though with potential usage limits. Google plans to introduce pricing later.