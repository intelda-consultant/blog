---
categories:
- AI
- Programming
- Tools
- Data Science
- Tutorial
date: 2025-02-21
layout: post
tags:
- python
- machine-learning
- llm
- automation
- tutorial
- pdf
- prompt-engineering
title: 'Automating Document Analysis with AI: Your PDF Assistant Using Large Language
  Models'
---


* * *

![](https://cdn-images-1.medium.com/max/800/1*QyJSYc_901rHIQIp_MZq0Q.png)

### **Automating Document Analysis with AI: Your PDF Assistant Using Large Language Models**

 _Transform mountains of PDFs into actionable insights with the power of AI_

####  **The Sunday Night PDF Blues**

Picture this: It’s 9 p.m. on a Sunday, and you’re staring at a folder containing 50 PDF invoices that must be processed by tomorrow morning. You must read each document, extract key information, and catalogue essential details. Does this sound familiar?

Whether you’re a financial analyst processing invoices, a researcher parsing academic papers, or a student creating study materials from textbooks, manual document processing is the kind of soul-crushing work that makes you wonder: “Isn’t this exactly what computers should be doing for us?”

Good news: It is. And with recent advances in AI and Large Language Models (LLMs), we can now automate this process with surprising accuracy. In this guide, I’ll show you how to build a Python-powered PDF assistant that can:

  * Extract and clean text from any PDF document
  * Generate intelligent questions and answers about the content
  * Learn from your specific document types to get better over time

####  **The Secret Sauce: Combining GPT-4 with Lightweight Models**

Our solution combines the best of two worlds: OpenAI’s powerful GPT-4 for understanding and generating high-quality Q&A pairs and Microsoft’s Phi-2, a smaller but mighty model that we can fine-tune for specific tasks. Think of GPT-4 as the expert teacher, creating training materials to educate our more efficient assistant, Phi-2.

Here’s how it works:

![](https://cdn-images-1.medium.com/max/1200/1*ZYSJiWr4VLACeAd9r5BOcg.png)

###  **Building the Pipeline: Step by Step**

####  **1\. Text Extraction: Getting Clean Data from Messy PDFs**

PDFs are notoriously tricky to work with. Here’s how we handle them efficiently:

    def extract_text_from_pdfs(self, pdf_dir: str) -> List[str]:  
        """  
        Extract text from all PDFs in the specified directory using parallel processing.  
        """  
        pdf_dir = Path(pdf_dir)  
        pdf_files = list(pdf_dir.glob("*.pdf"))  
        with Pool(cpu_count()) as pool:  
            all_text = pool.map(self._extract_text_from_pdf, pdf_files)  
        all_text = [text for text in all_text if text]  # Filter out empty texts  
        return all_text

💡 **Pro Tip** : We use parallel processing to handle multiple PDFs simultaneously. On a typical 8-core machine, this can speed up processing by up to 6x.

####  **2\. Generating Smart Q &A Pairs with GPT-4**

This is where the magic happens. We prompt GPT-4 to act as a subject matter expert:

    def generate_qa_pairs(self, texts: List[str], num_pairs: int = 5) -> List[Dict[str, str]]:  
        """Generate question-answer pairs using OpenAI's GPT API."""  
        qa_pairs = []  
        for text in texts:  
            prompt = f"""  
            Given the following receipt text, generate {num_pairs} question-answer pairs:  
            - Focus on supplier details, date, receipt number, line items, total cost, tax, and important figures.  
            - Provide natural questions that could be asked about this receipt.  
            - Format the output as "Q: <question> A: <answer>".  
            """  
            response = openai.ChatCompletion.create(  
                model="gpt-4-turbo",  
                messages=[{"role": "system", "content": "You are a helpful AI that extracts structured Q&A pairs from receipts."},  
                          {"role": "user", "content": prompt}],  
                temperature=0.7,  
                max_tokens=500  
            )  
            generated_text = response['choices'][0]['message']['content']  
            pairs = self._parse_qa_pairs(generated_text)  
            qa_pairs.extend(pairs)  
        return qa_pairs

####  **3\. Training Your Personal Document Assistant**

Here’s where we make it efficient. Instead of relying on GPT-4 for every query, we fine-tuned the smaller Phi-2 model on our generated Q&A pairs:

    peft_config = LoraConfig(  
        task_type=TaskType.CAUSAL_LM,  
        r=8,  
        lora_alpha=32,  
        lora_dropout=0.1,  
        target_modules=["q_proj", "k_proj", "v_proj", "dense"]  # Target the specific Linear layers  
    )

####  **4\. Optimizing GPU Memory and Computation Speed**

The script includes several optimizations to ensure efficient use of GPU memory and computation speed. For example, it uses mixed precision training (fp16) and gradient accumulation to simulate larger batch sizes without increasing memory usage. This is particularly important when working with large models like Phi-2, which can be resource-intensive.

    training_args = TrainingArguments(  
        output_dir=output_dir,  
        report_to="none",  # Disables Weights & Biases logging  
        num_train_epochs=num_epochs,  
        per_device_train_batch_size=1,  # Low batch size  
        gradient_accumulation_steps=4,  # Simulate larger batch size  
        fp16=True,  # Enable mixed precision  
        logging_dir=os.path.join(output_dir, 'logs'),  
        logging_steps=10,  
        save_steps=100,  
        save_total_limit=2,  
        learning_rate=2e-4,  
        weight_decay=0.01,  
        warmup_steps=100,  
    )

#### 📊 **Performance Metrics**

  * Processing Speed: ~2 seconds per page
  * Memory Usage: <8GB RAM for most documents
  * Fine-tuning Time: ~30 minutes on a consumer GPU
  * Accuracy: >90% on essential information extraction

###  **Real-world Applications**

This system isn’t just a cool tech demo — it’s solving real problems:

 **1\. Financial Processing**

  * Automatically extract vendor details, amounts, and line items from invoices
  * Flag unusual patterns or discrepancies
  * Generate structured financial reports

 **2\. Academic Research**

  * Create study guides from textbook chapters
  * Extract methodology details from research papers
  * Generate practice questions for exam preparation

 **3\. Legal Document Analysis**

  * Extract key clauses and definitions
  * Generate summaries of legal agreements
  * Create compliance checklists

###  **Getting Started**

 **Prerequisites:**

  * Python 3.8+
  * PyTorch
  * 8GB+ RAM
  * GPU is recommended

Install the required libraries:

    pip install PyPDF2 transformers peft torch pdfplumber openai

###  **Common Pitfalls to Avoid**

  1.  **Don’t skip text cleaning** : Messy input leads to messy output. Always clean your text before processing.
  2.  **Watch your GPU memory usage** : Use tools like nvidia-smi to monitor memory usage during fine-tuning. Adjust batch sizes if needed.
  3.  **Test thoroughly** : Ensure the system works well with your specific document types by testing on diverse examples.

###  **What’s Next?**

The code for this project is available on [**GitHub**](https://github.com/a24ibrah/pdf_llm2/tree/main). Feel free to:

  * Fork and adapt it to your needs
  * Contribute improvements
  * Share your use cases and results

###  **Your Turn**

How much time do you spend processing documents manually? What kinds of documents would you like to automate? Share your thoughts in the comments below!

 _If you found this helpful, follow me for more practical AI applications and tutorials. Let’s build smarter workflows together!_

Further, to maximize AI-powered document automation, start by fine-tuning your model for better accuracy. Learn how to [**Fine-Tuning LLMs with Your PDF Documents**](https://medium.com/techthync/fine-tuning-llms-with-your-pdf-documents-a-simple-guide-4170ccd76054)!

###  **Final Thoughts**

By combining the power of GPT-4 with the efficiency of Phi-2, this system transforms tedious document processing into a streamlined, AI-powered workflow. Whether you’re drowning in invoices, research papers, or legal documents, this tool can help you extract key insights, generate meaningful Q&A pairs, and fine-tune a model tailored to your specific needs. The future of document analysis is here — and it’s automated, efficient, and intelligent. So, the next time you face a mountain of PDFs, remember that your AI assistant is just a few lines of code away.