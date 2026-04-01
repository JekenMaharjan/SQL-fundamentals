-- Create Database student_management
CREATE DATABASE student_management;
USE student_management;

-- ====================================================================================

-- Create Tables (Students, Courses, Teachers, Enrollments, Marks)
CREATE TABLE students (
    student_id INT AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(100),
    age INT,
    gender VARCHAR(10),
    email VARCHAR(100),
    admission_date DATE
);

CREATE TABLE courses (
    course_id INT AUTO_INCREMENT PRIMARY KEY,
    course_name VARCHAR(100),
    course_duration VARCHAR(50)
);

CREATE TABLE teachers (
    teacher_id INT AUTO_INCREMENT PRIMARY KEY,
    teacher_name VARCHAR(100),
    subject VARCHAR(100)
);

CREATE TABLE enrollments (
    enrollment_id INT AUTO_INCREMENT PRIMARY KEY,
    student_id INT,
    course_id INT,
    enrollment_date DATE,

    FOREIGN KEY (student_id) REFERENCES students(student_id),
    FOREIGN KEY (course_id) REFERENCES courses(course_id)
);

CREATE TABLE marks (
    mark_id INT AUTO_INCREMENT PRIMARY KEY,
    student_id INT,
    course_id INT,
    marks INT,

    FOREIGN KEY (student_id) REFERENCES students(student_id),
    FOREIGN KEY (course_id) REFERENCES courses(course_id)
);

-- ====================================================================================

-- Insert Sample Data (Students, Courses, Teachers, Enrollments, Marks)
INSERT INTO students (name, age, gender, email, admission_date)
VALUES
('Ram', 20, 'Male', 'ram@gmail.com', '2024-01-10'),
('Sita', 21, 'Female', 'sita@gmail.com', '2024-02-11'),
('Hari', 22, 'Male', 'hari@gmail.com', '2024-03-15'),
('Gita', 20, 'Female', 'gita@gmail.com', '2024-04-20');

INSERT INTO courses (course_name, course_duration)
VALUES
('Computer Engineering', '4 Years'),
('BBA', '4 Years'),
('BIT', '4 Years'),
('Data Science', '1 Year');

INSERT INTO teachers (teacher_name, subject)
VALUES
('Shyam', 'Database'),
('Ramesh', 'Networking'),
('Suresh', 'Programming');

INSERT INTO enrollments (student_id, course_id, enrollment_date)
VALUES
(1, 1, '2024-01-15'),
(2, 1, '2024-02-15'),
(3, 2, '2024-03-20'),
(4, 3, '2024-04-25');

INSERT INTO marks (student_id, course_id, marks)
VALUES
(1, 1, 85),
(2, 1, 90),
(3, 2, 78),
(4, 3, 88);

-- ====================================================================================

-- Practice Queries:

-- 1. Show All Students
SELECT * FROM students;

-- 2. Students Older Than 20
SELECT * FROM students
WHERE age > 20;

-- 3. Sort Students by Name
SELECT * FROM students
ORDER BY name;

-- 4. Count Students
SELECT COUNT(*) AS student_count
FROM students;

-- 5. Join Students + Courses
SELECT s.name, c.course_name
FROM students s
JOIN enrollments e
ON s.student_id = e.student_id
JOIN courses c
ON e.course_id = c.course_id;

-- 6. Show Students With Marks
SELECT s.name, c.course_name, m.marks
FROM students s
JOIN marks m
ON s.student_id = m.student_id
JOIN courses c
ON m.course_id = c.course_id;

-- 7. Average Marks
SELECT AVG(marks) AS avg_marks
FROM marks;

-- 8. Highest Marks
SELECT * FROM marks
ORDER BY marks DESC
LIMIT 1;

-- 9. Students With Marks Greater Than Average
SELECT * FROM marks
WHERE marks > (
    SELECT AVG(marks) FROM marks
);

-- ====================================================================================


