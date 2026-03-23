-- ===========================================================================================================================
-- Create 'employee_management_system' database
-- ===========================================================================================================================

CREATE DATABASE employee_management_system;

-- ===========================================================================================================================
-- Use 'employee_management_system' database
-- ===========================================================================================================================

USE employee_management_system;

-- ===========================================================================================================================
-- Create 'employees' table
-- ===========================================================================================================================

CREATE TABLE employees (
    id INT PRIMARY KEY AUTO_INCREMENT,
    name VARCHAR(100),
    age INT,
    salary INT,
    department VARCHAR(100)
);

-- ===========================================================================================================================
-- Add all data into 'employees' table
-- ===========================================================================================================================

INSERT INTO employees (name, age, salary, department) VALUES
('Ram', 25, 30000, 'IT'),
('Sita', 30, 40000, 'HR'),
('Hari', 22, 25000, 'IT'),
('Gita', 28, 35000, 'Finance');

-- ===========================================================================================================================
-- Get all data from 'employees' table
-- ===========================================================================================================================

SELECT * FROM employees;

-- ===========================================================================================================================
-- Get specific columns data
-- ===========================================================================================================================

-- Get name and salary columns of all employees
SELECT name, salary FROM employees;

-- ===========================================================================================================================
-- Filter data using 'WHERE' clause
-- ===========================================================================================================================

-- Exact match
-- Find employees whose name is 'Ram'
SELECT * FROM employees WHERE name = 'Ram';

-- Multiple conditions
-- Find employees whose name is 'Ram' and older than 25
SELECT * FROM employees WHERE name = 'Ram' AND age > 25;

-- OR condition
-- Find employees whose name is 'Ram' or 'Sita'
SELECT * FROM employees WHERE name = 'Ram' OR name = 'Sita';

-- Pattern matching
-- Find employees whose name starts with 'R'
SELECT * FROM employees WHERE name LIKE 'R%';

-- Range
-- Find employees whose salary is between 20,000 to 50,000
SELECT * FROM employees WHERE salary BETWEEN 20000 AND 50000;

-- Find employees older than 30
SELECT * FROM employees WHERE age > 30;

-- Find employees whose age is between 20 to 40
SELECT * FROM employees WHERE age BETWEEN 20 AND 40;

-- Employees in IT or HR
SELECT * FROM employees WHERE department IN ('IT', 'HR');

-- Get all employees whose salary is greater than 30000
SELECT * FROM employees WHERE salary > 30000;

-- Get employees from IT department whose age is less than 25
SELECT * FROM employees WHERE department = 'IT' AND age < '25';

-- Get employees whose name starts with 'S'
SELECT * FROM employees WHERE name LIKE 'S%';

-- Get employees whose salary is between 25000 and 40000
SELECT * FROM employees WHERE salary BETWEEN 25000 AND 40000;

-- Get employees who are NOT in HR department
SELECT * FROM employees WHERE department <> 'HR';

-- ===========================================================================================================================


