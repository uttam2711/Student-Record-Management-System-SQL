# Student-Record-Management-System-SQL

This project is a Student Record Management System built using MySQL.
It stores student details, subjects, and marks using a normalized relational database design to ensure data integrity and avoid redundancy.

🗂 Database Design
The database consists of three tables:
1. students
Stores basic student information.
student_id (Primary Key)
name
age
department
2. subjects
Stores subject details.
subject_id (Primary Key)
subject_name (Unique, Not Null)
3. marks
Stores marks obtained by students in subjects.
mark_id (Primary Key)
student_id (Foreign Key → students)
subject_id (Foreign Key → subjects)
marks (0–100 validation)

👉 This design follows database normalization and resolves the many-to-many relationship between students and subjects.

⚙️ Features Implemented

Relational database design with Primary & Foreign Keys
Data validation using NOT NULL, UNIQUE, CHECK constraints
CRUD operations
Multi-table queries using JOIN
Aggregation using GROUP BY
Filtering aggregated data using HAVING
Clean queries using CTE (Common Table Expressions)

📊 Sample Queries

-- Total marks of each student
SELECT s.name, SUM(m.marks) AS total_marks
FROM students s
JOIN marks m ON s.student_id = m.student_id
GROUP BY s.student_id;

-- Students with average marks above 85 using CTE
WITH StudentTotals AS (
    SELECT s.student_id, s.name, AVG(m.marks) AS avg_marks
    FROM students s
    JOIN marks m ON s.student_id = m.student_id
    GROUP BY s.student_id
)
SELECT * FROM StudentTotals
WHERE avg_marks > 85;

🧠 Skills Demonstrated
MySQL
Database Normalization
SQL Joins & Aggregations
CTEs and Subqueries
Data Integrity & Constraints
Query Optimization Basics

🚀 How to Run

Open MySQL Workbench
Run database.sql to create tables
Run sample_data.sql to insert data
Run queries from queries.sql

📎 Project Structure
Student-Record-Management-System/
│
├── database.sql
├── sample_data.sql
├── queries.sql
└── README.md

