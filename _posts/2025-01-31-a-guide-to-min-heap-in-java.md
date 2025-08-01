---
categories:
- AI
- Programming
- Data Science
- Tutorial
date: 2025-01-31
layout: post
tags:
- java
- tutorial
title: A Guide to Min-Heap in Java
---


* * *

### A Guide to Min-Heap in Java

### Introduction

Min-heaps are a fundamental data structure widely used in **priority queues** , **scheduling algorithms** , and **graph algorithms** such as **Dijkstra’s shortest path**. This guide provides a structured approach to implementing min-heaps in Java, covering:

  *  **Building a Min-Heap from an Array** (Bottom-Up Approach)
  *  **Removing the Minimum Value from a Min-Heap**
  *  **Inserting a New Element into a Min-Heap**
  *  **Time and Space Complexity Analysis**
  *  **Real-World Applications**
  *  **Java Implementations with Sample Outputs**

### 1\. Understanding Min-Heap

A **min-heap** is a binary tree where each **parent node** is **smaller than or equal** to its children. The tree is **balanced** and follows an **array representation** , where:

  * The **root node** contains the smallest element.
  * For any node at index `i`:
  *  **Left child** is at index `2i + 1`
  *  **Right child** is at index `2i + 2`
  *  **Parent** is at index `(i - 1) / 2`

### 2\. Building a Min-Heap from an Array

### Problem Statement

Given an **unsorted array** , transform it into a **min-heap**.

### Approach: Bottom-Up Heap Construction

  1. Identify the **last non-leaf node** : `Last Non-Leaf Node = (n / 2) - 1`
  2. Start from the **last non-leaf node** and apply **heapify** bottom-up.
  3. Repeat this process **up to the root node**.

### Java Implementation: MinHeap.java

    import java.util.Arrays;

    public class MinHeap {  
        private int[] heap;  
        private int size;

    public MinHeap(int[] array) {  
            this.heap = array;  
            this.size = array.length;  
            buildMinHeap();  
        }

    private void buildMinHeap() {  
            for (int i = (size / 2) - 1; i >= 0; i--) {  
                heapify(i);  
            }  
        }

    private void heapify(int index) {  
            int left = 2 * index + 1;  
            int right = 2 * index + 2;  
            int smallest = index;

    if (left < size && heap[left] < heap[smallest]) {  
                smallest = left;  
            }  
            if (right < size && heap[right] < heap[smallest]) {  
                smallest = right;  
            }  
            if (smallest != index) {  
                swap(index, smallest);  
                heapify(smallest);  
            }  
        }

    private void swap(int i, int j) {  
            int temp = heap[i];  
            heap[i] = heap[j];  
            heap[j] = temp;  
        }

    public void printHeap() {  
            System.out.println(Arrays.toString(heap));  
        }

    public static void main(String[] args) {  
            int[] array = {24, 13, 32, 6, 9, 17, 8, 4, 15};  
            MinHeap minHeap = new MinHeap(array);  
            System.out.println("Min-Heap:");  
            minHeap.printHeap();  
        }  
    }

### Expected Output

    Min-Heap:  
    [4, 6, 8, 13, 9, 17, 32, 24, 15]

### 3\. Removing the Minimum Value from a Min-Heap

### Problem Statement

After constructing a min-heap, remove the **smallest value (root)** and restore the heap property.

### Approach: Heapify Down

  1. Replace the **root** with the **last element**.
  2. Reduce the **heap size** by 1.
  3. Apply **heapify** on the root to restore the heap property.

### Java Implementation: MinHeapOperations.java

    public class MinHeapOperations {  
        private int[] heap;  
        private int size;

    public MinHeapOperations(int[] array) {  
            this.heap = array;  
            this.size = array.length;  
            buildMinHeap();  
        }

    public int removeMin() {  
            if (size == 0) {  
                throw new IllegalStateException("Heap is empty");  
            }  
            int result = heap[0];  
            heap[0] = heap[size - 1];  
            size--;  
            heapify(0);  
            return result;  
        }

    public void printHeap() {  
            for (int i = 0; i < size; i++) {  
                System.out.print(heap[i] + " ");  
            }  
            System.out.println();  
        }

    public static void main(String[] args) {  
            int[] array = {4, 6, 8, 13, 9, 17, 32, 24, 15};  
            MinHeapOperations heap = new MinHeapOperations(array);  
            System.out.println("Heap before removal:");  
            heap.printHeap();  
            int removed = heap.removeMin();  
            System.out.println("Removed minimum value: " + removed);  
            System.out.println("Heap after removal:");  
            heap.printHeap();  
        }  
    }

### Expected Output

    Heap before removal:  
    4 6 8 13 9 17 32 24 15  
    Removed minimum value: 4  
    Heap after removal:  
    6 9 8 13 15 17 32 24

### 4\. Complexity Analysis

![](https://cdn-images-1.medium.com/max/800/1*s5IY2WSnjmM_PG3iphYbyQ.png)

### 5\. Real-world Applications

  *  **Priority Queues** : Scheduling tasks based on priority.
  *  **Dijkstra’s Algorithm** : Finding the shortest path in a graph.
  *  **Heap Sort** : An efficient sorting algorithm.

### Conclusion

Mastering **Heap** operations will provide a solid foundation for advanced data structure implementations. Try experimenting with different heap operations to enhance your understanding! 🚀