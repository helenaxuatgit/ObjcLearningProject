# Objective-C Learning Project

This project is a simple Objective-C command-line tool designed to help you learn the basics of the language, including classes, interfaces, implementations, and methods.

## Structure
- `main.m`: Entry point, demonstrates usage of the custom class.
- `Person.h`: Interface for a `Person` class.
- `Person.m`: Implementation for the `Person` class.

## How to Build and Run

1. Open a terminal in this project directory.
2. Compile the project:
   
   ```sh
   clang -framework Foundation main.m Person.m -o ObjcLearning
   ```
3. Run the executable:
   
   ```sh
   ./ObjcLearning
   ```

## What You'll Learn
- How to define and use Objective-C classes
- How to declare interfaces and implementations
- How to create and use methods
- How to use properties and initializers
