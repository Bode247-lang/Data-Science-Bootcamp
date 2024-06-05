CREATE DATABASE Checkpoint_1;

USE Checkpoint_1
DROP DATABASE Checkpoint_1

CREATE TABLE Customer(
      CustomerID INT PRIMARY KEY NOT NULL,
	  FirstName VARCHAR(50) NOT NULL,
	  Address VARCHAR(50) NOT NULL,
      );
SELECT * FROM Customer


CREATE TABLE Product(
     ProductID INT PRIMARY KEY NOT NULL,
	 Name VARCHAR(50) NOT NULL,
     Price Decimal (10, 2) NOT NULL,
	 );
SELECT * FROM Product

SP_HELP Product



CREATE TABLE Orders(
        OrderID INT PRIMARY KEY NOT NULL,
		CustomerID INT NOT NULL,
		ProductID INT NOT NULL,
		Quantity INT NOT NULL,
		OrderDate INT NOT NULL,
		FOREIGN KEY(CustomerID) REFERENCES Customer(CustomerID),
		FOREIGN KEY(ProductID) REFERENCES Product(ProductID)
		);
SELECT * FROM Orders

ALTER TABLE Orders Drop COLUMN OrderDate

ALTER TABLE Orders ADD OrderDate DATE

SP_HELP Orders

-- Inserting Values into Customers table
INSERT INTO Customer (CustomerID, FirstName, Address)
    VALUES (1, 'AHMED', 'TUNISIA' ),
	       (2, 'Culibaly', 'Senegal'),
		   (3,  'HASSAN', 'Egypt' );


INSERT INTO Product (ProductID, Name, Price)
    VALUES (1, 'Cookies', '10' ),
	       (2, 'Candy', '5.2');

INSERT INTO Orders (OrderID, CustomerID, ProductID, Quantity, OrderDate)
	VALUES (1, 1, 2, 3, '2023-01-22'),
	       (2, 2, 1, 10, '2023-04-14');

-- Update the quantity of the second order, the new value should be 6.

 UPDATE  Orders
 SET Quantity = 6
 WHERE OrderID = 2;

 SELECT * FROM Orders

-- Delete the third customer from the customers table.
 SELECT * FROM Customer
DELETE FROM Customer WHERE CustomerID = 3

-- Delete the orders table content then drop the table.

TRUNCATE TABLE Orders;
DROP TABLE Orders;


--CREATING TABLE FOR CUSTOMER
CREATE TABLE Customer(Customer_id INT PRIMARY KEY ,
                      Customer_Name VARCHAR (100),
                      Customer_Tel VARCHAR (100));


--INSERTING INTO TABLE FOR CUSTOMER
   INSERT INTO Customer(Customer_id,Customer_Name,
                                Customer_Tel)
		       VALUES (001,'Alice',08034746219),
			          (002,'Bob', 07030141936),
					  (003,'Charlie', 08106260341);

			  
--CREATING TABLE FOR PRODUCTS 
CREATE TABLE Products(Products_id INT PRIMARY KEY,
                      Product_Name VARCHAR (100),Category VARCHAR(100),
                      Product_Price Decimal (10,2));

--INSERTING INTO TABLE FOR PRODUCTS
   INSERT INTO Products (Products_id, Product_Name, Category, Product_price)
      VALUES (1,'Widget','Appliances', 10.00),
	         (2, 'Gadget', 'Appliances',20.00),
			 (3, 'Doohickey', 'Appliances', 15.00);

CREATE TABLE Orders (Order_id INT PRIMARY key,
                     Customer_id INT,
                     Products_id INT,
                     OrderDate DATE,
                     Quantity INT);
                    


					
--INSERTING INTO TABLE FOR Orders
 INSERT INTO Orders (Order_id,Customer_id,Products_id,OrderDate,Quantity)
          VALUES(1,'001','1','2021-01-01','10'),
		        (2,'001','2','2021-01-02','5'),
				(3,'002','1','2021-01-03','3'),
				(4,'002','2','2021-01-04','7'),
				(5,'003','1','2021-01-05','2'),
				(6,'003','3','2021-01-06','3');
	SELECT * FROM Customer
	SELECT * FROM Products
	SELECT * FROM Orders

---(3)

	SELECT Customer.Customer_Name,Products.Product_Price * Orders.Quantity AS Total_cost
	from Customer
	JOIN Orders
	ON Customer.Customer_id = Orders.Customer_id
	JOIN Products
	ON Orders.Products_id	 = Products.Products_id
	WHERE Products.category IN ('Widget','Gadget') AND Orders.Quantity >=1;
	
