Create database UniversityBU;
use UniversityBU;

Create table Departments (
    DeptID INT PRIMARY KEY,
    DepartmentName VARCHAR(50)
);

Create table Students (
    StudentID INT PRIMARY KEY,
    StudentName VARCHAR(50),
    Email VARCHAR(100),
    CourseID VARCHAR(10),
    GPA DECIMAL(3,2)
);

INSERT INTO Departments (DeptID, DepartmentName) VALUES
(1, 'ENGLISH LITERATURE'),
(2, 'MATHS'),
(3, 'BIO-MEDICAL'),
(4, 'VISUAL COMMUNICATION'),
(5, 'COMMERCE');

INSERT INTO Students (StudentID, StudentName, Email, CourseID, GPA) VALUES
(101, 'Ram', 'ram@mail.com', 'C101', 7.8),
(102, 'Sangeetha', NULL, 'C202', 6.9),
(103, 'Arjun', 'arjun@mail.com', 'C303', 8.5),
(104, 'Vedha', NULL, 'C404',8.0),
(105, 'Divya', 'diya@mail.com', 'C101', 9.5);

-- DISTINCT & WHERE --
SELECT DISTINCT DepartmentName
FROM Departments;

SELECT * FROM departments WHERE DepartmentName = 'MATHS' ;

-- IS NULL & NOT NULL --
SELECT StudentID, StudentName, Email
FROM Students
WHERE Email IS NULL;

SELECT StudentID, StudentName, Email
FROM Students
WHERE Email IS NOT NULL;

-- IN, BETWEEN, NOT BETWEEN --
SELECT StudentID, StudentName, CourseID
FROM Students
WHERE CourseID IN ('C101', 'C202', 'C303');

SELECT StudentID, StudentName, GPA
FROM Students
WHERE GPA BETWEEN 8.0 AND 9.0;

SELECT StudentID, StudentName, GPA
FROM Students
WHERE GPA NOT BETWEEN 8.0 AND 9.0;