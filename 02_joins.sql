-- JOINS (Very Important)

-- Get users with their tasks
SELECT users.name, tasks.title
FROM users
JOIN tasks
ON users.id = tasks.user_id;

-- ====================================================================

-- INNER JOIN

-- Get users with their tasks (only matched data)
SELECT users.name, tasks.title
FROM users
INNER JOIN tasks
ON users.id = tasks.user_id;

-- JOIN is just a shorthand for INNER JOIN.
-- Both return only matching records between tables.

-- ====================================================================

-- LEFT JOIN

-- Get all users and their tasks (even if no task)
SELECT users.name, tasks.title
FROM users
LEFT JOIN tasks
ON users.id = tasks.user_id;

-- Find users with NO tasks
SELECT users.name
FROM users
LEFT JOIN tasks
ON users.id = tasks.user_id
WHERE tasks.id IS NULL;

-- ====================================================================

-- RIGHT JOIN

-- Get all tasks and their users
SELECT users.name, tasks.title
FROM users
RIGHT JOIN tasks 
ON users.id = tasks.user_id;

