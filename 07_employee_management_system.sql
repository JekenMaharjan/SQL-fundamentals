-- Create Database
CREATE DATABASE employee_management;
USE employee_management;

-- Create Tables (Departments, Employees, Projects Table)
CREATE TABLE departments (
    department_id INT PRIMARY KEY AUTO_INCREMENT,
    department_name VARCHAR(50) NOT NULL
);

CREATE TABLE employees (
    employee_id INT PRIMARY KEY AUTO_INCREMENT,
    name VARCHAR(100),
    age INT,
    salary DECIMAL(10,2),
    department_id INT,
    hire_date DATE,
    FOREIGN KEY (department_id)
    REFERENCES departments(department_id)
);

CREATE TABLE projects (
    project_id INT PRIMARY KEY AUTO_INCREMENT,
    project_name VARCHAR(100),
    employee_id INT,
    FOREIGN KEY (employee_id)
    REFERENCES employees(employee_id)
);

-- Insert Sample Data
INSERT INTO departments (department_name)
VALUES
('IT'),
('HR'),
('Finance'),
('Marketing');

INSERT INTO employees (name, age, salary, department_id, hire_date)
VALUES
('Ram', 25, 30000, 1, '2024-01-10'),
('Shyam', 28, 35000, 1, '2023-05-15'),
('Hari', 30, 40000, 2, '2022-03-20'),
('Sita', 27, 32000, 3, '2024-02-01'),
('Gita', 29, 38000, 4, '2023-08-11');

INSERT INTO projects (project_name, employee_id)
VALUES
('Website Development', 1),
('Mobile App', 2),
('Payroll System', 3),
('Marketing Campaign', 5);

-- ======================================================================================

-- Practice Queries:

-- 1. SELECT
SELECT * FROM departments;
SELECT * FROM employees;
SELECT * FROM projects;

-- 2. WHERE
SELECT * FROM departments
WHERE department_name = 'HR';

SELECT * FROM departments
WHERE department_name = 'Marketing';

SELECT * FROM employees
WHERE salary > 32000;

SELECT * FROM employees
WHERE age >= 28;

SELECT * FROM employees
WHERE hire_date >= '2023-08-11';

SELECT * FROM projects
WHERE project_name = 'Payroll System';

SELECT * FROM projects
WHERE employee_id >= 3;

-- 3. ORDER BY
SELECT * FROM employees
ORDER BY salary DESC;

SELECT * FROM projects
ORDER BY employee_id DESC;

SELECT * FROM employees
ORDER BY age DESC;

-- 4. LIMIT
SELECT * FROM employees
LIMIT 3;

SELECT * FROM projects
LIMIT 2;

-- 5. GROUP BY
SELECT department_id, COUNT(*) 
FROM employees
GROUP BY department_id;

-- 6. JOIN
SELECT e.name, d.department_name
FROM employees e
JOIN departments d
ON e.department_id = d.department_id;

-- 7. Aggregate Functions
SELECT AVG(salary) FROM employees;

-- 8. HAVING
SELECT department_id, COUNT(*)
FROM employees
GROUP BY department_id
HAVING COUNT(*) > 1;

-- ======================================================================================

-- Intermediate Queries:

-- 1. Highest Salary
SELECT *
FROM employees
ORDER BY salary DESC
LIMIT 1;

-- 2. Employees with Department Name
SELECT e.name, d.department_name
FROM employees e
JOIN departments d
ON e.department_id = d.department_id; 

-- 3. Total Salary per Department
SELECT department_id, SUM(salary)
FROM employees
GROUP BY department_id;

-- ======================================================================================

-- Advanced Queries:

-- 1. Subquery
SELECT * FROM employees
WHERE salary > (
    SELECT AVG(salary) FROM employees
);

-- 2. Employees Without Projects
SELECT name
FROM employees
WHERE employee_id NOT IN (
    SELECT employee_id FROM projects
);

-- ======================================================================================
