---
categories:
- AI
- Programming
- Tutorial
date: 2025-02-08
layout: post
tags:
- java
- machine-learning
- ai-agents
- prompt-engineering
title: 'Building Self-Learning Tic-tac-toe Agents: A Deep Dive into Reinforcement
  Learning with Java'
---


* * *

### Building Self-Learning Tic-tac-toe Agents: A Deep Dive into Reinforcement Learning with Java

### Introduction

Have you ever wondered how AI learns to play games? In this article, we’ll explore reinforcement learning by building two AI agents that learn to play Tic-tac-toe against each other. We’ll implement this in Java using Q-learning, a popular reinforcement learning algorithm.

### Understanding Reinforcement Learning

Reinforcement learning is a type of machine learning where agents learn by interacting with an environment and receiving feedback as rewards. The environment is the Tic-tac-toe game, and the agents learn from winning, losing, or drawing games.

### Implementation Breakdown

We will divide our implementation into three main components:

  1. The game environment
  2. The learning agents
  3. The simulation controller

### Part 1: The Game Environment

First, let’s look at the `TicTacToe` Class, which manages the game state and rules:

    class TicTacToe {  
        private char[][] board;  
        private char currentPlayer;  
        private final static char EMPTY = '-';  
        // ... rest of the implementation  
    }

#### Key Components:

 **1\. Board Representation**

  * The game board is represented as a 3x3 char array.
  * Empty cells are marked with ‘-’.
  * Players use ‘X’ and ‘O’ markers.

 **2\. Move Management** :

    public List<Integer> getAvailableMoves() {  
        List<Integer> moves = new ArrayList<>();  
        for (int i = 0; i < 3; i++) {  
            for (int j = 0; j < 3; j++) {  
                if (board[i][j] == EMPTY) {  
                    moves.add(i * 3 + j);  
                }  
            }  
        }  
        return moves;  
    }

This method returns all valid moves as a list of integers from 0 to 8, representing positions on the board.

 **3\. State Representation** :

    public String getBoardState() {  
        StringBuilder state = new StringBuilder();  
        for (int i = 0; i < 3; i++) {  
            for (int j = 0; j < 3; j++) {  
                state.append(board[i][j]);  
            }  
        }  
        return state.toString();  
    }

This method converts the current board state into a string representation, which is crucial for our learning algorithm.

### Part 2: The Learning Agent

The `LearningAgent` Class implements Q-learning, a reinforcement learning algorithm that learns optimal action-value functions:

    class LearningAgent {  
        private Map<String, Map<Integer, Double>> qTable;  
        private double learningRate;  
        private double discountFactor;  
        private double explorationRate;  
        // ... rest of the implementation  
    }

### Key Learning Components:

 **1\. Q-Table** :

  * Stores state-action pairs and their expected rewards.
  * Uses a nested HashMap structure:
  * Outer key: Board state string.
  * Inner key: Move position (0–8).
  * Value: Expected reward for that move in that state.

 **2\. Exploration vs. Exploitation** :

    public int chooseAction(TicTacToe game) {  
        String state = game.getBoardState();  
        List<Integer> availableMoves = game.getAvailableMoves();  
    if (random.nextDouble() < explorationRate) {  
            return availableMoves.get(random.nextInt(availableMoves.size()));  
        }  
        return getBestMove(state, availableMoves);  
    }

This implements the epsilon-greedy strategy:

  * With probability `explorationRate`: Choose a random move (exploration).
  * Otherwise, Choose the best-known move (exploitation).

  1.  **Learning Mechanism** :

    public void learn(String state, int action, double reward, String nextState) {  
        Map<Integer, Double> stateValues = qTable.computeIfAbsent(state, k -> new HashMap<>());  
        Map<Integer, Double> nextStateValues = qTable.computeIfAbsent(nextState, k -> new HashMap<>());  
    double oldValue = stateValues.getOrDefault(action, 0.0);  
        double nextMax = nextStateValues.values().stream()  
                                      .mapToDouble(v -> v)  
                                      .max()  
                                      .orElse(0.0);  
        double newValue = oldValue + learningRate * (reward + discountFactor * nextMax - oldValue);  
        stateValues.put(action, newValue);  
    }

This implements the Q-learning update formula:

    Q(s,a) = Q(s,a) + α[R + γ·max(Q(s',a')) - Q(s,a)]

Where:

  * α (learningRate): How much to update values.
  * γ (discountFactor): Importance of future rewards.
  * R: Immediate reward.
  * max(Q(s’,a’)): Best possible future value.

### How to Compile and Run the Game

### Prerequisites

  1. Java Development Kit (JDK) 11 or higher installed on your system.
  2. A terminal or command prompt.
  3. A text editor or IDE of your choice.

### Compilation Instructions

 **Using Command Line** :

    javac src/*.java -d bin/ java -cp bin GameSimulator

 **Using an IDE** :

  * Create a new Java project.
  * Copy and paste the Java files into the `src` directory.
  * Run `GameSimulator.java` as a Java application.

### Customizing the Training

You can modify the training parameters in `GameSimulator.java`:

    for (int episode = 0; episode < 10000; episode++) {  
        // Training logic  
    }

### Code Repository

The complete code for this implementation is available on GitHub <https://github.com/a24ibrah/MAE-Java/tree/main>