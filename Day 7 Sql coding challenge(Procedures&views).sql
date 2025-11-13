-- Day 34: Procedures & Views --

create database HR;
use HR;

create table Departments (
    DeptID INT PRIMARY KEY,
    DeptName VARCHAR(50)
);
create table Employees (
    EmpID INT PRIMARY KEY,
    FirstName VARCHAR(50),
    LastName VARCHAR(50),
    DeptID INT,
    FOREIGN KEY (DeptID) REFERENCES Departments(DeptID)
);
create table Salaries (
    EmpID INT,
    Salary DECIMAL(10,2),
    FOREIGN KEY (EmpID) REFERENCES Employees(EmpID)
);
INSERT INTO Departments VALUES
(1, 'HR'),
(2, 'Finance'),
(3, 'IT');
INSERT INTO Employees VALUES
(101, 'John', 'Doe', 1),
(102, 'Alice', 'Smith', 2),
(103, 'Bob', 'Johnson', 3);
INSERT INTO Salaries VALUES
(101, 50000),
(102, 60000),
(103, 55000);

-- Stored Procedure --
DELIMITER $$
CREATE PROCEDURE GetEmpID (IN emp_ID int)
BEGIN
	SELECT * from employees where EmpId = emp_ID;
END $$
DELIMITER ;
-- Execute Procedure --
Call GetEmpID(102); 

-- Simple View --
CREATE VIEW EmpDeptView AS
SELECT 
    e.EmpID,
    CONCAT(e.FirstName, ' ', e.LastName) AS EmployeeName,
    d.DeptName
FROM Employees e
JOIN Departments d ON e.DeptID = d.DeptID;
-- Use the View --
Select * from EmpDeptView;

-- Complex View --
CREATE VIEW EmpDetails AS
SELECT 
    e.EmpID,
    CONCAT(e.FirstName, ' ', e.LastName) AS EmployeeName,
    d.DeptName,
    s.Salary
FROM Employees e
JOIN Departments d ON e.DeptID = d.DeptID
JOIN Salaries s ON e.EmpID = s.EmpID;
-- Use the Complex View --
Select * from EmpDetails;