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
    id          INT PRIMARY KEY AUTO_INCREMENT,
    name        VARCHAR(100),
    age         INT,
    salary      INT,
    department  VARCHAR(100)
);

-- ===========================================================================================================================
-- Insert all data into 'employees' table (C - CREATE)
-- ===========================================================================================================================

INSERT INTO employees (name, age, salary, department) 
VALUES
    ('Ram', 25, 30000, 'IT'),
    ('Sita', 30, 40000, 'HR'),
    ('Hari', 22, 25000, 'IT'),
    ('Gita', 28, 35000, 'Finance');

INSERT INTO employees (name, age, salary, department)
VALUES
    ('Raja', 40, 50000, 'Manager');

-- ===========================================================================================================================
-- Get all data from 'employees' table (R- READ)
-- ===========================================================================================================================

SELECT * 
FROM employees;

-- ===========================================================================================================================
-- Get specific columns data
-- ===========================================================================================================================

-- Get name and salary columns of all employees
SELECT name, salary 
FROM employees;

-- ===========================================================================================================================
-- Update name into 'Jeemla' where id = '2' (U - UPDATE)
-- ===========================================================================================================================

UPDATE employees
SET name = 'Jeemla'
WHERE id = '2';

-- ===========================================================================================================================
-- Delete record where id = '5' (D - DELETE)
-- ===========================================================================================================================

DELETE FROM employees
WHERE id = '5';

-- ===========================================================================================================================
-- Filtering data using 'WHERE' clause
-- Filtering means selecting specific rows based on conditions
-- ===========================================================================================================================

-- Exact match
-- Find employees whose name is 'Ram'
SELECT * 
FROM employees 
WHERE name = 'Ram';

-- Multiple conditions
-- Find employees whose name is 'Ram' and older than 25
SELECT * 
FROM employees 
WHERE name = 'Ram' AND age > 25;

-- OR condition
-- Find employees whose name is 'Ram' or 'Sita'
SELECT * 
FROM employees 
WHERE name = 'Ram' OR name = 'Sita';

-- Pattern matching
-- Find employees whose name starts with 'R'
SELECT * 
FROM employees 
WHERE name LIKE 'R%';

-- Range
-- Find employees whose salary is between 20,000 to 50,000
SELECT * 
FROM employees 
WHERE salary BETWEEN 20000 AND 50000;

-- Find employees older than 30
SELECT * 
FROM employees 
WHERE age > 30;

-- Find employees whose age is between 20 to 40
SELECT * 
FROM employees 
WHERE age BETWEEN 20 AND 40;

-- Employees in IT or HR
SELECT * 
FROM employees 
WHERE department IN ('IT', 'HR');

-- Get all employees whose salary is greater than 30000
SELECT * 
FROM employees 
WHERE salary > 30000;

-- Get employees from IT department whose age is less than 25
SELECT * 
FROM employees 
WHERE department = 'IT' AND age < '25';

-- Get employees whose name starts with 'S'
SELECT * 
FROM employees 
WHERE name LIKE 'S%';

-- Get employees whose salary is between 25000 and 40000
SELECT * 
FROM employees 
WHERE salary BETWEEN 25000 AND 40000;

-- Get employees who are NOT in HR department
SELECT * 
FROM employees 
WHERE department <> 'HR';

-- ===========================================================================================================================
-- Sorting data using 'ORDER BY' clause
-- 'ORDER BY' is used to sort data (ascending or descending)
-- ===========================================================================================================================

-- Get all employees sorted by salary (highest first)
SELECT * 
FROM employees 
ORDER BY salary DESC;

-- Get lowest age first / Get the youngest employee
SELECT * 
FROM employees 
ORDER BY age ASC;

-- Sort employees by name ascending
SELECT * 
FROM employees 
ORDER BY name ASC;

-- Sort by department then age
-- First sort by department. Then sort by age inside each department
SELECT * 
FROM employees 
ORDER BY 
    department ASC, 
    age ASC;

-- Sort by department then highest salary
-- First sort by department. Then sort by salary inside each department
SELECT * 
FROM employees 
ORDER BY 
    department ASC, 
    salary DESC;

