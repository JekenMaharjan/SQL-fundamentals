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

DELIMITER //

CREATE PROCEDURE proc_add_student(
    IN studentName VARCHAR(100),
    IN studentAge INT,
    IN studentGender VARCHAR(10),
    IN studentEmail VARCHAR(100),
    IN admissionDate DATE
)
BEGIN
    INSERT INTO students (name, age, gender, email, admission_date)
    VALUES (studentName, studentAge, studentGender, studentEmail, admissionDate);
END //

DELIMITER ;

CALL proc_add_student('Ram', 20, 'Male', 'ram@gmail.com', '2024-01-10');
CALL proc_add_student('Sita', 21, 'Female', 'sita@gmail.com', '2024-02-11');
CALL proc_add_student('Hari', 22, 'Male', 'hari@gmail.com', '2024-03-15');
CALL proc_add_student('Gita', 20, 'Female', 'gita@gmail.com', '2024-04-20');
CALL proc_add_student('Gopal', 23, 'Male', 'gopal@gmail.com', '2024-06-10');

-- -----------------------------------------------------------------------------------

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

-- PRACTICE QUERIES:

-- ------------------------------------------------------------
-- 1. Show All Students
-- ------------------------------------------------------------

-- Stored Procedure -> 'proc_get_all_students'
DELIMITER //

CREATE PROCEDURE proc_get_all_students()
BEGIN
    SELECT * FROM students;
END //

DELIMITER ;

CALL proc_get_all_students();

-- ------------------------------------------------------------
-- 2. Students Older Than 20
-- ------------------------------------------------------------

-- Stored Procedure -> 'proc_students_over_20'
DELIMITER //

CREATE PROCEDURE proc_students_over_20()
BEGIN
    SELECT * FROM students
    WHERE age > 20;
END //

DELIMITER ;

CALL proc_students_over_20();

-- ------------------------------------------------------------
-- 3. Sort Students by Name
-- ------------------------------------------------------------

-- Stored Procedure -> 'proc_sort_students_by_name_asc'
DELIMITER //

CREATE PROCEDURE proc_sort_students_by_name_asc()
BEGIN
    SELECT * FROM students
    ORDER BY name ASC;
END //

DELIMITER ;

CALL proc_sort_students_by_name_asc();

-- ------------------------------------------------------------
-- 4. Count Students
-- ------------------------------------------------------------

-- Stored Procedure -> 'proc_total_students'
DELIMITER //

CREATE PROCEDURE proc_total_students()
BEGIN
    SELECT COUNT(*) AS student_count
    FROM students;
END //

DELIMITER ;

CALL proc_total_students();

-- ------------------------------------------------------------
-- 5. Join Students + Courses
-- ------------------------------------------------------------

-- View -> 'view_student_courses'
CREATE VIEW view_student_courses AS
SELECT s.name, c.course_name
FROM students s
JOIN enrollments e
ON s.student_id = e.student_id
JOIN courses c
ON e.course_id = c.course_id;

-- Stored Procedure -> 'proc_student_courses'
DELIMITER //

CREATE PROCEDURE proc_student_courses()
BEGIN
    SELECT * FROM view_student_courses;
END //

DELIMITER ;

CALL proc_student_courses();

-- ------------------------------------------------------------
-- 6. Show Students With Marks
-- ------------------------------------------------------------

-- View -> 'view_student_marks'
CREATE VIEW view_student_marks AS
SELECT s.name, c.course_name, m.marks
FROM students s
JOIN marks m
ON s.student_id = m.student_id
JOIN courses c
ON m.course_id = c.course_id;

-- Stored Procedure -> 'proc_student_marks'
DELIMITER //

CREATE PROCEDURE proc_student_marks()
BEGIN
    SELECT * FROM view_student_marks;
END //

DELIMITER ;

CALL proc_student_marks();

-- ------------------------------------------------------------
-- 7. Average Marks
-- ------------------------------------------------------------

-- Stored Procedure -> 'proc_avg_marks'
DELIMITER //

CREATE PROCEDURE proc_avg_marks()
BEGIN
    SELECT AVG(marks) AS avg_marks
    FROM marks;
END //

DELIMITER ;

CALL proc_avg_marks;

-- ------------------------------------------------------------
-- 8. Highest Marks
-- ------------------------------------------------------------

-- Stored Procedure -> 'proc_highest_marks'
DELIMITER //

CREATE PROCEDURE proc_highest_marks()
BEGIN
    SELECT * FROM marks
    ORDER BY marks DESC
    LIMIT 1;
END //

DELIMITER ;

CALL proc_highest_marks;

-- ------------------------------------------------------------
-- 9. Students With Marks Greater Than Average
-- ------------------------------------------------------------

-- Stored Procedure -> 'proc_students_above_average_marks'
DELIMITER //

CREATE PROCEDURE proc_students_above_average_marks()
BEGIN
    SELECT * FROM marks
    WHERE marks > (
        SELECT AVG(marks) FROM marks
    );
END //

DELIMITER ;

CALL proc_students_above_average_marks;

-- ====================================================================================


