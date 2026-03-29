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
-- Aggregation Functions -> (COUNT(), SUM(), AVG(), MAX(), MIN())
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
-- Aggregation Functions + GROUP BY
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

-- ===========================================================================================================================
-- Aggregation Functions + HAVING
-- ===========================================================================================================================

-- Find total employees greater than 3
SELECT COUNT(*) AS total_employees
FROM employees 
HAVING COUNT(*) > 3;

-- Find total salary greater than 100000
SELECT SUM(salary) AS total_salary
FROM employees 
HAVING SUM(salary) > 100000; 

-- ===========================================================================================================================
-- Aggregation Functions + GROUP BY + HAVING
-- ===========================================================================================================================

-- Departments with total salary greater than 40000
SELECT department, SUM(salary) AS total_salary
FROM employees 
GROUP BY department
HAVING SUM(salary) > 40000;

-- Departments with more than 1 employee
SELECT department, COUNT(*) AS employee_count
FROM employees 
GROUP BY department
HAVING COUNT(*) > 1;

-- Departments with average salary greater than 30000
SELECT department, AVG(salary) AS avg_salary
FROM employees 
GROUP BY department
HAVING AVG(salary) > 30000;

-- Departments with minimum age less than 25
SELECT department, MIN(age) AS min_age
FROM employees 
GROUP BY department
HAVING MIN(age) < 25;

-- Departments with maximum salary greater than 35000
SELECT department, MAX(salary) AS max_salary
FROM employees 
GROUP BY department
HAVING MAX(salary) > 35000;

-- Departments where total salary is less than 50000
SELECT department, SUM(salary) AS total_salary
FROM employees 
GROUP BY department
HAVING SUM(salary) < 50000;

-- Departments where average age greater than 24
SELECT department, AVG(age) AS avg_age
FROM employees 
GROUP BY department
HAVING AVG(age) > 24;

-- Departments with exactly 1 employee
SELECT department, COUNT(*) AS employee_count
FROM employees 
GROUP BY department
HAVING COUNT(*) = 1;

-- ===========================================================================================================================
-- Advanced Filtering: IN, NOT IN, BETWEEN, NOT BETWEEN, EXISTS / NOT EXISTS & DISTINCT Operator
-- ===========================================================================================================================

-- IN Operator

-- Get employees from IT and HR departments
SELECT * 
FROM employees 
WHERE department IN ('IT', 'HR');

-- Get employees whose age is 22, 25, or 30
SELECT * 
FROM employees 
WHERE age IN (22, 25, 30);

-- Get employees whose salary is 25000 or 35000
SELECT * 
FROM employees 
WHERE salary IN (25000, 35000);

-- --------------------------------------------------------------------------

-- NOT IN Operator

-- Get employees NOT in IT department
SELECT * 
FROM employees 
WHERE department NOT IN ('IT');

-- Get employees NOT in HR and Finance
SELECT * 
FROM employees 
WHERE department NOT IN ('HR', 'Finance');

-- --------------------------------------------------------------------------

-- BETWEEN & NOT BETWEEN Operators

-- Get employees with salary between 25000 and 35000
SELECT * 
FROM employees 
WHERE salary BETWEEN 25000 AND 35000;

-- Get employees aged between 23 and 30
SELECT * 
FROM employees 
WHERE age BETWEEN 23 AND 30;

-- Get employees NOT between salary range
SELECT * 
FROM employees 
WHERE salary NOT BETWEEN 25000 AND 35000;

-- --------------------------------------------------------------------------

-- DISTINCT Operator

-- Get unique departments
SELECT DISTINCT department
FROM employees;

-- Get unique salary values
SELECT DISTINCT salary
FROM employees;

-- --------------------------------------------------------------------------

-- EXISTS / NOT EXISTS Operator

-- For practicing EXISTS & NOT EXISTS Practice, create another table i.e.
CREATE TABLE departments (
    department  VARCHAR(100)
);

INSERT INTO departments (department)
VALUES
    ('IT'),
    ('HR');

