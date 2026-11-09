
# Community Learning Center Management System

## Application Information

- **Subject:** Mobile Development
- **Examination:** Midterm Laboratory Examination
- **Programming Language:** Dart
- **Application Type:** Console-Based Application
- **Name:** Christian P. Alonzo
- **Section:** 3.8 BSIT

## Description

The Community Learning Center Management System is a console-based Dart application that manages learning resources and participants.

It allows users to add learning resources, register participants, borrow and return resources, and view records.

This application demonstrates Dart Programming Fundamentals and Object-Oriented Programming (OOP).

## Application Features

1. **Add Learning Resource**
   - Add resource ID, name, category, and available copies.
   - Prevent duplicate resource IDs.

2. **Register Participant**
   - Register participant ID, name, and email.
   - Validate email input.
   - Prevent duplicate participant IDs.

3. **View Records**
   - Display all learning resources.
   - Display all registered participants.
   - Show organized record details.

4. **Borrow Resource**
   - Search for a participant and resource.
   - Reduce available copies when borrowing.

5. **Return Resource**
   - Return a borrowed resource.
   - Increase available copies.

6. **Exit**
   - Safely terminate the application.

## Dart Concepts Implemented

The application demonstrates the following programming concepts:

- Variables and Data Types
- Input and Output
- Arithmetic and Comparison Operators
- Conditional Statements (if/else and switch)
- Loops (while and for)
- User-Defined Functions
- Error Handling (try-catch)
- Classes and Objects
- Constructors and Methods
- Encapsulation (Private Fields)
- Inheritance
- Polymorphism
- Abstract Classes
- Mixins
- Lists and Maps

## Classes Used

### 1. CenterRecord
An abstract parent class containing the common ID and name fields and the displayDetails() method.

### 2. LearningResource
A subclass that manages learning resource information, categories, and available copies.

### 3. Participant
A subclass that stores participant information, email, and borrowed resource count.

### 4. TimestampMixin
A mixin that provides reusable date and time information for records.

## Sample Test Scenarios

### Scenario 1: Add Resource

Input:
- Resource ID: 101
- Resource Name: Dart Programming
- Category: Programming
- Available Copies: 5

Expected Output:
Resource added successfully!

### Scenario 2: Register Participant

Input:
- Participant ID: 201
- Name: Juan Dela Cruz
- Email: juan@gmail.com

Expected Output:
Participant registered successfully!

### Scenario 3: Borrow Resource

Input:
- Participant ID: 201
- Resource ID: 101

Expected Output:
Borrowed successfully!

### Scenario 4: Invalid Menu Choice

Input:
- Menu Choice: 9

Expected Output:
Invalid choice!

### Scenario 5: Return Resource

Input:
- Participant ID: 201
- Resource ID: 101

Expected Output:
Returned successfully!

## Requirements

- Dart SDK
- OnlineGDB or a compatible Dart environment
- Internet connection (for online compiler)

## How to Run

### Using OnlineGDB

1. Visit https://www.onlinegdb.com/online_dart_compiler
2. Select Dart as the programming language.
3. Copy the source code into the editor.
4. Click the Run button.
5. Enter your choices in the console.

## Project Structure

MD_Midterm_Surname_Section/
|
|-- main.dart
|-- README.md

## Conclusion

The Community Learning Center Management System demonstrates the application of Dart programming fundamentals and Object-Oriented Programming.

It combines resource management, participant registration, and simple borrowing and returning operations in one integrated console application.
