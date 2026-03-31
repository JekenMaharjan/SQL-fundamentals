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
-- Transactions & Security
-- ===================================================================================================================================

-- Transactions:
-- Transaction = Group of queries executed together
-- Example:
-- 1. Transfer money
-- 2. Place order
-- 3. Payment system

-- If one fails → rollback everything

-- ------------------------------------------

-- Create accounts table
CREATE TABLE accounts (
    id INT PRIMARY KEY AUTO_INCREMENT,
    name VARCHAR(50),
    balance INT
);

-- Insert data into accounts
INSERT INTO accounts (name, balance)
VALUES
('Ram', 50000),
('Hari', 30000);

-- ------------------------------------------

-- START TRANSACTION:
-- Start transaction,
START TRANSACTION;

-- Example: Transfer 5000 from Ram to Hari
START TRANSACTION;

UPDATE accounts
SET balance = balance - 5000
WHERE name = 'Ram';

UPDATE accounts
SET balance = balance + 5000
WHERE name = 'Hari';

-- ------------------------------------------

-- COMMIT (Save Changes):
COMMIT;
-- Now changes are permanent.

-- ------------------------------------------

-- ROLLBACK (Undo Changes)
ROLLBACK;
-- Undo all changes.

-- ------------------------------------------

-- Full Example:
START TRANSACTION;

UPDATE accounts 
SET balance = balance - 5000 
WHERE name = 'Ram';

UPDATE accounts 
SET balance = balance + 5000 
WHERE name = 'Hari';

COMMIT;

-- ------------------------------------------

-- Practice Task:

-- Try rollback:
START TRANSACTION;

UPDATE accounts
SET balance = balance - 10000
WHERE name = 'Ram';

ROLLBACK;

-- Check:
SELECT * FROM accounts;

-- Balance remains unchanged.

-- ------------------------------------------

-- --------------------------
--                          |
-- Very Important Rule      |
--                          |
-- Use transaction when:    |
-- 1. Banking               |
-- 2. Orders                |
-- 3. Payments              |
-- 4. Inventory updates     |
--                          |
-- --------------------------

-- --------------------------------------------------------------------------------------

-- User Management & Privileges:

-- Create new database user
CREATE USER 'shop_user'@'localhost' 
IDENTIFIED BY 'password123';

-- ------------------------------------------

-- Grant Permissions:
-- Give access to database,
GRANT ALL PRIVILEGES 
ON shop_db.* 
TO 'shop_user'@'localhost';

-- ------------------------------------------

-- Apply Changes:
FLUSH PRIVILEGES;

-- ------------------------------------------

-- Show Users
SELECT user, host 
FROM mysql.user;

-- ------------------------------------------

-- Show User Permissions
SHOW GRANTS FOR 'shop_user'@'localhost';

-- ------------------------------------------

-- Remove Permission
REVOKE ALL PRIVILEGES 
ON shop_db.* 
FROM 'shop_user'@'localhost';

-- ------------------------------------------

-- Delete User
DROP USER 'shop_user'@'localhost';

-- --------------------------------------------------------------------------------------

-- Backup Database:
-- Backup using command line

-- Backup database:
mysqldump -u root -p shop_db > backup.sql

-- After running:
-- 1. Enter password
-- 2. backup.sql created

-- ------------------------------------------

-- Backup Single Table
mysqldump -u root -p shop_db customers > customers_backup.sql

-- Restore Database
-- Restore backup:
mysql -u root -p shop_db < backup.sql

-- Restore Single Table
mysql -u root -p shop_db < customers_backup.sql

-- MySQL Workbench:
-- 1. Go to Server
-- 2. Click Data Export
-- 3. Select database
-- 4. Click Export

-- Restore:
-- 1. Go to Server
-- 2. Click Data Import
-- 3. Select backup file
-- 4. Import

-- ------------------------------------------

-- Most Important Commands

-- Transactions:
START TRANSACTION;
COMMIT;
ROLLBACK;

-- User Management:
CREATE USER
GRANT
REVOKE
DROP USER

-- Backup:
mysqldump

-- ===================================================================================================================================





