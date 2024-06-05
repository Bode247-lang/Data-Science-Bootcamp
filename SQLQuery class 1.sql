CREATE DATABASE Gomycode_2;

USE Gomycode_2

CREATE TABLE Employees(
      EmployeeID INT PRIMARY KEY,
	  FirstName VARCHAR(50),
	  LastName VARCHAR(50),
	  Department VARCHAR (50),
	  Salary DECIMAL(10, 2));


-- Inserting values into Employee's table
INSERT INTO Employees (EmployeeID, FirstName, LastName, Department, Salary)
VALUES (1, 'JOHN', 'Doe', 'HR', 55000.00),
       (2, 'Jane', 'Smith', 'Marketing', 60000.00),
	   (3, 'Bob', 'Johnson', 'IT', 65000.00);
SELECT * FROM Employees
-- Retrivieving all information from the table

 
--Retrieving the information for HR department
SELECT * From Employees WHERE Department = 'HR'

--Retrieving the information where salary is higher than 45000
SELECT * FROM Employees 
SELECT * FROM Employees WHERE Salary > 60000
--Update the salary of employer with ID 1
UPDATE Employees
SET Age = 30
WHERE EmployeeID = 2

--DELETE Employee with 1D 3
DELETE FROM Employees
WHERE EmployeeID = 3;

SELECT TOP 1 * FROM Employees

-- To View The Structure of the Table
SP_HELP Employees

--Using the ALTER command
SP_RENAME 'Employees.FirstName', 'first_name';

SELECT * from Employees
--Adding a new column to the table
 ALTER TABLE Orders ADD COLUMN 

 TRUNCATE TABLE Employees

 DROP TABLE Employees

 -- Inserting values into Employee's table
INSERT INTO Employees (EmployeeID, FirstName, LastName, Department, Salary)
VALUES (4, 'BODE', 'KILL', 'HR', 55000.00),
       (5, 'DIMEJI', 'CUM', 'Marketing', 60000.00),
	   (6, 'TUNDE', 'GO', 'IT', 65000.00);

-- THE JOIN COMMAND (JOINS TWO  OR MORE TABLE TOGTHER)
create TABLE Department(
   DepartmentID INT PRIMARY KEY,
   DepartmentName VARCHAR (50)
   );

 SELECT * FROM Department
 INSERT INTO Department (DepartmentID, DepartmentName)
    VALUES (1, 'HR' ),
	       (2, 'Marketing'),
		   (3,  'IT' );


SELECT * FROM Department
SELECT * FROM Employees

SELECT * FROM Employees
  JOIN Department
  ON Employees.Department = Department.DepartmentName


 INSERT INTO Department (DepartmentID, DepartmentName)
    VALUES (4, 'Software Engineering' ),
	       (5, 'Data Analystics'),
		   (6,  'Project management' );

-- left join on the tables
SELECT * FROM Employees
  LEFT JOIN Department
  ON Employees.Department = Department.DepartmentName

-- left join on the tables
SELECT * FROM Department
  RIGHT JOIN Employees
  ON Department.DepartmentName = Employees.Department 

 -- AGGREGATE FUNCTIONS
 -- CALCULATE THE AVERAGE  SALARY OF EMPLOYEES IN THE IT DEPARTMENT
 SELECT AVG(SALARY) AS AVERAGESALARY FROM EMPLOYEES
  WHERE DEPARTMENT = 'IT';

-- AGGREGATE FUNCTIONS
 -- CALCULATE THE AVERAGE  SALARY OF EMPLOYEES IN THE IT DEPARTMENT
 SELECT COUNT(SALARY) AS HIGHESTSALARY FROM EMPLOYEES
  WHERE DEPARTMENT = 'IT';

  --CONSTRAINTS
  --Creating a table with primary key constraint
 CREATE TABLE Customers(
        CustomerID INT PRIMARY KEY,
		FirstName VARCHAR(50),
		LastName VARCHAR(50)
		);


--CREATING A TABLE 
CREATE TABLE Orders(
        OrderID INT PRIMARY KEY,
		CustomerID INT,
		OrderDate DATE,
		FOREIGN KEY(CustomerID) REFERENCES Customers(CustomerID)
		);

--CREATE a Table with Unique Constaint
CREATE TABLE Products(
    ProductID INT UNIQUE NOT NULL,
	ProductName VARCHAR(100)
	);

SP_HELP Products


--CREATING A TABLE WITH CHECK CONSTRAINTS
CREATE TABLE Students(
   StudentID INT PRIMARY KEY,
   Age INT,
   CHECK (Age >= 18)
   );

CREATE TABLE Addresses(
  ID INT IDENTITY(1,1) PRIMARY KEY,
  Street_Address VARCHAR(255),
  City VARCHAR(100),
  States VARCHAR(50),
  Zipcode VARCHAR(10),
  );

