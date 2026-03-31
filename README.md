Community Center Management System (SQL Project)
📌 Project Overview
This project features a comprehensive relational database designed to manage a Community Center (Matnas). It handles everything from member registration and instructor assignments to complex financial tracking and automated data validation.

The system is built to ensure Data Integrity, provide Business Insights, and automate routine administrative tasks using advanced SQL features.

🚀 Key Features & SQL Implementation
1. Core Database Architecture
Designed a normalized schema with 5+ interconnected tables: Members, Instructors, Lessons, Registrations, and Payments.

Implemented Primary Keys, Foreign Keys, and Constraints to ensure robust data relationships.

2. Advanced Business Queries
Financial Reporting: Used GROUP BY and HAVING to identify VIP members based on their total spending.

Member Insights: Calculated member seniority using date functions (TIMESTAMPDIFF) to trigger loyalty rewards.

Complex Data Retrieval: Implemented multi-table JOINs and Subqueries to generate enrollment reports for specific activities (e.g., Yoga, Fitness).

3. Automation & Logic (The "Pro" Stuff)
Stored Procedures: Created reusable procedures to update member details and modify payment methods for high-value transactions automatically.

Triggers: Built a BEFORE UPDATE trigger to validate email formats, preventing "dirty data" from entering the system.

Custom Functions: Developed an AddTax function to standardize VAT calculations across all financial reports.

Views: Established virtual tables (VwPaymentsPerMember) to simplify complex reporting and improve query performance.

🛠️ Tech Stack
Database: MySQL

Tools: MySQL Workbench

Language: SQL (DDL, DML, DQL)

📋 How to Use
Clone this repository.

Run the CommunityCenter_DB_Project.sql script in your MySQL environment.

The script will automatically create the database, tables, and populate them with sample data, as well as initialize all Procedures, Functions, and Triggers.
