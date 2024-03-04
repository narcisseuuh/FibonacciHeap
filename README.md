# FibonacciHeap

This repository contains an implementation of a Fibonacci heap in Haskell. Fibonacci heaps are a type of data structure consisting of a collection of trees. They are particularly useful for priority queue operations, offering better amortized running times for several operations in comparison to binary or binomial heaps. This implementation aims to provide a clear and efficient example of Fibonacci heaps in Haskell, leveraging the language's powerful features for concise and expressive code.

## Getting Started

These instructions will guide you through getting a copy of the project up and running on your local machine for development and testing purposes.

### Prerequisites

Before you begin, ensure you have Stack installed on your machine. Stack is a cross-platform program for developing Haskell projects. It manages the GHC installation and sets up your project environment. To check if you have Stack installed, run:

```bash
stack --version
```

## Installing

First, clone the repository to your local machine:
```bash
git clone https://github.com/narcisseuuh/FibonacciHeap.git
```

Then, navigate to the project directory:

```bash
cd FibonacciHeap
```

To build the project using Stack, run:
```bash
stack build
```

This command will compile your project. Stack will automatically download the correct GHC version (if not already installed) and any dependencies your project may have.

## Usage

After building the project, you can run the application or an example within the project. Here's a basic way to use the Fibonacci heap from the command line, assuming you have an executable setup:
```bash
stack exec FibonacciHeap-exe
```

Here is a basic example of how to use the Fibonacci heap implemented in this repository within Haskell code:

```haskell
import FibonacciHeap

-- Create a new empty Fibonacci heap
let emptyHeap = []

-- Insert elements into the heap
let heap = foldl insert emptyHeap [5, 3, 7, 1, 9, 4]

-- Find the minimum element
print $ findMin heap

-- Delete the minimum element
let heap' = deleteMin heap

-- Print the new minimum
print $ findMin heap'
```

## Running the tests

To run the tests for this project, use:

```bash
stack test
```

This will compile and run all the tests defined in the project's test suite.

## Acknowledgements

- The video that made me want to implement this structure : https://youtu.be/6JxvKfSV9Ns?si=BLiKZWSeN3hy439V
- My main resource for the implementation : https://www.programiz.com/dsa/fibonacci-heap