--Adding a new column to the table
 --ALTER TABLE Orders ADD Column Date Timestamp Current_timeestamp

 --Adding a new column to the table
 ALTER TABLE Orders ADD Dates DATE DEFAULT Getdate()
 SELECT * FROM Orders

 INSERT INTO Orders(OrderID, CustomerID, OrderDate, Dates)
 VALUES(001, 1, 12-02-2024, 11-02-2024)


 SELECT * FROM Employees
 WHERE Salary >= 55000 AND Department = 'IT';

 SELECT * FROM Employees


 SELECT * FROM house_pricing_dataset
 WHERE Price >=  342000 AND City = 'Seattle'

SELECT * FROM house_pricing_dataset
 WHERE Price >  342000 AND City = 'Seattle'
  
SELECT * FROM house_pricing_dataset
 WHERE Price >=  342000 OR City = 'Seattle'
   
SELECT * FROM house_pricing_dataset
 WHERE Price <= 342000 OR City = 'Seattle'

 SELECT * FROM house_pricing_dataset
 WHERE Price > 80000 AND City = 'Seattle';

 SELECT * FROM  house_pricing_dataset
 WHERE Price <  551962.99 OR City = 'Seattle';

 SELECT  ROUND (AVG(PRICE) , 2) AS_price FROM  house_pricing_dataset;


 SELECT * FROM house_pricing_dataset
 WHERE NOT City = 'Seattle' AND Price < 200000;

 --Calculating the Average price of the houses
 SELECT  ROUND (AVG(price) , 2) FROM  house_pricing_dataset
 
 --Using the IN keyword to check for the avarege price in seattle and kent city
 SELECT ROUND(AVG(price),2)  FROM house_pricing_dataset 
  WHERE city IN ('Seatle' , 'Kent');

-- SELECTING THE UNIQUE CITIES IN OUR DATASET
SELECT DISTINCT (city) FROM house_pricing_dataset

--SELECTING house prices between a range
SELECT * FROM house_pricing_dataset
WHERE city IN ('seattle' , 'Kent') AND Date BETWEEN '2014-05-02' AND '2014-10-10';

--Using the Like Keyword/clause
SELECT * FROM house_pricing_dataset
WHERE City LIKE 'S%';

--Using the Like Keyword/clause
SELECT * FROM house_pricing_dataset;
SELECT City,Bedrooms, MAX(price) FROM house_pricing_dataset
WHERE city LIKE 'S%'
GROUP BY city, bedrooms

--Using the SQL Case keyword/clause
SELECT city, price,
   CASE
    WHEN price < 2000000 THEN 'Low cost house'
	WHEN price > 2000000 AND price < 1000000 THEN 'Average cost house'
	WHEN price > 1000000 THEN 'High cost house'
  END AS Category_of_houses
  FROM house_pricing_dataset

SELECT Price, city, waterfront,
   CASE
    WHEN waterfront = 1 THEN 'waterfront Avalaible'
	WHEN waterfront = 0 THEN 'waterfront unavalaible'
  END AS water_front
  FROM house_pricing_dataset

UPDATE Employees
 Salary =
CASE
WHEN Department = 'IT' THEN 'salary' * 1.1
WHEN Department = 'Markerting' THEN Salary *1.15

ELSE Salary
 END;

 --Using Group by function i SQL
 SELECT TOP 2 * FROM house_pricing_dataset
 SELECT DISTINCT(bathrooms) FROM house_pricing_dataset
 SELECT * FROM house_pricing_dataset
 SELECT DISTINCT ([VIEW]) FROM house_pricing_dataset

 --How many Houses have view
  SELECT [view], COUNT(*) AS no_of_view FROM house_pricing_dataset
 WHERE [view] >=0
 Group BY [view]
 ORDER BY no_of_view DESC;

 -- Houses that have prices  greater or equal to 200000 for 2 or more bedrooms and floors greater or equals to 1 any city
 SELECT * FROM house_pricing_dataset
 WHERE city IN ('seattle', 'Redmond') AND price >=200000 AND bedrooms >=2  AND floors >=1;

 -- group cities according to years renovated

 SELECT [yr_renovated],  COUNT(*) AS no_of_yr_renovated FROM house_pricing_dataset
 WHERE [yr_renovated] >=0
 Group BY [yr_renovated], city
 ORDER BY no_of_yr_renovated DESC;

 SELECT [yr_renovated], [city],  COUNT(*) AS no_of_yr_renovated FROM house_pricing_dataset
 WHERE [yr_renovated] > 0
 Group BY [yr_renovated], city
 ORDER BY no_of_yr_renovated DESC;

 -- using the having clause
 
 SELECT AVG(price), [view] FROM house_pricing_dataset
 GROUP BY [view]
 HAVING [view] > 3;


 SELECT * FROM Customers
 SELECT * FROM Orders
 SELECT * FROM Products

INSERT INTO  Customers(CustomerID, FirstName, LastName)
VALUES (2, 'BODE', 'ADAMS'),
        (3, 'DIMEJI', 'SALIU'),
		(4,  'TOPE', 'JAMES');

INSERT INTO Orders(OrderID, CustomerID, OrderDate, Dates)
VALUES 
        (002, 2,'02-02-2024', '02-02-2024'),
		(003, 3,'03-02-2024', '03-02-2024'),
		(004, 4, '04-02-2024', '04-02-2024');

