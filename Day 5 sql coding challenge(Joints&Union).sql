-- Day 32: Joins & Union --

CREATE DATABASE CollegeDB;
USE CollegeDB;

CREATE TABLE Students (
    StudentID INT PRIMARY KEY,
    StudentName VARCHAR(50)
);
CREATE TABLE Courses (
    CourseID INT PRIMARY KEY,
    CourseName VARCHAR(50)
);
CREATE TABLE Enrollments (
    EnrollmentID INT PRIMARY KEY,
    StudentID INT,
    CourseID INT
);
INSERT INTO Students (StudentID, StudentName) VALUES
(1, 'Anne'),
(2, 'Babu'),
(3, 'Charles'),
(4, 'Dev'),
(5, 'Erik');

INSERT INTO Courses (CourseID, CourseName) VALUES
(101, 'Computer Science'),
(102, 'Mathematics'),
(103, 'Physics'),
(104, 'Biology');
INSERT INTO Enrollments (EnrollmentID, StudentID, CourseID) VALUES
(1, 1, 101),
(2, 2, 102),
(3, 3, 103),
(4, 5, 101);

--  INNER JOIN --
SELECT s.StudentName, c.CourseName
FROM Students s
INNER JOIN Enrollments e ON s.StudentID = e.StudentID
INNER JOIN Courses c ON e.CourseID = c.CourseID;

--  LEFT & RIGHT JOIN --
SELECT s.StudentName, c.CourseName
FROM Enrollments e
RIGHT JOIN Courses c ON e.CourseID = c.CourseID
LEFT JOIN Students s ON e.StudentID = s.StudentID;

-- UNION vs UNION ALL --
CREATE TABLE CurrentEmployees (
    EmpID INT PRIMARY KEY,
    EmpName VARCHAR(50)
);
CREATE TABLE PastEmployees (
    EmpID INT PRIMARY KEY,
    EmpName VARCHAR(50)
);
INSERT INTO CurrentEmployees (EmpID, EmpName) VALUES
(1, 'Joe'),
(2, 'Thanish'),
(3, 'Perk');

INSERT INTO PastEmployees (EmpID, EmpName) VALUES
(3, 'Ratan'),
(4, 'Nina'),
(5, 'Oscar');

SELECT EmpName FROM CurrentEmployees
UNION
SELECT EmpName FROM PastEmployees;

SELECT EmpName FROM CurrentEmployees
UNION ALL
SELECT EmpName FROM PastEmployees;