---
categories:
- AI
- Programming
- Tools
- Data Science
- Tutorial
date: 2025-01-31
layout: post
tags:
- python
- machine-learning
- tutorial
title: 'Building a Spam Filter with Python and Scikit-learn: A Step-by-Step Tutorial'
---


* * *

### **Building a Simple Spam Filter with Python and Scikit-learn: A Step-by-Step Tutorial**

Spam emails are a nuisance that most of us deal with daily. Whether it’s an offer for a free vacation or a phishing attempt, spam can be both annoying and dangerous. Fortunately, machine learning provides us with tools to automatically filter out these unwanted messages. In this tutorial, we’ll build a spam filter using Python and Scikit-learn. By the end, you’ll have a working model that can classify emails as spam or not spam.

### What We’ll Cover

  *  **Understanding the Problem** : What is spam filtering, and how can machine learning help?
  *  **The Dataset** : Creating a small but balanced dataset for training.
  *  **Building the Model** : Using a pipeline with TF-IDF vectorization and a Naive Bayes classifier.
  *  **Evaluating the Model** : Measuring accuracy and performance.
  *  **Making Predictions** : Testing the model on new emails.

Let’s dive in!

### 1\. Understanding the Problem

Spam filtering is a classic example of a binary classification problem. The goal is to classify emails into one of two categories:

  *  **Spam (1)** : Unwanted or harmful emails.
  *  **Not Spam (0)** : Legitimate emails.

To achieve this, we’ll use a machine learning model that learns patterns from labelled examples of spam and non-spam emails. Specifically, we’ll use a **Naive Bayes classifier** , which is well-suited for text classification tasks.

### 2\. The Dataset

For this tutorial, we’ll create a small dataset of 24 emails, evenly split between spam and non-spam examples. In a real-world scenario, you’d use a much larger dataset, but this will suffice for demonstration purposes.

    import numpy as np  
      
    e_mails = [  
        # Spam examples  
        "Win a $1000 Walmart gift card now! Click here!",  
        "Limited time offer! Get a free vacation now!",  
        "Congratulations! You've won a free iPhone!",  
        "Urgent: Your bank account requires verification immediately!",  
        "Final warning! Your account will be closed if you don't respond.",  
        "Cheap online loans available! Apply now!",  
        "Exclusive deal just for you! Get 50% off on electronics!",  
        "Congratulations! You've been selected for a prize draw!",  
        "Important: Your credit score report is available now!",  
        "Final reminder: Your car insurance policy expires soon!",  
        "Your account security is at risk! Update password now!",  
        "Check out these new investment opportunities! Big returns!",  
        # Non-spam examples  
        "Meeting tomorrow at 10 AM, let's discuss the project.",  
        "Can we reschedule our appointment to next Monday?",  
        "Let's catch up over coffee this weekend.",  
        "See you at the team lunch next Wednesday.",  
        "Join our professional networking event this Friday.",  
        "Your Amazon order has been shipped. Track it here.",  
        "Hey, are you available for a quick call tomorrow?",  
        "Invitation: Join our webinar on financial planning.",  
        "Please review the attached document by EOD.",  
        "The quarterly report is ready for your review.",  
        "Tomorrow's meeting has been moved to Room 302.",  
        "Your request has been processed successfully."  
    ]  
    # Labels: 1 for spam, 0 for non-spam  
    labels = np.array([1]*12 + [0]*12)

### 3\. Building the Model

We’ll use a pipeline to streamline the process of transforming the text data and training the model. The pipeline consists of two main steps:

  *  **TF-IDF Vectorization** : Converts the text into numerical features.
  *  **Naive Bayes Classifier** : Trains the model on the transformed data.

    from sklearn.feature_extraction.text import TfidfVectorizer  
    from sklearn.naive_bayes import MultinomialNB  
    from sklearn.pipeline import Pipeline  
    from sklearn.model_selection import train_test_split, cross_val_score  
    from sklearn.metrics import accuracy_score, classification_report  
      
    # Split the data into training and testing sets  
    X_train, X_test, y_train, y_test = train_test_split(  
        e_mails, labels, test_size=0.2, random_state=42, stratify=labels  
    )  
    # Create the pipeline  
    pipeline = Pipeline([  
        ('vectorizer', TfidfVectorizer(stop_words='english', max_df=0.8, min_df=1, ngram_range=(1, 3))),  
        ('classifier', MultinomialNB(alpha=0.1))  
    ])  
    # Train the model  
    pipeline.fit(X_train, y_train)

### 4\. Evaluating the Model

Before deploying the model, it’s important to evaluate its performance. We’ll use cross-validation to assess its accuracy and generate a classification report for more detailed metrics.

    # Cross-validation  
    cv_scores = cross_val_score(pipeline, X_train, y_train, cv=5)  
    print("Cross-validation accuracy:", cv_scores.mean())  
      
    # Predict on the test set  
    y_pred = pipeline.predict(X_test)  
    # Print results  
    print("\nTest Set Metrics:")  
    print("Accuracy:", accuracy_score(y_test, y_pred))  
    print("\nClassification Report:\n", classification_report(y_test, y_pred))

 **Sample Output:**

     Cross-validation accuracy: 0.95

    Test Set Metrics:  
    Accuracy: 1.0

    Classification Report:  
                  precision    recall  f1-score   support  
               0       1.00      1.00      1.00         2  
               1       1.00      1.00      1.00         3

The model achieves **100% accuracy** on the test set, which is excellent! However, keep in mind that this is a small dataset, and results may vary with larger, more complex data.

### 5\. Making Predictions

Now that the model is trained, let’s use it to classify a new email:

    # Predict on a new email  
    new_email = ["Hey, are we still meeting at 5 PM today? Urgent update needed!"]  
    prediction = pipeline.predict(new_email)[0]  
    print("\nPrediction for new email:", "Spam" if prediction else "Not Spam")

 **Output:**

     Prediction for new email: Not Spam

### Conclusion

In this tutorial, we built a simple yet effective spam filter using Python and Scikit-learn. We:

  * Created a balanced dataset of spam and non-spam emails.
  * Used a pipeline to preprocess the text and train a Naive Bayes classifier.
  * Evaluated the model’s performance using cross-validation and test set metrics.
  * Made predictions on new emails.

While this model works well for our small dataset, real-world spam filtering requires a much larger and more diverse dataset and more advanced techniques like deep learning.

### Next Steps:

  * Explore larger datasets like the SpamAssassin Public Corpus.
  * Experiment with other classifiers like Logistic Regression or Support Vector Machines.
  * Deploy the model as a web application using Flask or FastAPI.

Let me know in the comments if you have any questions or suggestions! Happy coding!