-- Day 33: Functions --

CREATE DATABASE FunctionsDB;
USE FunctionsDB;
CREATE TABLE Employees (
    EmpID INT PRIMARY KEY,
    FirstName VARCHAR(50),
    LastName VARCHAR(50),
    HireDate DATE
);
CREATE TABLE Students (
    StudentID INT PRIMARY KEY,
    FirstName VARCHAR(50),
    LastName VARCHAR(50)
);
INSERT INTO Employees (EmpID, FirstName, LastName, HireDate) VALUES
(1, 'Lena', 'Smith', '2018-03-15'),
(2, 'Tom', 'Wood', '2020-07-20'),
(3, 'Lucy', 'White', '2015-01-10');
INSERT INTO Students (StudentID, FirstName, LastName) VALUES
(1, 'Susan', 'Watson'),
(2, 'Marie', 'Johnson'),
(3, 'John', 'Eliot');

-- String Functions --
SELECT EmpID,
UPPER(FirstName) AS UpperCaseName,
LOWER(LastName) AS LowerCaseName,
SUBSTRING(FirstName, 1, 3) AS First3Letters,
CONCAT(FirstName, ' ', LastName) AS FullName
FROM Employees;

-- Date Functions --
SELECT EmpID, HireDate,
YEAR(NOW()) - YEAR(HireDate) AS Tenure_Years,
DATEDIFF(NOW(), HireDate) / 365 AS Tenure_Approx
FROM Employees;

-- User-defined Function --
DELIMITER $$
CREATE FUNCTION GetFullName(first VARCHAR(25), last VARCHAR(25))
RETURNS VARCHAR(50)
DETERMINISTIC
BEGIN
    RETURN CONCAT(first, ' ', last);
END$$
DELIMITER ;
-- Test the Function --
SELECT StudentID,
GetFullName(FirstName, LastName) AS FullName
FROM Students;