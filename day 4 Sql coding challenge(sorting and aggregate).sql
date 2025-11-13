-- Day 31: Sorting & Aggregates --
CREATE DATABASE ECommerceDB;
USE ECommerceDB;

CREATE TABLE Products (
    ProductID INT PRIMARY KEY,
    ProductName VARCHAR(50),
    Price DECIMAL(10,2)
);

CREATE TABLE Sales (
    SaleID INT PRIMARY KEY,
    ProductID INT,
    Quantity INT,
    TotalAmount DECIMAL(10,2),
    SaleDate DATE
);

CREATE TABLE Employees (
    EmpID INT PRIMARY KEY,
    EmpName VARCHAR(50),
    DepartmentName VARCHAR(50)
);

INSERT INTO Products (ProductID, ProductName, Price) VALUES
(1, 'Washing Machine', 85000),
(2, 'Kettle', 5000),
(3, 'Mixie', 15000),
(4, 'Air Fryer', 12000),
(5, 'Refrigerator', 45000);

INSERT INTO Sales (SaleID, ProductID, Quantity, TotalAmount, SaleDate) VALUES
(1, 1, 2, 85000, '2025-10-01'),
(2, 2, 5, 275000, '2025-10-03'),
(3, 3, 10, 30000, '2025-10-05');

INSERT INTO Employees (EmpID, EmpName, DepartmentName) VALUES
(1, 'Anne', 'HR'),
(2, 'Babu', 'IT'),
(3, 'Charles', 'IT'),
(4, 'Dev', 'Finance'),
(5, 'Erik', 'HR'),
(6, 'Ferry', 'IT');
INSERT INTO Employees (EmpID, EmpName, DepartmentName) VALUES
(7, 'Goutham', 'IT'),
(8, 'Harward', 'Finance'),
(9, 'Iniya', 'IT'),
(10, 'Joe', 'IT'),
(11, 'Ken', 'IT'),
(12, 'Leo', 'Finance');
INSERT INTO Employees (EmpID, EmpName, DepartmentName) VALUES
(13, 'Mark', 'IT'),
(14, 'Neha', 'IT'),
(15, 'Ola', 'IT'),
(16, 'Peter', 'IT'),
(17, 'Quel', 'IT');



-- ORDER BY & LIMIT --
SELECT ProductName, Price
FROM Products
ORDER BY Price DESC
LIMIT 3;

-- Aggregate Functions --
SELECT COUNT(*) AS Total_Sales FROM Sales;
SELECT SUM(TotalAmount) AS Total_Revenue FROM Sales;
SELECT AVG(TotalAmount) AS Average_Sale FROM Sales;
SELECT MAX(TotalAmount) AS Max_Sale FROM Sales;
SELECT MIN(TotalAmount) AS Min_Sale FROM Sales;

-- GROUP BY & HAVING --
SELECT DepartmentName, COUNT(EmpID) AS TotalEmployees
FROM Employees
GROUP BY DepartmentName
HAVING COUNT(EmpID) > 10;