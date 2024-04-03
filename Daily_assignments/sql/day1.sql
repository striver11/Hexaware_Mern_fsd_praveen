create database ShoppingCartDb;
use ShoppingCartDb;

CREATE TABLE Products (
    ProductId INT PRIMARY KEY,
    Name VARCHAR(255) NOT NULL,
    QuantityInStock INT NOT NULL default 0,
    UnitPrice DECIMAL(10,2) NOT NULL CHECK (UnitPrice > 0),
    Category VARCHAR(255) NOT NULL
);

CREATE TABLE Users (
    UserId INT PRIMARY KEY,
    UserName VARCHAR(255) not null,
    Password VARCHAR(255) NOT NULL,
    ContactNumber VARCHAR(20) not null,
    Address VARCHAR(255) NOT NULL	
);

CREATE TABLE Cart (
    CartId INT PRIMARY KEY,
    ProductId INT,
    Quantity INT NOT NULL CHECK (Quantity > 0),
    UserId INT NOT NULL,
    FOREIGN KEY (ProductId) REFERENCES Products(ProductId),
    FOREIGN KEY (UserId) REFERENCES Users(UserId)
);

CREATE TABLE Orders (
    OrderId INT PRIMARY KEY,
    CartId INT NOT NULL,
    OrderDate DATE NOT NULL,
    UserId INT,
    FOREIGN KEY (CartId) REFERENCES Cart(CartId),
    FOREIGN KEY (UserId) REFERENCES Users(UserId)
);

-- 2.  Insert 5  records in each table. 
-- 	 
-- 	a.  Try to insert valid and invalid records in the above tables.

INSERT INTO Users (UserId, UserName, Password, ContactNumber, Address)
VALUES
    (1, 'Aarav Kumar', 'password123', '9876543210', '123 Street, City, State, India'),
    (2, 'Aisha Patel', 'abc@123', '9876543211', '456 Road, City, State, India'),
    (3, 'Arun Singh', 'qwerty', '9876543212', '789 Avenue, City, State, India'),
    (4, 'Neha Sharma', 'userpass', '9876543213', '987 Lane, City, State, India'),
    (5, 'Rajesh Gupta', 'mypassword', '9876543214', '654 Boulevard, City, State, India');



INSERT INTO Products (ProductId, Name, QuantityInStock, UnitPrice, Category)
VALUES
    (1, 'TV', 10, 50000.00, 'Electronics'),
    (2, 'Laptop', 15, 80000.00, 'Electronics'),
    (3, 'Mobile', 20, 8000.00, 'Electronics'),
    (4, 'Saree', 30, 1000.00, 'Clothing'),
    (5, 'Sandals', 25, 500.00, 'Footwear');

-- c.  Verify that all constrains are working properly-- 
INSERT INTO Products values (6, 'SNEAKERS', 0, 500.00, 'Footwear'); 
INSERT INTO Products values (7, 'Sandals', 25, 0.00, 'Footwear');    

INSERT INTO Cart (CartId, ProductId, Quantity, UserId)
VALUES
    (1, 1, 1, 1),
    (2, 3, 2, 2),
    (3, 4, 3, 3),
    (4, 2, 1, 4),
    (5, 5, 2, 5);
-- 2.c.  Verify that all constrains are working properly. 
INSERT INTO Cart VALUES (6, 5, 0, 4);    

INSERT INTO Orders (OrderId, CartId, OrderDate, UserId)
VALUES
    (1, 1, '2024-04-03', 1),
    (2, 2, '2024-04-03', 2),
    (3, 3, '2024-04-03', 3),
    (4, 4, '2024-04-03', 4),
    (5, 5, '2024-04-03', 5);


-- 2. b.  Try to verify with delete cascade and without delete cascade. 
delete from orders where orderid=5;

select * from orders;

-- 3.  Write the select queries on the above tables for the following requirements:

-- 	 i.  On Product Table  
-- 			a.   Display all Products
SELECT * FROM PRODUCTS;

-- 			b.   Display Products belongs to particular Category

SELECT * FROM PRODUCTS WHERE CATEGORY='CLOTHING';
-- 			c.   Display out of stock products (means quantity is zero)
SELECT PRODUCTID,NAME,QuantityInStock FROM PRODUCTS WHERE QuantityInStock=0;
-- 			d.  Display the products which price between 1000 to 10000 
SELECT * FROM PRODUCTS
WHERE UnitPrice BETWEEN 1000 AND 10000;
-- 			e.  Display the product details based on the ProductId
SELECT * FROM PRODUCTS WHERE PRODUCTID=3;

-- 	ii.   On Cart Table:
-- 			a.  Display data based on the given CartId
SELECT * FROM 
CART c
INNER JOIN PRODUCTS P ON C.PRODUCTiD=P.PRODUCTiD
INNER JOIN USERS U ON C.USERID=U.USERID;
-- 			b.  Check is there any products added in Cart based on the ProductId

SELECT * FROM PRODUCTS WHERE PRODUCTID IN(
SELECT PRODUCTID FROM CART
WHERE PRODUCTID=1);
		
-- iii.  On Orders table
-- 			
-- 		a.  Display OrderDetails based on OrderId
SELECT * FROM ORDERS
WHERE ORDERID=1;
-- 		b.  Display OrderDetails based on UserId
SELECT * FROM ORDERS
WHERE USERID=1;
-- 		b.  Display OrderDetails based on OrderDate	
SELECT * FROM ORDERS 
WHERE ORDERdATE LIKE '2024-04-03';






SELECT * FROM PRODUCTS;
SHOW CREATE TABLE Cart;


-- DROP TABLE Products;
-- DROP TABLE Users;
-- DROP TABLE Cart ;
-- DROP TABLE Orders;
