-- Step 1: Drop the existing database if it already exists
DROP DATABASE IF EXISTS employee_db;

-- Step 2: Create a new database
CREATE DATABASE employee_db;
USE employee_db;

-- Step 3: Create the Employees table with constraints
CREATE TABLE employees (
    emp_id INT PRIMARY KEY,        -- PRIMARY KEY (Cannot be NULL and must be unique)
    emp_name VARCHAR(100) NOT NULL, -- NOT NULL ensures a name must be provided
    age INT CHECK (age >= 18),      -- CHECK ensures only employees aged 18+ exist
    email VARCHAR(255) UNIQUE,      -- UNIQUE ensures no duplicate emails exist
    salary DECIMAL(10,2) DEFAULT 30000.00  -- DEFAULT salary of 30,000 if not provided
);

-- Step 4: Insert Sample Data
INSERT INTO employees (emp_id, emp_name, age, email, salary) 
VALUES 
    (1, 'John Doe', 30, 'john.doe@example.com', 50000.00),
    (2, 'Jane Smith', 28, 'jane.smith@example.com', 45000.00),
    (3, 'Alice Brown', 35, 'alice.brown@example.com', NULL); -- This will default to 30,000

-- Step 5: Retrieve Data to Verify
SELECT * FROM employees;