--(4) A query to retrieve the names of customers who have placed an order for 
--atleast on widget along with the total cost of the widgest ordered by each customer.
	SELECT
    Customer.Customer_Name,
    SUM(Orders.Quantity * Products.Product_Price) AS total_cost
FROM
    Customer
JOIN
    Orders  ON Customer.Customer_id = Orders.Customer_id
JOIN
    Products  ON Orders.Products_id = Products.Products_id
WHERE
    Products.Product_Name = 'Widget'
GROUP BY
    Customer.Customer_Name

HAVING 
     SUM(Orders.Quantity) >= 1;


---(5)Write a query to retrieve the names of the customers who have placed an order
--for atleast one gadget along with the total cost of the gadgets ordered by each customer.

	SELECT
    Customer.Customer_Name,
    SUM(Orders.Quantity * Products.Product_Price) AS total_cost
FROM
    Customer 
JOIN
    Orders  ON Customer.Customer_id = Orders.Customer_id
JOIN
    Products  ON Orders.Products_id = Products.Products_id
WHERE
    Products.Product_Name = 'Gadget'
GROUP BY
    Customer.Customer_Name
HAVING
    SUM(Orders.Quantity) >= 1;


--(6).Write a query to retrieve the names of the customers who have placed an order
--for at least one doohickey, along with the total cost of the doohickeys ordered by each customer.
SELECT
    Customer.Customer_Name,
    SUM(Orders.Quantity * Products.Product_Price) AS total_cost
FROM
    Customer 
JOIN
    Orders  ON Customer.Customer_id = Orders.Customer_id
JOIN
    Products  ON Orders.Products_id = Products.Products_id
WHERE
    Products.Product_Name = 'Doohickey'
GROUP BY
    Customer.Customer_Name
HAVING
    SUM(Orders.Quantity) >= 1;

--(7) Write a query to retrieve the total number of widgets and gadgets 
--ordered by each customer, along with the total cost of the orders.

SELECT
    Customer.customer_name,
    SUM(CASE WHEN Products.Product_Name = 'Widget' THEN Orders.Quantity ELSE 0 END) AS total_widgets,
    SUM(CASE WHEN Products.Product_Name = 'Gadget' THEN Orders.Quantity ELSE 0 END) AS total_gadgets,
    SUM(Orders.Quantity * Products.Product_Price) AS total_cost
FROM
    Customer
JOIN
    Orders  ON Customer.Customer_id = Orders.Customer_id
JOIN
    Products ON Orders.Products_id = Products.Products_id
WHERE
    Products.Product_Name IN ('Widget', 'Gadget')
GROUP BY
    Customer.Customer_name;

----8 Write a query to retrieve the names of the products that have been ordered
--by at least one customer, along with the total quantity of each product ordered.
SELECT
    Products.Product_Name,
    SUM(Orders.Quantity) AS total_quantity_ordered
FROM
    Products 
JOIN
    Orders  ON Products.Products_id = Orders.Products_id
GROUP BY
    Products.Product_Name
HAVING
    SUM(Orders.Quantity) >= 1;

--(9)Write a query to retrieve the names of the customers who have placed the most orders, 
--along with the total number of orders placed by each customer.
   SELECT
    Products.Product_Name,
    SUM(Orders.Quantity) AS total_quantity_ordered
FROM
    Products 
JOIN
    Orders  ON Products.Products_id = Orders.Products_id
GROUP BY
    Products.Product_Name
HAVING
    SUM(Orders.Quantity) >= 1;

--10 Write a query to retrieve the names of the products that have been ordered the most, 
--along with the total quantity of each product ordered.
SELECT
    Products.Product_Name,
    SUM(Orders.Quantity) AS total_quantity_ordered
FROM
    Products 
JOIN
    Orders  ON Products.Products_id = Orders.Products_id
GROUP BY
    Products.Product_Name
ORDER BY
    total_quantity_ordered DESC;

--11 Write a query to retrieve the names of the customers who have placed an order on 
--every day of the week, along with the total number of orders placed by each customer.

SELECT
    Customer.Customer_Name,
    COUNT(DISTINCT Orders.OrderDate) AS total_days_ordered
FROM
    Customer 
JOIN
    Orders ON Customer.Customer_id = Orders.Customer_id
GROUP BY
    Customer.Customer_Name
