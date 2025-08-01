---
categories:
- AI
- Programming
- Data Science
- Tutorial
date: 2025-04-28
layout: post
tags:
- python
- machine-learning
- llm
- tutorial
title: Building an AI-Powered Research Assistant in Minutes (or have it ready!)
---


* * *

### **Building an AI-Powered Research Assistant in Minutes (or have it ready!)**

####  **This is a practical tutorial focused on developing an AI-powered research assistant using OpenRouter, RAG, and Streamlit.**

![](https://cdn-images-1.medium.com/max/800/1*crN0DNMgaa_PuC_gyJn-uw.png)

 **Introduction**  
Imagine you’re a journalist investigating a breaking news story. You need answers fast, but AI models often lack real-time data, and manual web searches are time-consuming. What if you could blend the power of language models with live web data — _in one click_?

![](https://cdn-images-1.medium.com/max/800/1*fIedjrtHE15hudQFGSfo8Q.png)

In this tutorial, I’ll show you how to build **“Chatty”** — a Streamlit app that answers questions using either direct AI knowledge or live web searches augmented with Retrieval-Augmented Generation (RAG). We’ll leverage OpenRouter for model flexibility, async web crawling for speed, and Mistral-7B for cost-effective intelligence.

### Why This Stack?

 **The Problem** :

  * Pure LLMs lack real-time data (e.g., “Who won today’s election?”)
  * Manual web research is slow and inconsistent

 **Our Solution** :

  *  **OpenRouter** : Access multiple models (like Mistral-7B) through a single API
  *  **RAG** : Ground answers in crawled web content
  *  **Async I/O** : Concurrently fetch/process 5+ web pages
  *  **Streamlit** : Build a clean UI in <100 lines of frontend code

 _Our final app: Switch modes, ask questions, get sourced answers_

### 2\. Setup: Dependencies & API Keys

####  **Step 1: Install Libraries**

     pip install streamlit duckduckgo-search trafilatura langchain chromadb aiohttp python-dotenvpip install streamlit duckduckgo-search trafilatura langchain chromadb aiohttp python-dotenv

####  **Step 2: Get OpenRouter API Key**

  1. Sign up at [OpenRouter.ai](https://openrouter.ai/)
  2. Create an API key in _Dashboard → Keys_
  3. Store it in `.env`:

    OPENROUTER_API_KEY="your-key-here"

 **Step 3: Base Configuration**  
The code initializes OpenRouter with these critical settings:

    # Configure OpenAI vars for LangChain compatibility    
    os.environ["OPENAI_API_KEY"] = OPENROUTER_API_KEY    
    os.environ["OPENAI_API_BASE"] = "https://openrouter.ai/api/v1"    
    MODEL_NAME = "mistralai/mistral-7b-instruct:free"  # Cost-effectiv