-- =======================================================================================
-- Create 'simple_online_shop_system' database
-- =======================================================================================

CREATE DATABASE simple_online_shop_system;

-- =======================================================================================
-- Use 'simple_online_shop_system' database
-- =======================================================================================

USE simple_online_shop_system;

-- =======================================================================================
-- Create Simple Tables (Customers & Orders Table)
-- =======================================================================================

-- Customers Table
CREATE TABLE customers (
    id INT PRIMARY KEY AUTO_INCREMENT,
    name VARCHAR(50),
    email VARCHAR(100)
);

-- Orders Table
CREATE TABLE orders (
    id INT PRIMARY KEY AUTO_INCREMENT,
    product_name VARCHAR(100),
    price INT,
    customer_id INT
);

-- =======================================================================================
-- Insert Sample Data
-- =======================================================================================

-- Customers Data
INSERT INTO customers (name, email)
VALUES
('Ram', 'ram@gmail.com'),
('Hari', 'hari@gmail.com'),
('Sita', 'sita@gmail.com');

-- Orders Data
INSERT INTO orders (product_name, price, customer_id)
VALUES
('Laptop', 80000, 1),
('Mouse', 1500, 2),
('Keyboard', 2500, 1);

-- =======================================================================================
-- PRIMARY KEY (Already Used)
-- =======================================================================================

-- Primary key = unique ID

id INT PRIMARY KEY AUTO_INCREMENT

-- Find customer by id
SELECT *
FROM customers
WHERE id = 1;

-- Why fast? Because Primary Key creates index automatically.

-- =======================================================================================
-- UNIQUE KEY
-- =======================================================================================

-- Prevent duplicate emails
ALTER TABLE customers
ADD UNIQUE (email);

-- Try duplicate
INSERT INTO customers (name, email)
VALUES ('Test', 'ram@gmail.com');

-- This will fail.

-- =======================================================================================
-- INDEX (Make Query Faster)
-- =======================================================================================

-- Create index on product_name
CREATE INDEX idx_product
ON orders (product_name);

-- Now this becomes faster,
SELECT *
FROM orders
WHERE product_name = 'Laptop';

-- =======================================================================================
-- FOREIGN KEY (Connect Tables)
-- =======================================================================================

-- Connect orders → customers
ALTER TABLE orders
ADD CONSTRAINT fk_customer
FOREIGN KEY (customer_id)
REFERENCES customers(id);

-- Now invalid customer not allowed,
INSERT INTO orders (product_name, price, customer_id)
VALUES ('Phone', 30000, 10);

-- This fails.

-- Join Practice
SELECT c.name, o.product_name, o.price
FROM customers c
JOIN orders o
ON c.id = o.customer_id;

-- =======================================================================================
-- EXPLAIN (Performance Check)
-- =======================================================================================

EXPLAIN
SELECT *
FROM orders
WHERE product_name = 'Laptop';

-- This shows:
-- 1. Which index used
-- 2. How many rows checked
-- 3. Query speed

-- =======================================================================================
-- Practice Tasks
-- =======================================================================================

-- Task 1: Find orders by customer 1
SELECT *
FROM orders
WHERE customer_id = 1;

-- Task 2: Find highest price product
SELECT *
FROM orders
ORDER BY price DESC
LIMIT 1;

-- Task 3: Find all orders with customer name
SELECT c.name, o.product_name
FROM customers c
JOIN orders o
ON c.id = o.customer_id;

-- =======================================================================================
-- NOTE:
-- =======================================================================================

-- Primary Key → Unique ID
-- Unique Key → No duplicate
-- Index → Faster query
-- Foreign Key → Connect tables
-- EXPLAIN → Check performance

-- ===================================================================================================================================
-- Views, Stored Procedures, and Triggers
-- ===================================================================================================================================

-- Views (Virtual Table):
-- View = Saved SQL Query
-- Instead of writing JOIN again and again, create a view.

-- Create View
CREATE VIEW customer_orders AS
SELECT c.name, o.product_name, o.price
FROM customers c
JOIN orders o
ON c.id = o.customer_id;

-- Now use like a table:
SELECT * FROM customer_orders;

-- Why Views?
-- Views make:
-- Queries simple
-- Code clean
-- Reusable queries

-- Practice Tasks:
-- Show expensive products
SELECT *
FROM customer_orders
WHERE price > 2000;

-- Most expensive product
SELECT product_name, price
FROM customer_orders
ORDER BY price DESC
LIMIT 1;

-- Show Views
SHOW FULL TABLES WHERE TABLE_TYPE = 'VIEW';

-- Delete View
DROP VIEW customer_orders;

-- --------------------------------------------------------------------------------

-- Stored Procedures:
-- Stored Procedure = Saved SQL Function
-- You write once → reuse anytime

-- Create Stored Procedure (MySQL requires delimiter)
DELIMITER //

CREATE PROCEDURE GetOrders()
BEGIN
    SELECT * FROM orders;
END //

DELIMITER ;

-- Run Procedure
CALL GetOrders();

-- Procedure With Parameter
DELIMITER //

CREATE PROCEDURE GetCustomerOrders(IN customerId INT)
BEGIN
    SELECT *
    FROM orders
    WHERE customer_id = customerId;
END //

DELIMITER ;

-- Run Procedure With Parameter
CALL GetCustomerOrders(1);

-- Show Procedures
SHOW PROCEDURE STATUS;

-- Delete Procedure
DROP PROCEDURE GetOrders;
DROP PROCEDURE GetCustomerOrders;

-- --------------------------------------------------------------------------------

-- Triggers:
-- Trigger = Automatic Action
-- Runs automatically when:
-- 1. INSERT
-- 2. UPDATE
-- 3. DELETE

-- Create Log Table
CREATE TABLE order_logs (
    id INT AUTO_INCREMENT PRIMARY KEY,
    message VARCHAR(100)
);

-- Create Trigger:
-- Trigger runs after insert,
DELIMITER //

CREATE TRIGGER order_insert_trigger
AFTER INSERT ON orders
FOR EACH ROW
BEGIN
    INSERT INTO order_logs (message)
    VALUES ('New order Added!');
END //

DELIMITER ;

-- Test Trigger:
-- Insert new order,
INSERT INTO orders (product_name, price, customer_id)
VALUES ('Phone', 30000, 2);

-- Check logs
SELECT * FROM order_logs;
-- Trigger worked automatically

-- Show Triggers:
SHOW TRIGGERS;

-- Delete Trigger:
DROP TRIGGER order_insert_trigger;

-- Summary:
-- Views → Saved SELECT query
-- Stored Procedure → Saved SQL function
-- Trigger → Automatic SQL action

-- ===================================================================================================================================