-- Get employees if department exists
SELECT * 
FROM employees e
WHERE EXISTS (
    SELECT * 
    FROM departments d 
    WHERE e.department = d.department
);

-- NOT EXISTS Example
SELECT * 
FROM employees e
WHERE NOT EXISTS (
    SELECT * 
    FROM departments d 
    WHERE e.department = d.department
);

-- ===========================================================================================================================
-- Joins and Relationships: INNER JOIN, LEFT / RIGHT JOIN, FULL OUTER JOIN, SELF JOIN & CROSS JOIN
-- ===========================================================================================================================

-- First of all change the name of id = '2' from employees table into name = 'Sita'
UPDATE employees 
SET name = 'Sita'
WHERE id = 2;

-- Also, update departments table adding Finance and Marketing
INSERT INTO departments (department)
VALUES
    ('Finance'),
    ('Marketing');

-- --------------------------------------------------------------------------

-- INNER JOIN -> Returns only matching rows from both tables

-- Show employees with their departments
SELECT e.name, e.salary, d.department
FROM employees e
INNER JOIN departments d 
ON e.department = d.department;

-- Get employees only from IT department
SELECT e.name, e.salary, d.department
FROM employees e
INNER JOIN departments d 
ON e.department = d.department 
WHERE d.department = 'IT';

-- --------------------------------------------------------------------------

-- LEFT JOIN -> Returns all rows from LEFT table Even if no match in RIGHT table

-- Show all employees and their departments
SELECT e.name, d.department
FROM employees e 
LEFT JOIN departments d 
ON  e.department = d.department;

-- Find employees without departments
SELECT e.name, d.department
FROM employees e
LEFT JOIN departments d
ON e.department = d.department
WHERE d.department IS NULL; 

-- --------------------------------------------------------------------------

-- RIGHT JOIN -> Returns all rows from RIGHT table

-- Show all departments and employees
SELECT e.name, d.department
FROM employees e 
RIGHT JOIN departments d 
ON e.department = d.department;

-- Find departments with no employees
SELECT d.department 
FROM employees e 
RIGHT JOIN departments d 
ON e.department = d.department
WHERE e.name IS NULL;

-- --------------------------------------------------------------------------

-- FULL OUTER JOIN -> MySQL does NOT support FULL OUTER JOIN directly

SELECT e.name, d.department 
FROM employees e 
LEFT JOIN departments d 
ON e.department = d.department

UNION

SELECT e.name, d.department
FROM employees e
RIGHT JOIN departments d 
ON e.department = d.department;

-- --------------------------------------------------------------------------

-- SELF JOIN -> Joining a table with itself

-- Let's add manager
-- Add column:
ALTER TABLE employees ADD manager_id INT;

-- Update employees table for id = 2
UPDATE employees 
SET manager_id = 1 
WHERE id = 2;

-- Update employees table for id = 3
UPDATE employees 
SET manager_id = 1 
WHERE id = 3;

-- Update employees table for id = 4
UPDATE employees 
SET manager_id = 2 
WHERE id = 4;

-- Show employee and manager
SELECT e.name AS employee, m.name AS manager 
FROM employees e 
LEFT JOIN employees m 
ON e.manager_id = m.id;

-- --------------------------------------------------------------------------

-- CROSS JOIN -> Combines every row with every row

SELECT e.name, d.department
FROM employees e
CROSS JOIN departments d;

-- ===========================================================================================================================
-- Subqueries: WHERE, IN, SELECT (Scalar Subquery), FROM, Correlated Subquery, Nested Subqueries
-- ===========================================================================================================================

-- Subquery in 'WHERE'

-- Get employees from IT department (using subquery)
SELECT * 
FROM employees 
WHERE department = (
    SELECT department 
    FROM departments 
    WHERE department = 'IT'
);

-- Get employees with salary greater than average salary
SELECT * 
FROM employees 
WHERE salary > (
    SELECT AVG(salary)
    FROM employees 
);

-- Get employees with highest salary
SELECT * 
FROM employees 
WHERE salary = (
    SELECT MAX(salary)
    FROM employees 
);