INSERT INTO Products(ProductID, ProductName)
VALUES (1, 'Sneaker'),
       (2, 'Belt'),
	   (3, 'Tees'),
	   (4, 'Watches');

--THE INTERSET OPERATORS CHECKES THE VALUES THAT COMMON BETWEEN BOTH TABLES

SELECT CustomerID FROM Customers
INTERSECT
SELECT CustomerID FROM Orders

-- THE UNION OPERATOR WILL RETURN ALL THE VALUES FROM THE TABLE
SELECT CustomerID FROM Customers
UNION
SELECT CustomerID FROM Orders
-- Diffrence Between two tables
SELECT FirstName FROM Employees
EXCEPT
SELECT FirstName FROM Customers
        
DROP TABLE SampleSuperstore

SELECT * FROM house_pricing_dataset

SELECT bathrooms FROM house_pricing_dataset
EXCEPT
SELECT bedrooms FROM house_pricing_dataset

SELECT * FROM Samplesuperstore

SELECT Region FROM SampleSuperstore


--City that has two or more quantities of furniture

SELECT CITY, COUNT(*) AS Quantity FROM SampleSuperstore
 WHERE [Quantity] >= 2
 Group BY city
 ORDER BY Quantity DESC;

 -- Find thr total sales of consumer by region

 SELECT Region, ROUND(SUM(Sales), 2) AS Total_Sales FROM SampleSuperstore
WHERE Segment = 'Consumer' 
GROUP BY Region
ORDER  BY Total_Sales DESC

-- checkpoint overview

CREATE TABLE Wine(
            NumW INT PRIMARY KEY NOT NULL,
			Categoty VARCHAR(100),
			Year VARCHAR(50),
			Degree Decimal(10, 2),
			);

CREATE TABLE HARVEST(
         NumP INT PRIMARY KEY NOT NULL,
		 Quantity INT);
		 

CREATE TABLE Producer(
               NumP INT PRIMARY KEY NOT NULL,
			   NumW INT,
			   FirstName VARCHAR(200),
			   LastName VARCHAR(200),
			   Region VARCHAR(150)
			   );
SELECT * FROM Wine
SELECT * FROM HARVEST
SELECT * FROM Producer

INSERT INTO Wine(NumW, Categoty, year, Degree)
         VALUES(1, 'Non-Alcholic', '1989', 0.0),
		       (2, 'Alcholic', '1992', 10.25),
			   (3, 'Alcholic', '1990', 15.50);

INSERT INTO Harvest(NumP, Quantity)
          VALUES(1, 800),
		        (2, 500),
				(3, 350);

INSERT INTO Producer(NumP, NumW, FirstName, LastName, Region)
           VALUES(001, 1,'TUNDE', 'BOROKINNI', 'TINUS'),
		         (002, 2,'PRAISE', 'OGOOLUWA', 'SFAX'),
				 (003, 3,'DIMEJI', 'SALIU', 'SOUSSE'),
				 (004, 4,'BODE', 'ADARAMOYE', 'ETTADHAMEN'),
				 (005, 5, 'Haruna', 'Ishola', 'Sousse'),
		         (006, 6, 'Jacob', 'yobo', 'Zarzis'),
		         (007, 7, 'Musa', 'Hassan', 'Tunis'),
		         (008, 8, 'David', 'Bechkam', 'Sousse')
		         (009, 9, 'Zara', 'Buhari', 'Gafsa'),
		         (010, 10, 'Emmanuel', 'Okunola', 'Sousse'),
		         (011, 11, 'Benson', 'Buju', 'Tunis'),
		         (012, 12, 'Victor', 'Moses', 'Sousse'),
		         (013, 13, 'Bankole', 'Banji', 'Sfax'),
		         (014, 14, 'Saliu', 'Lisa', 'Tozeur'),
		         (015, 15, 'Keshinro', 'Deji', 'Sousse'),
		         (016, 16, 'Burna', 'Boy', 'Sousse'),
		         (017, 17, 'David ', 'Adeleke', 'Tunis'),
		         (018, 18, 'Abubaker', 'Munirat', 'Sousse'),
		         (019, 19, 'Wizid', 'Ayo', 'Tozeur'),
		         (020, 20, 'Micheal', 'Jackson', 'Sousse'),
		         (021, 21, 'Fifty', 'Cent', 'Sousse'),
		         (022, 22, 'Jude', 'Okafor', 'Sousse'),
		         (023, 23, 'Babatunde', 'Lamidi', 'Sfax'),
		         (024, 24, 'Adigun', 'Ismaila', 'Tozeur'),
		         (025, 25, 'Vicent', 'chief', 'Sousse'),
		         (026, 26, 'Paul', 'Okoro', 'Zarzis'),
		         (027, 27, 'Jackson', 'Omasan', 'Tunis'),
		         (028, 28, 'Salvatore', 'Shade', 'Sousse'),
		         (029, 29, 'Akinleye', 'Rofiat', 'Gafsa'),
		         (030, 30, 'Gaius', 'Ade', 'Sousse'),




 
