-- FOREIGN KEY

-- One-to-One

-- One user → one profile
CREATE TABLE profiles (
    id INT PRIMARY KEY AUTO_INCREMENT,
    user_id INT UNIQUE,
    bio TEXT,
    FOREIGN KEY (user_id) REFERENCES users(id)
);

-- =========================================================================================

-- One-to-Many

-- Create books table
CREATE TABLE books (
    id INT PRIMARY KEY AUTO_INCREMENT,
    title VARCHAR(100),
    user_id INT,
    FOREIGN KEY (user_id) REFERENCES users(id)
);

-- =========================================================================================

-- Many-to-Many

-- Students ↔ Courses
-- One student can take many courses
-- One course has many students
CREATE TABLE student_courses (
    student_id INT,
    course_id INT,
    FOREIGN KEY (student_id) REFERENCES students(id),
    FOREIGN KEY (course_id) REFERENCES courses(id)
);
