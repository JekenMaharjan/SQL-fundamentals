-- Create 'employee_management_system' database
CREATE DATABASE employee_management_system;

-- Use 'employee_management_system' database
USE employee_management_system;

-- Create 'employees' table
CREATE TABLE employees (
    id INT PRIMARY KEY AUTO_INCREMENT,
    name VARCHAR(100),
    age INT,
    salary INT,
    department VARCHAR(100)
);

SELECT * FROM employees; -- Get all data from 'employees' table

-- Add all data into 'employees' table
INSERT INTO employees (name, age, salary, department) VALUES
('Ram', 25, 30000, 'IT'),
('Sita', 30, 40000, 'HR'),
('Hari', 22, 25000, 'IT'),
('Gita', 28, 35000, 'Finance');

SELECT * FROM employees; -- Get all data from 'employees' table

SELECT name, age, salary FROM employees; -- Get name, age and salary from 'employees' table
SELECT name, age FROM employees; -- Get name and age from 'employees' table
SELECT name FROM employees; -- Get name from 'employees' table




