# 📚 Learning Management System (LMS) - SQL Query Set

This repository contains a comprehensive set of SQL queries and sample table insert scripts for a **Learning Management System (LMS)** database. The queries are designed to extract meaningful insights, perform CRUD operations, and manage core functionalities related to users, courses, assessments, and more.

## 📁 Contents

- `LMS Solved queries - Lokesh Kumhar.sql`: A collection of 25+ structured SQL queries covering various use cases.
- `LMS_Table_Insert_Script.zip`: Contains SQL scripts to create and populate necessary database tables.

## 🧩 Schema Overview

The database schema includes the following tables:

- `user` - stores user information (students, instructors)
- `courses` - course details
- `categories` - categories for courses
- `modules` - course modules
- `content` - learning materials like videos, documents, etc.
- `enrollments` - tracks user course enrollments
- `assessments` - tests/quizzes for modules
- `assessment_submission` - tracks student submissions

## 🔍 Key SQL Queries

Here are some examples of what's included:

- 📘 List all courses by category
- 🎓 Get full names and emails of all students
- 🧪 Average score per assessment
- 🧑‍🏫 Retrieve instructor information
- 📈 Find courses with most enrollments
- ❌ Students who haven't submitted any assessments
- 📊 Hierarchical course > module > content overview

Each query includes brief comments explaining the purpose and instructions to customize parameters like `course_id`, `assessment_id`, etc.

## 🛠️ Tools & Technologies

- MySQL (or compatible RDBMS)
- SQL queries designed for readability and reusability
- Designed to work with Power BI and analytics tools if exported to dashboards

## 📦 How to Use

1. Clone or download this repository.
2. Unzip the `LMS_Table_Insert_Script.zip` file.
3. Execute the scripts to create and populate your LMS database.
4. Use the queries from `LMS Solved queries - Lokesh Kumhar.sql` in your SQL environment.
