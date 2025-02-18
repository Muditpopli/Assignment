SHOW DATABASES;
CREATE DATABASE employee_db;
USE employee_db;
SELECT DATABASE();
CREATE TABLE employees (
    emp_id INT PRIMARY KEY NOT NULL,
    emp_name VARCHAR(100) NOT NULL,
    age INT CHECK (age >= 18),
    email VARCHAR(255) UNIQUE,
    salary DECIMAL(10,2) DEFAULT 30000.00
);
