CREATE DATABASE employee_management_system;

USE employee_management_system;

CREATE TABLE employees (
    id INT PRIMARY KEY AUTO_INCREMENT,
    name VARCHAR(100),
    age INT,
    salary INT,
    department VARCHAR(100)
);

SELECT * FROM employees;

INSERT INTO employees (name, age, salary, department) VALUES
('Ram', 25, 30000, 'IT'),
('Sita', 30, 40000, 'HR'),
('Hari', 22, 25000, 'IT'),
('Gita', 28, 35000, 'Finance');

SELECT * FROM employees;