HAVING
    COUNT(DISTINCT Orders.OrderDate) = 7;






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
			   (3, 'Alcholic', '1990', 15.50),
			   (4, 'Alcoholic', '1990', 40.0),
		       (5, 'Non-Alcoholic', '1986', 30.00),
		       (6, 'Alcoholic', '1998', 10.28),
		       (7, 'Non-Alcoholic', '2021', 0.0),
		       (8, 'Alcoholic', '2015', 6.55),
		       (9, 'Alcoholic', '2018', 5.25),
		       (10, 'Non-Alcoholic', '2022', 0.0),
		       (11, 'Non-Alcoholic', '2024', 0.0),
		       (12, 'Alcoholic', '2019', 12.0),
		       (13, 'Alcoholic', '2012', 38.00),
		       (14, 'Non-Alcoholic', '2023', 0.0),
		       (15, 'Alcoholic', '1995', 15.7),
		       (16, 'Alcoholic', '1993', 20.0),
		       (17, 'Alcoholic', '1999', 40.0),
		       (18, 'Non-Alcoholic', '1986', 30.00),
		       (19, 'Alcoholic', '1998', 10.28),
		       (20, 'Non-Alcoholic', '2021', 0.0),
		       (21, 'Alcoholic', '2015', 6.55),
		       (22, 'Alcoholic', '2018', 5.25),
		       (23, 'Non-Alcoholic', '2002', 0.0),
		       (24, 'Non-Alcoholic', '2014', 0.0),
		       (25, 'Alcoholic', '2019', 12.0),
		       (26, 'Alcoholic', '2012', 38.00),
		       (27, 'Non-Alcoholic', '2018', 0.0),
		       (28, 'Alcoholic', '1996', 15.7),
		       (29, 'Alcoholic', '1982', 20.0),
		       (30, 'Alcoholic', '1990', 40.0);
		  
INSERT INTO Harvest(NumP, Quantity)
          VALUES(1, 800),
		        (2, 500),
				(3, 350),
				 (4, 450),
		         (5, 750),
		         (6, 800),
		         (7, 250),
		         (8, 600),
		         (9, 360),
		         (10, 700),
		         (11, 800),
		         (12, 500),
		         (13, 350),
		         (14, 450),
		         (15, 750),
		         (16, 800),
		         (17, 250),
		         (18, 600),
		         (19, 360),
		         (20, 700),
		         (21, 800),
		         (22, 500),
		         (23, 350),
		         (24, 450),
		         (25, 750),
		         (26, 800),
		         (27, 250),
		         (28, 600),
		         (29, 360),
		         (30, 700);


INSERT INTO Producer(NumP, NumW, FirstName, LastName, Region)
           VALUES(001, 1,'TUNDE', 'BOROKINNI', 'TINUS'),
		         (002, 2,'PRAISE', 'OGOOLUWA', 'SFAX'),
				 (003, 3,'DIMEJI', 'SALIU', 'SOUSSE'),
				 (004, 4,'BODE', 'ADARAMOYE', 'ETTADHAMEN'),
				 (005, 5, 'Haruna', 'Ishola', 'Sousse'),
		         (006, 6, 'Jacob', 'yobo', 'Zarzis'),
		         (007, 7, 'Musa', 'Hassan', 'Tunis'),
		         (008, 8, 'David', 'Bechkam', 'Sousse'),
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
		         (019, 19, 'Wizid', 'Bakare', 'Tozeur'),
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
		         (030, 30, 'Gaius', 'Ade', 'Sousse');

--Give the list of the producers.
SELECT * FROM Producer

--Give the list of producers sorted by name.
SELECT  FirstName LastName FROM Producer
ORDER BY FirstName ASC

--Give the list of the producers of Sousse.
SELECT * FROM Producer
WHERE Region = 'Sousse'

--Calculate the total quantity of wine produced having the number 12.
SELECT SUM(Quantity) AS Total_Quantity FROM Harvest
WHERE NumW = 12

--Calculate the quantity of wine produced by category.
SELECT SUM(Harvest.Quantity) AS Total_Quantity
FROM Harvest
JOIN Wine  ON Wine.NumW = Harvest.NumW

--Which producers in the Sousse region have harvested at least one wine in quantities greater than 300 liters? We want the names and first names of the producers, sorted in alphabetical order.
SELECT
    Producer.FirstName, Producer.LastName 
FROM
    Producer
JOIN
    Harvest  ON Harvest.NumW = Producer.NumW
WHERE Harvest.Quantity > 300
ORDER BY Producer.FirstName ASC

--List the wine numbers that have a degree greater than 12 and that have been produced by producer number 24.
SELECT * FROM Wine
WHERE Degree > 12





