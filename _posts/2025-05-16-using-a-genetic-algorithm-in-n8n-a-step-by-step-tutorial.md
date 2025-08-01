---
categories:
- AI
- Programming
- Tools
- Data Science
- Tutorial
date: 2025-05-16
layout: post
tags:
- machine-learning
- automation
- tutorial
title: 'Using a Genetic Algorithm in n8n: A Step-by-Step Tutorial'
---


* * *

![](https://cdn-images-1.medium.com/max/800/1*H6Z1U5bF-PZ2RMfckkQ8Xg.png)

### Using a Genetic Algorithm in n8n: A Step-by-Step Tutorial

### 🧠 What You’ll Learn

In this tutorial, you’ll learn how to apply a **Genetic Algorithm (GA)** to solve a simple optimization problem using **n8n**. Using the **Function Node** to simulate evolution, we'll build a workflow, enabling automated decision-making inside your automation pipelines.

### 🧩 Problem Statement

Let’s say you’re trying to select the **best email campaign** from a pool of randomly generated subject lines. Each campaign’s success is determined by how many keywords it matches with a list of ideal traits (e.g., “free”, “new”, “limited offer”).

We want to use a Genetic Algorithm to:

  * Create a population of candidate subject lines
  * Score them based on keyword match (fitness)
  * Apply crossover and mutation to evolve better candidates
  * Return the best one after a few generations

### 🔧 Workflow Overview

Your n8n workflow will include:

  1.  **Manual Trigger Node**
  2.  **Function Node** : Implements the Genetic Algorithm
  3.  **Webhook Response Node** : Returns the result

![](https://cdn-images-1.medium.com/max/800/1*R60oOhYZJ-gq_VFSCBx6Xw.png)

### 🧬 N8N Complete Workflow

    {  
      "name": "GA",  
      "nodes": [  
        {  
          "parameters": {  
            "path": "genetic-algo",  
            "options": {}  
          },  
          "id": "e9ab1ff3-fce1-42f2-a919-0613793619b7",  
          "name": "Webhook",  
          "type": "n8n-nodes-base.webhook",  
          "typeVersion": 1,  
          "position": [  
            -140,  
            -120  
          ],  
          "webhookId": "4af5da86-0413-40c7-858b-fe31505302f7"  
        },  
        {  
          "parameters": {  
            "functionCode": "const keywords = ['free', 'new', 'offer', 'limited', 'exclusive'];\nconst populationSize = 10;\nconst generations = 30;\nconst mutationRate = 0.2;\n\nfunction randomSubject() {\n  const words = ['free', 'update', 'now', 'offer', 'deal', 'new', 'today', 'sale', 'exclusive', 'alert'];\n  return Array.from({ length: 5 }, () => words[Math.floor(Math.random() * words.length)]).join(' ');\n}\n\nfunction fitness(subject) {\n  return keywords.reduce((score, keyword) => score + subject.includes(keyword), 0);\n}\n\nfunction crossover(a, b) {\n  const point = Math.floor(Math.random() * a.length);\n  return a.slice(0, point) + b.slice(point);\n}\n\nfunction mutate(subject) {\n  const words = subject.split(' ');\n  return words.map(word => (Math.random() < mutationRate ? randomSubject().split(' ')[0] : word)).join(' ');\n}\n\nlet population = Array.from({ length: populationSize }, () => randomSubject());\n\nfor (let gen = 0; gen < generations; gen++) {\n  population.sort((a, b) => fitness(b) - fitness(a));\n  const survivors = population.slice(0, populationSize / 2);\n  const children = [];\n\n  while (children.length < populationSize) {\n    const [p1, p2] = [\n      survivors[Math.floor(Math.random() * survivors.length)],\n      survivors[Math.floor(Math.random() * survivors.length)],\n    ];\n    let child = crossover(p1, p2);\n    child = mutate(child);\n    children.push(child);\n  }\n\n  population = children;\n}\n\nconst best = population.sort((a, b) => fitness(b) - fitness(a))[0];\n\nreturn [{ json: { bestSubjectLine: best, fitness: fitness(best) } }];"  
          },  
          "id": "23dbe15b-a611-4542-997c-58d5fbd8cdb4",  
          "name": "Genetic Algorithm",  
          "type": "n8n-nodes-base.function",  
          "typeVersion": 1,  
          "position": [  
            120,  
            -120  
          ]  
        },  
        {  
          "parameters": {  
            "options": {}  
          },  
          "id": "50e890de-c129-4daa-8d84-d37be1c7c182",  
          "name": "Return Result",  
          "type": "n8n-nodes-base.respondToWebhook",  
          "typeVersion": 1,  
          "position": [  
            360,  
            -120  
          ]  
        }  
      ],  
      "pinData": {},  
      "connections": {  
        "Webhook": {  
          "main": [  
            [  
              {  
                "node": "Genetic Algorithm",  
                "type": "main",  
                "index": 0  
              }  
            ]  
          ]  
        },  
        "Genetic Algorithm": {  
          "main": [  
            [  
              {  
                "node": "Return Result",  
                "type": "main",  
                "index": 0  
              }  
            ]  
          ]  
        }  
      },  
      "active": false,  
      "settings": {  
        "executionOrder": "v1"  
      },  
      "versionId": "de2beb42-3db0-459a-a797-abf11e55d9da",  
      "meta": {  
        "instanceId": "6349b65158df718bf45cdfd9e3be645730cb5b1f9268e352cebead5eb282bd3d"  
      },  
      "id": "Nh94gvNDOcne6XZV",  
      "tags": []  
    }

### Conclusion

You now have a fully functioning Genetic Algorithm inside n8n! This can be adapted to other optimization tasks like copywriting, routing, or scheduling — all without leaving the n8n environment.