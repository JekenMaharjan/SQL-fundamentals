-- 1. Create database
CREATE DATABASE practice_db;

-- =====================================================================

-- 2. Use database
USE practice_db;

-- It tells MySQL:
-- “From now on, run all queries inside this database”

-- =====================================================================

-- 3. Create users table
CREATE TABLE users (
    id INT PRIMARY KEY AUTO_INCREMENT,
    name VARCHAR(50),
    age INT,
    email VARCHAR(100)
);

-- =====================================================================

-- 4. Create tasks table
CREATE TABLE tasks (
    id INT PRIMARY KEY AUTO_INCREMENT,
    title VARCHAR(100),
    user_id INT,
    FOREIGN KEY (user_id) REFERENCES users(id)
);

-- =====================================================================

-- 5. Insert users
INSERT INTO users (name, age, email) VALUES
('Ram', 24, 'ram@gmail.com'),
('Shyam', 15, 'Shyam@gmail.com'),
('Hari', 36, 'Hari@gmail.com');

-- =====================================================================

-- 6. Insert tasks
INSERT INTO tasks (title, user_id) VALUES
('Learn SQL', '1'),
('Build Project', '1'),
('Practice Coding', '2');

-- =====================================================================

-- 7. Get all users
SELECT *
FROM users;

-- =====================================================================

-- 8. Get users.name and tasks.title using JOIN
SELECT users.name, tasks.title
FROM users
JOIN tasks ON users.id = tasks.user_id;

-- =====================================================================

-- 9. Perform CRUD operations on users table

-- Create (INSERT)
INSERT INTO users (name, email) VALUES
('Jeken', 'jeken@gmail.com');

-- Read (SELECT)
SELECT name
FROM users;

-- Update (UPDATE)
UPDATE users
SET name = 'Jeken Maharjan'
WHERE id = 1;

-- Delete (DELETE)
DELETE FROM tasks
WHERE user_id = 1;

DELETE FROM users
WHERE id = 1;

-- =====================================================================

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

-- LIKE
SELECT * FROM users
WHERE name LIKE 'R%';
-- Output: Ram

SELECT * FROM users
WHERE name LIKE 'H%';
-- Output: Hari

-- BETWEEN
SELECT * FROM users
WHERE age BETWEEN 10 AND 30
AND NOT name = 'Ram';

-- IN
-- Get users whose name is Ram or Hari
SELECT * FROM users
WHERE name IN ('Ram', 'Hari');

-- =====================================================================