-- Sort employees by department then name
-- First sort by department. Then sort by name inside each department
SELECT * 
FROM employees 
ORDER BY 
    department ASC, 
    name ASC;

-- ===========================================================================================================================
-- Limiting data using 'LIMIT' clause with 'ORDER BY' clause
-- 'LIMIT' is used to restrict number of rows returned
-- ===========================================================================================================================

-- Get only first 2 rows employees
SELECT * 
FROM employees 
LIMIT 2;

-- Get Top 2 highest paid employees
SELECT * 
FROM employees 
ORDER BY salary DESC 
LIMIT 2;

-- Get youngest 2 employees
SELECT * 
FROM employees 
ORDER BY age ASC 
LIMIT 2;

-- Get top 2 highest paid employees from IT department
SELECT * 
FROM employees
WHERE department = 'IT'
ORDER BY salary DESC
LIMIT 2;

-- ===========================================================================================================================
-- Combined: 'WHERE' + 'ORDER BY' + 'LIMIT' clauses
-- ===========================================================================================================================

-- Get top 2 highest-paid employees greater than 30000
SELECT * 
FROM employees
WHERE salary > 30000
ORDER BY salary DESC
LIMIT 2;

-- Get top 2 highest-paid employees from IT department
SELECT *
FROM employees
WHERE department = 'IT'
ORDER BY salary DESC
LIMIT 2;

-- Get the youngest employee in the Finance department
SELECT *
FROM employees
WHERE department = 'Finance'
ORDER BY age ASC
LIMIT 1;

-- Get employees earning more than 30000, sorted by salary
SELECT *
FROM employees
WHERE salary > 30000
ORDER BY salary DESC;

-- Get the second highest-paid employee overall
SELECT * 
FROM employees
ORDER BY salary DESC
LIMIT 1 OFFSET 1;

-- Get top 3 youngest employees earning less than 40000
SELECT *
FROM employees
WHERE salary < 40000
ORDER BY age ASC
LIMIT 3;

-- ===========================================================================================================================
-- Aggregation Functions (COUNT(), SUM(), AVG(), MAX(), MIN())
-- ===========================================================================================================================

-- Count total employees (use 'COUNT()' to count rows)
SELECT COUNT(*) AS total_employees
FROM employees;

-- Total salary of all employees (use 'SUM()' to add values)
SELECT SUM(salary) AS total_salary
FROM employees;

-- Average salary of all employees (use 'AVG()' to average value)
SELECT AVG(salary) AS avg_salary
FROM employees;

-- Maximum salary out of all employees (use 'MAX()' to get maximum)
SELECT MAX(salary) AS highest_salary 
FROM employees;

-- Minimum age out of all employees (use 'MIN()' to get minimum)
SELECT MIN(age) AS youngest_age 
FROM employees;

-- Count of employees with salary > 30000
SELECT COUNT(*) AS employees_high_salary
FROM employees
WHERE salary > 30000;

-- Average age of employees
SELECT AVG(age) AS avg_age
FROM employees;

-- ===========================================================================================================================
-- GROUP BY + Aggregation Functions
-- ===========================================================================================================================

-- Total salary per department
SELECT department, SUM(salary) AS total_salary
FROM employees
GROUP BY department;

-- Count of employees per department
SELECT department, COUNT(*) AS employee_count
FROM employees
GROUP BY department;

-- Average age per department
SELECT department, AVG(age) AS avg_age
FROM employees
GROUP BY department;

-- Maximum salary per department
SELECT department, MAX(salary) AS max_salary
FROM employees 
GROUP BY department;

-- Minimum age per department
SELECT department, MIN(age) AS min_age
FROM employees
GROUP BY department;

-- Maximum salary in IT department
SELECT MAX(salary) AS max_salary
FROM employees
WHERE department = 'IT';

-- Find the total salary of all employees whose salary is greater than 30000, grouped by department.
SELECT department, SUM(salary) AS total_salary
FROM employees 
WHERE salary > 30000
GROUP BY department;

-- Find the department(s) with more than 2 employees.
SELECT *
FROM (
    SELECT department, COUNT(*) AS total_employees
    FROM employees
    GROUP BY department
) AS dept
WHERE total_employees > 2;