-- --------------------------------------------------------------------------

-- Subquery in 'IN'

-- Employees from departments that exist
SELECT * 
FROM employees 
WHERE department IN (
    SELECT department 
    FROM departments
);

-- Employees not in departments table
SELECT * 
FROM employees 
WHERE department NOT IN (
    SELECT department 
    FROM departments
);

-- --------------------------------------------------------------------------

-- Subquery in 'SELECT' (Scalar Subquery)

-- Show employees with average salary
SELECT 
name,
salary,
(SELECT AVG(salary) FROM employees) AS avg_salary
FROM employees;

-- This is called Scalar Subquery. Because it returns single value.

-- --------------------------------------------------------------------------

-- Subquery in 'FROM'

-- Use subquery as table
SELECT * 
FROM (
    SELECT name, salary 
    FROM employees
) AS temp;
-- This is called: Derived Table

-- Get employees with salary greater than average (Using FROM)
SELECT *
FROM employees,
(
    SELECT AVG(salary) AS avg_salary
    FROM employees
) AS avg_table
WHERE employees.salary > avg_table.avg_salary;

-- --------------------------------------------------------------------------

-- Correlated Subquery

-- Employees earning more than department average
SELECT *
FROM employees e
WHERE salary > (
    SELECT AVG(salary)
    FROM employees
    WHERE department = e.department
);

-- --------------------------------------------------------------------------

-- Nested Subqueries: Subquery inside another subquery

-- Get employee with 2nd highest salary
SELECT MAX(salary)
FROM employees
WHERE salary < (
    SELECT MAX(salary)
    FROM employees
);

-- ===========================================================================================================================
-- Set Operations: UNION/UNION ALL & INTERSECT/EXCEPT
-- ===========================================================================================================================

-- UNION -> Combines results from multiple SELECT queries and removes duplicates
SELECT department FROM employees
UNION
SELECT department FROM departments;

-- --------------------------------------------------------------------------

-- UNION ALL -> Combines results but keeps duplicates (faster than UNION)
SELECT department FROM employees
UNION ALL
SELECT department FROM departments;

-- --------------------------------------------------------------------------

-- INTERSECT -> Returns common rows between two queries
SELECT department FROM employees
INTERSECT
SELECT department FROM departments;

-- --------------------------------------------------------------------------

-- EXCEPT -> Returns rows from first query not in second
SELECT department FROM employees
EXCEPT
SELECT department FROM departments;

-- ===========================================================================================================================
-- String Functions: CONCAT(), LENGTH(), SUBSTRING(), REPLACE(), TRIM(), UPPER() & LOWER()
-- ===========================================================================================================================

-- CONCAT() -> Used to join text together
SELECT CONCAT(name, ' works in ', department) AS info
FROM employees;

-- --------------------------------------------------------------------------

-- LENGTH() -> Count Characters
SELECT name, LENGTH(name) AS name_length
FROM employees;

-- --------------------------------------------------------------------------

-- SUBSTRING() -> Extract Part of String
SELECT name, SUBSTRING(name, 1, 3) AS short_name
FROM employees;
-- 1 = start position, 3 = number of characters

-- --------------------------------------------------------------------------

-- REPLACE() -> Replace Text
SELECT name, REPLACE(name, 'a', '@') AS modified_name
FROM employees;

-- --------------------------------------------------------------------------

-- TRIM() -> Remove Spaces
SELECT TRIM('   Hello World   ') AS result;

-- --------------------------------------------------------------------------

-- UPPER() -> Convert to Uppercase
SELECT UPPER(name) FROM employees;

-- --------------------------------------------------------------------------

-- LOWER() -> Convert to Lowercase
SELECT LOWER(name) FROM employees;

-- --------------------------------------------------------------------------

-- Show employee name and department combined like: Ram Sharma - IT
SELECT CONCAT(name, ' - ', department) AS info
FROM employees;

-- --------------------------------------------------------------------------

-- Show first 2 characters of employee name
SELECT SUBSTRING(name, 1, 2) AS first_2_letter
FROM employees;

-- ===========================================================================================================================



