-- #######################################
-- #   SQL Constraints #
-- #######################################

-- 🎯 Purpose of Constraints:
-- Constraints in SQL enforce **data integrity**, ensuring the database remains **accurate, consistent, and reliable**.
-- They prevent invalid, duplicate, or inconsistent data entries by enforcing rules at the database level.

-- 📌 Common Types of Constraints:
-- 1️⃣ PRIMARY KEY: Ensures each row is **unique** and **not NULL**.
-- 2️⃣ NOT NULL: Prevents NULL values in a column.
-- 3️⃣ UNIQUE: Ensures values in a column are distinct.
-- 4️⃣ CHECK: Restricts values based on a condition (e.g., age >= 18).
-- 5️⃣ DEFAULT: Assigns a default value if none is provided.
-- 6️⃣ FOREIGN KEY: Maintains **referential integrity** between tables.

-- ##################################################################
-- # Step 1: Disable Foreign Key Checks (Prevents Deletion Conflicts)
-- ##################################################################
SET FOREIGN_KEY_CHECKS = 0;

-- ############################################################
-- # Step 2: Drop Tables (If They Exist, To Avoid Duplications)
-- ############################################################
DROP TABLE IF EXISTS employee_departments;  -- Drop child table first to avoid dependency issues.
DROP TABLE IF EXISTS departments;           -- Drop parent table.
DROP TABLE IF EXISTS employees;             -- Drop parent table.

-- ###################################################################
-- # Step 3: Drop & Recreate the Database (Ensuring a Clean Structure)
-- ###################################################################
DROP DATABASE IF EXISTS employee_db;  
CREATE DATABASE employee_db;  
USE employee_db;  

-- ##################################################################
-- # Step 4: Re-enable Foreign Key Checks (Restoring Data Integrity)
-- ##################################################################
SET FOREIGN_KEY_CHECKS = 1;

-- ##################################################################
-- # Step 5: Creating Tables with Constraints (Employees & Dept)
-- ##################################################################

-- 🔹 Creating Departments Table
CREATE TABLE departments (
    dept_id INT PRIMARY KEY,   -- ✅ PRIMARY KEY: Each department must have a unique ID.
    dept_name VARCHAR(100) NOT NULL  -- ✅ NOT NULL: A department must have a name.
);

-- 🔹 Creating Employees Table
CREATE TABLE employees (
    emp_id INT PRIMARY KEY,          -- ✅ PRIMARY KEY: Unique Employee ID, cannot be NULL.
    emp_name VARCHAR(100) NOT NULL,   -- ✅ NOT NULL: Employee name must be provided.
    age INT CHECK (age >= 18),        -- ✅ CHECK: Ensures only employees aged 18+ exist.
    email VARCHAR(255) UNIQUE,        -- ✅ UNIQUE: Ensures no duplicate emails exist.
    salary DECIMAL(10,2) DEFAULT 30000.00  -- ✅ DEFAULT: Sets default salary to 30,000 if not specified.
);

-- ########################################################################
-- # Step 6: Create Employee-Department Relationship Table (With FKs)
-- ########################################################################

-- 🔹 Creating Employee-Department Relationship Table
CREATE TABLE employee_departments (
    emp_id INT, 
    dept_id INT,
    FOREIGN KEY (emp_id) REFERENCES employees(emp_id) ON DELETE CASCADE,  -- ✅ Ensures deleting an employee removes related records.
    FOREIGN KEY (dept_id) REFERENCES departments(dept_id) ON DELETE CASCADE -- ✅ Ensures deleting a department removes related records.
);

-- ✅ This query ensures a clean database setup with no dependency issues.

show tables;