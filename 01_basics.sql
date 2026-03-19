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
INSERT INTO users (name, email) VALUES
('Ram', 'ram@gmail.com'),
('Shyam', 'Shyam@gmail.com'),
('Hari', 'Hari@gmail.com');

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






