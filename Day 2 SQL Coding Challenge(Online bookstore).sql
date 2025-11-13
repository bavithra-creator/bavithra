-- Day 29 Constraints --
create database bookstore;
use bookstore;

-- Create Books table with Primary Key
CREATE TABLE Books (
    BookID INT PRIMARY KEY,
    Title VARCHAR(100)
);

-- Create Orders table with Foreign Key referencing Books(BookID)
CREATE TABLE Orders (
    OrderID INT PRIMARY KEY,
    BookID INT,
    FOREIGN KEY (BookID) REFERENCES Books(BookID)
);

Alter table Books
add ISBN varchar(10) UNIQUE;

Insert into Books (BookID,Title) values (001,'Harry Potter');
Insert into Orders(OrderID,BookID) values (101,001);

-- DELETE: removes specific rows based on a condition
DELETE FROM Orders
WHERE OrderID = 101;

-- TRUNCATE: removes all rows but keeps the table structure
TRUNCATE TABLE Orders;
