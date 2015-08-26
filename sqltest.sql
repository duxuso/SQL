
-- Begin of script
DROP DATABASE co;                    -- Delete the database
CREATE DATABASE IF NOT EXISTS co;    -- Create only if it does not exists
USE co;                              -- Set the default (current) database

CREATE TABLE Salesperson(            -- Create sample talbe
   SalespersonID INT(11),
   Name          VARCHAR(30),
   Age           INT(11),
   Salary        INT(11),
   PRIMARY KEY   (SalespersonID)
);

DESCRIBE Salesperson;

CREATE TABLE Customer(
   CustomerID    INT(11),
   Name          VARCHAR(30),
   PRIMARY KEY   (CustomerID)
);

DESCRIBE Customer;

CREATE TABLE Orders(
   OrderID       INT(11),
   OrderDate     DATE,         
   CustomerID    INT(11),    
   SalespersonID INT(11),
   NumberOfUnits INT(11),
   CostOfUnit    INT(11),
   PRIMARY KEY   (OrderID)
);

DESCRIBE Orders;

SHOW TABLES;

INSERT INTO Salesperson VALUES      -- Insert multiple rows
   (1,'Alice',61,140000),
   (2,'Bob',34,44000),
   (6,'Chris',34,40000),
   (8,'Derek',41,52000),
   (11,'Emmit',57,115000),
   (16,'Fred',38,38000);

SELECT * FROM Salesperson;


INSERT INTO Customer VALUES
   (4,'George'),
   (6,'Harry'),
   (7,'Ingrid'),
   (11,'Jerry');

SELECT * FROM Customer;

INSERT INTO Orders VALUES
   (3,'2013-01-17',4,2,4,400),
   (6,'2013-02-07',4,1,1,600),
   (10,'2013-03-04',7,6,2,300),
   (17,'2013-03-15',6,1,5,300),
   (25,'2013-04-19',11,11,7,300),
   (34,'2013-04-22',11,11,100,26),
   (57,'2013-07-12',7,11,14,11);

SELECT * FROM Orders;

SELECT Name FROM Customer ORDER BY CustomerID DESC LIMIT 0,1;

-- SQL Requirements Answers

-- Requirement 9

-- First answer:

SELECT Name FROM Salesperson, Orders WHERE Salesperson.SalespersonID = Orders.SalespersonID AND CustomerID = 4;

-- Second answer:

SELECT DISTINCT Name FROM Salesperson, Orders WHERE Salesperson.SalespersonID = Orders.SalespersonID AND CustomerID != 4;

-- Third answer:

SELECT Name FROM Salesperson WHERE SalespersonID IN (SELECT SalespersonID FROM Orders GROUP BY SalespersonID HAVING COUNT(SalespersonID)>1);


-- Requirement 10

-- First answer:

SELECT Name FROM Salesperson ORDER BY Salary DESC LIMIT 2,1;

-- Second answer:

CREATE TABLE BigOrders SELECT CustomerID, SUM(NumberOfUnits * CostOfUnit) AS TotalOrderValue FROM Orders GROUP BY CustomerID HAVING TotalOrderValue >1000 ORDER BY TotalOrderValue DESC;

-- Third answer:

SELECT MONTH(OrderDate) AS Month, SUM(CostOfUnit * NumberOfUnits) AS Amount FROM Orders GROUP BY Month ORDER BY YEAR(OrderDate) DESC, Month DESC;


-- Example

-- Answer:

SELECT Name FROM Customer ORDER BY CustomerID DESC LIMIT 0,1;

-- End of script