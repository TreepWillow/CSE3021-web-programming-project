-- Use your schema
USE banweb2db;

-- Drop tables if they exist
DROP TABLE IF EXISTS registered;
DROP TABLE IF EXISTS students;
DROP TABLE IF EXISTS classes;
DROP TABLE IF EXISTS users;
DROP TABLE IF EXISTS time_entries;
DROP TABLE IF EXISTS employees;
DROP TABLE IF EXISTS jobs;
DROP TABLE IF EXISTS hired;

-- Create tables
CREATE TABLE users (
    id INT AUTO_INCREMENT PRIMARY KEY,
    username VARCHAR(50),
    pass VARCHAR(100)
);

CREATE TABLE employees (
    id INT AUTO_INCREMENT PRIMARY KEY,
    user_id INT,
    employee_name VARCHAR(50),
    FOREIGN KEY (user_id) REFERENCES users(id)
);

CREATE TABLE jobs (
    id INT AUTO_INCREMENT PRIMARY KEY,
    job_name VARCHAR(50),
    pay_rate DECIMAL(7,2)
);

CREATE TABLE hired (
    id INT AUTO_INCREMENT PRIMARY KEY,
    employee_id INT,
    job_id INT,
    FOREIGN KEY (employee_id) REFERENCES employees(id),
    FOREIGN KEY (job_id) REFERENCES jobs(id)
);

CREATE TABLE time_entries (
    id INT AUTO_INCREMENT PRIMARY KEY,
    hired_id INT,
    clock_in DateTime,
    clock_out DateTime,
    hours_logged DECIMAL(5,2),
    FOREIGN KEY (hired_id) REFERENCES hired(id)
);

CREATE TABLE students (
    id INT AUTO_INCREMENT PRIMARY KEY,
    user_id INT,
    student_name VARCHAR(50),
    FOREIGN KEY (user_id) REFERENCES users(id)
);

CREATE TABLE classes (
    id INT AUTO_INCREMENT PRIMARY KEY,
    class_name VARCHAR(50),
    instructor VARCHAR(50),
    credits INT
);

CREATE TABLE registered (
    id INT AUTO_INCREMENT PRIMARY KEY,
    student_id INT,
    class_id INT,
    grade_percent INT,
    FOREIGN KEY (student_id) REFERENCES students(id),
    FOREIGN KEY (class_id) REFERENCES classes(id)
);



-- Insert users
INSERT INTO users (username, pass) VALUES
('900123456', 'thispassword'),
('900654321', 'password1'),
('900123654', 'myotherpassword');

-- Insert employees
INSERT INTO employees (user_id, employee_name) VALUES
(1, 'John Doe'),
(2, 'Jane Smith');

-- Insert jobs
INSERT INTO jobs (job_name, pay_rate) VALUES
('Cashier', 15.00),
('Stock Clerk', 12.50),
('Manager', 25.00);

-- Insert hired records
INSERT INTO hired (employee_id, job_id) VALUES
(1, 1),
(1, 3),
(2, 2);

-- Insert time entries
INSERT INTO time_entries (hired_id, clock_in, clock_out, hours_logged) VALUES
(1, '2024-01-01 09:00:00', '2024-01-01 17:00:00', 8.00),
(1, '2024-01-02 10:00:00', '2024-01-02 18:00:00', 8.00),
(2, '2024-01-03 08:00:00', '2024-01-03 16:00:00', 8.00);

-- Insert students
INSERT INTO students (user_id, student_name) VALUES
(1, 'Alice Johnson'),
(2, 'Bob Martinez'),
(3, 'Charlie Reed');

-- Insert classes
INSERT INTO classes (class_name, instructor, credits) VALUES
('Intro to Programming', 'Dr. Smith', 3),
('Database Systems', 'Prof. Allen', 4),
('Calculus I', 'Dr. Nguyen', 4),
('English Composition', 'Dr. Brooks', 3);

-- Insert registrations
INSERT INTO registered (student_id, class_id, grade_percent) VALUES
(1, 1, 92),
(1, 3, 87),
(2, 1, 78),
(2, 2, 83),
(2, 3, 90),
(2, 4, 88),
(3, 2, 95);

