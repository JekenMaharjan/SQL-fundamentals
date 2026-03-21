-- Task 1 - Create Database: Create library_db Database
CREATE DATABASE library_db;
USE library_db;

-- Task 2 - Create Tables: Create Books Table (id, title, author, available_copies)
CREATE TABLE books (
    id INT PRIMARY KEY AUTO_INCREMENT,
    title VARCHAR(100),
    author VARCHAR(100),
    available_copies INT
);

-- Task 3 - Create Tables: Create Members Table (id, name, email)
CREATE TABLE members (
    id INT PRIMARY KEY AUTO_INCREMENT,
    name VARCHAR(100),
    email VARCHAR(100)
);

-- Task 4 - Create Tables: Create Borrow Table (id, book_id, member_id, borrow_date, return_date)
CREATE TABLE borrow (
    id INT PRIMARY KEY AUTO_INCREMENT,
    book_id INT,
    member_id INT,
    borrow_date DATE,
    return_date DATE,
    FOREIGN KEY (book_id) REFERENCES books(id),
    FOREIGN KEY (member_id) REFERENCES members(id)
);

-- Task 5 - Insert Data: Add Books
INSERT INTO books (title, author, available_copies) VALUES
('DBMS Basics', 'John Smith', 5),
('Learn SQL', 'Alice Brown', 3),
('Data Structure & Algorithm', 'Mark Lee', 4);

-- Task 6 - Insert Data: Add Members
INSERT INTO members (name, email) VALUES
('Jeken', 'jeken@gmail.com'),
('Ram', 'ram@gmail.com'),
('Sita', 'sita@gmail.com');

-- Task 7 - Insert Data: Borrow Books
INSERT INTO borrow (book_id, member_id, borrow_date, return_date) VALUES
(1, 1, '2026-03-01', NULL),
(2, 2, '2026-03-05', '2026-03-10'),
(1, 3, '2026-03-07', NULL);

-- Task 8 - Basic Queries: View All Books
SELECT * FROM books;

-- Task 9 - Basic Queries: View Available Books Only
SELECT * FROM books
WHERE available_copies > 0;

-- Task 10 - JOIN Practice: View Who Borrowed Which Book
SELECT members.name, books.title
FROM borrow
JOIN books ON borrow.book_id = books.id
JOIN members ON borrow.member_id = members.id

-- Task 11 - JOIN Practice: View Books Not Yet Returned
SELECT books.title, members.name
FROM borrow
JOIN books ON borrow.book_id = books.id
JOIN members ON borrow.member_id = members.id
WHERE return_date IS NULL;

-- Task 12 - Real-World Operations: Borrow a Book (Update copies)
UPDATE books
SET available_copies = available_copies - 1
WHERE id = 1;

-- Task 13 - Real-World Operations: Return a Book, Then increase copies:
UPDATE borrow
SET return_date = '2026-03-20'
WHERE id = 1;

UPDATE books
SET available_copies = available_copies + 1
WHERE id = 1;

-- Task 14 - Aggregation: View Total Books Borrowed Per Member
SELECT members.name, COUNT(*) AS total_books_borrowed
FROM borrow
JOIN members ON borrow.member_id = members.id
-- JOIN books ON borrow.book_id = books.id
GROUP BY members.name;

-- Task 15 - Aggregation: Most Borrowed Book
SELECT book_id, COUNT(*) AS times_borrowed
FROM borrow
GROUP BY book_id
ORDER BY times_borrowed DESC
LIMIT 1;

-- Task 16 - Challenges: Find members who never borrowed a book
SELECT members.id, members.name
FROM members
LEFT JOIN borrow 
ON members.id = borrow.member_id
WHERE borrow.member_id IS NULL;

-- Task 17 - Challenges: Find books that are currently not borrowed by anyone
-- SELECT books.id, books.title, borrow.book_id
SELECT books.id, books.title
FROM books
LEFT JOIN borrow 
ON books.id = borrow.book_id
WHERE borrow.book_id IS NULL;

-- Task 18 - Challenges: Find members who borrowed more than 1 book
SELECT member_id, COUNT(book_id) AS total_books
FROM borrow
GROUP BY member_id
HAVING COUNT(book_id) > 1
ORDER BY total_books DESC;

-- Task 19 - Challenges: Show overdue books (return_date is NULL and borrow_date older than 7 days)
SELECT book_id, borrow_date, return_date
FROM borrow
WHERE return_date IS NULL
AND DATEDIFF(CURDATE(), borrow_date) > 7;

-- Task 20 - Challenges: Delete a member (handle foreign key issue properly)
-- First, delete all borrow records of this member
DELETE FROM borrow
WHERE member_id = 2;

-- Then delete the member
DELETE FROM members
WHERE id = 2;
