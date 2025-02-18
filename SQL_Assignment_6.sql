-- Drop tables if they exist to ensure clean execution
DROP TABLE IF EXISTS students;
DROP TABLE IF EXISTS classes;

-- Create the Classes Table
CREATE TABLE classes (
    class_id INT PRIMARY KEY,
    class_name VARCHAR(50)
);

-- Insert data into Classes Table
INSERT INTO classes (class_id, class_name) VALUES
(101, 'Math'),
(102, 'Science'),
(103, 'History');

-- Create the Students Table
CREATE TABLE students (
    student_id INT PRIMARY KEY,
    student_name VARCHAR(50),
    class_id INT,
    FOREIGN KEY (class_id) REFERENCES classes(class_id)
);

-- Insert data into Students Table
INSERT INTO students (student_id, student_name, class_id) VALUES
(1, 'Alice', 101),
(2, 'Bob', 102),
(3, 'Charlie', 103),
(4, 'David', 101);

-- Fetch student_name and class_name using INNER JOIN
SELECT students.student_name, classes.class_name
FROM students
INNER JOIN classes ON students.class_id = classes.class_id;
