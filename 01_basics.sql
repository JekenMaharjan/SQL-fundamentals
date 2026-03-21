-- 1. Create database
CREATE DATABASE practice_db;

-- =========================================================================================

-- 2. Use database
USE practice_db;

-- It tells MySQL:
-- “From now on, run all queries inside this database”

-- =========================================================================================

-- 3. Create users table
CREATE TABLE users (
    id INT PRIMARY KEY AUTO_INCREMENT,
    name VARCHAR(50),
    age INT,
    email VARCHAR(100)
);

-- =========================================================================================

-- 4. Create tasks table
CREATE TABLE tasks (
    id INT PRIMARY KEY AUTO_INCREMENT,
    title VARCHAR(100),
    user_id INT,
    FOREIGN KEY (user_id) REFERENCES users(id)
);

-- =========================================================================================

-- 5. Insert users
INSERT INTO users (name, age, email) VALUES
('Ram', 24, 'ram@gmail.com'),
('Shyam', 15, 'Shyam@gmail.com'),
('Hari', 36, 'Hari@gmail.com');

-- =========================================================================================

-- 6. Insert tasks
INSERT INTO tasks (title, user_id) VALUES
('Learn SQL', '1'),
('Build Project', '1'),
('Practice Coding', '2');

-- =========================================================================================

-- 7. Get all users
SELECT * FROM users;

-- =========================================================================================

-- 8. Get users.name and tasks.title using JOIN
SELECT users.name, tasks.title
FROM users
JOIN tasks ON users.id = tasks.user_id;

-- =========================================================================================

-- 9. Perform CRUD operations on users table

-- Create (INSERT)
INSERT INTO users (name, email) VALUES
('Jeken', 'jeken@gmail.com');

-- ------------------------------------------------

-- Read (SELECT)
SELECT name
FROM users;

-- ------------------------------------------------

-- Update (UPDATE)
UPDATE users
SET name = 'Jeken Maharjan'
WHERE id = 1;

-- ------------------------------------------------

-- Delete (DELETE)
DELETE FROM tasks
WHERE user_id = 1;

DELETE FROM users
WHERE id = 1;

-- =========================================================================================

-- 10. Filtering Data

-- WHERE
SELECT * FROM users
WHERE name = 'Jeken';

SELECT * FROM users
WHERE email = 'jeken@gmail.com';

SELECT * FROM tasks
WHERE title = 'Practice Coding';

SELECT * FROM tasks
WHERE user_id = '2';

-- ------------------------------------------------

-- AND, OR, NOT
SELECT * FROM users
WHERE age > 20 AND age < 30;

SELECT * FROM users
WHERE age < 20 OR age > 30;

SELECT * FROM users
WHERE name = 'Ram' OR name = 'Hari';

SELECT * FROM users
WHERE NOT name = 'Hari';

SELECT * FROM users
WHERE age > 20 AND NOT name = 'Ram';

SELECT * FROM users
WHERE (age > 20 AND age < 30) OR name = 'Ram';

-- ------------------------------------------------

-- LIKE
SELECT * FROM users
WHERE name LIKE 'R%';
-- Output: Ram

SELECT * FROM users
WHERE name LIKE 'H%';
-- Output: Hari

-- ------------------------------------------------

-- BETWEEN
SELECT * FROM users
WHERE age BETWEEN 10 AND 30
AND NOT name = 'Ram';

-- ------------------------------------------------

-- IN
-- Get users whose name is Ram or Hari
SELECT * FROM users
WHERE name IN ('Ram', 'Hari');

-- Get users with id 1 or 3
SELECT * FROM users
WHERE id IN (1, 3);

-- Get tasks of specific users (Ram and Shyam)
SELECT users.name, tasks.title
FROM users
JOIN tasks ON users.id = tasks.user_id
WHERE users.name IN ('Ram', 'Shyam');

-- =========================================================================================

-- 11. Sorting & Limiting

-- ORDER BY
-- ASC / DESC

-- Sort Users by Name (by default its ASC -> Ascending order)
SELECT * FROM users
ORDER BY name;

SELECT * FROM users
ORDER BY name ASC;

SELECT * FROM users
ORDER BY name DESC;

-- Sort Tasks by ID (by default its ASC -> Ascending order)
SELECT * FROM tasks
ORDER BY id;

SELECT * FROM tasks
ORDER BY id ASC;

SELECT * FROM tasks
ORDER BY id DESC;

-- ------------------------------------------------

-- LIMIT
-- Get First 2 Users
SELECT * FROM users
LIMIT 2;

-- ------------------------------------------------

-- Combine ORDER BY + LIMIT
-- Get the top 1 task (largest id)
SELECT * FROM tasks
ORDER BY id DESC
LIMIT 1;

-- Using LIMIT with Offset (Advanced)
-- Skip first 1 row, get next 2 rows
SELECT * FROM users
ORDER BY id ASC
LIMIT 1, 2;

-- =========================================================================================

-- 12. Aggregate Functions

-- COUNT() -> Count Rows
-- Count Total Users
SELECT COUNT(*) AS total_users FROM users;

-- Count Users with Email
SELECT COUNT(email) AS users_with_email FROM users
WHERE email IS NOT NULL;

-- ------------------------------------------------

-- SUM() -> Sum Values
-- Total of User IDs
SELECT SUM(id) AS total_id FROM users;

-- ------------------------------------------------

-- AVG() -> Average Value
-- Average User ID
SELECT AVG(id) AS average_id FROM users;

-- ------------------------------------------------

-- MAX(), MIN() -> Highest / Lowest Value
-- Max and Min ID
SELECT MAX(id) AS max_id, MIN(id) AS min_id
FROM users;

-- Max and Min task ID
SELECT MAX(id) AS latest_task, MIN(id) AS first_task
FROM tasks;

-- ------------------------------------------------

-- Combine with WHERE

-- Count tasks of user_id = 1
SELECT COUNT(*) AS user1_tasks
FROM tasks
WHERE user_id = 1;

-- Average id of users whose name starts with 'R'
SELECT AVG(id) AS avg_id
FROM users
WHERE name LIKE 'R%';

-- =========================================================================================

-- 13. GROUP BY & HAVING

-- Count Users by Name
SELECT name, COUNT(*) AS total
FROM users
GROUP BY name;

-- Count Tasks per User
SELECT user_id, COUNT(*) AS total_tasks
FROM tasks
GROUP BY user_id;

-- GROUP BY with JOIN
SELECT users.name, COUNT(tasks.id) AS total_tasks
FROM users
JOIN tasks ON users.id = tasks.user_id
GROUP BY users.name;

-- Show Only Users with More Than 1 Task
SELECT user_id, COUNT(*) AS total_tasks
FROM tasks
GROUP BY user_id
HAVING COUNT(*) > 1;

-- Using JOIN + HAVING
SELECT users.name, COUNT(tasks.id) AS total_tasks
FROM users
JOIN tasks ON users.id = tasks.user_id
GROUP BY users.name
HAVING COUNT(tasks.id) > 1;

-- ------------------------------------------------

-- WHERE vs HAVING
-- WHERE filters BEFORE grouping
SELECT user_id, COUNT(*) 
FROM tasks
WHERE user_id = 1
GROUP BY user_id;

-- HAVING filters AFTER grouping
SELECT user_id, COUNT(*) 
FROM tasks
GROUP BY user_id
HAVING COUNT(*) > 1;

-- =========================================================================================

-- 14. Subqueries

SELECT name
FROM users
WHERE id IN (SELECT user_id FROM tasks);