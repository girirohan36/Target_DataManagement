BEGIN
   EXECUTE IMMEDIATE 'DROP TABLE OrderDetails CASCADE CONSTRAINTS';
EXCEPTION
   WHEN OTHERS THEN NULL;
END;
/
BEGIN
   EXECUTE IMMEDIATE 'DROP TABLE Product CASCADE CONSTRAINTS';
EXCEPTION
   WHEN OTHERS THEN NULL;
END;
/
BEGIN
   EXECUTE IMMEDIATE 'DROP TABLE Category CASCADE CONSTRAINTS';
EXCEPTION
   WHEN OTHERS THEN NULL;
END;
/
BEGIN
   EXECUTE IMMEDIATE 'DROP TABLE Inventory CASCADE CONSTRAINTS';
EXCEPTION
   WHEN OTHERS THEN NULL;
END;
/
BEGIN
   EXECUTE IMMEDIATE 'DROP TABLE Orders CASCADE CONSTRAINTS';
EXCEPTION
   WHEN OTHERS THEN NULL;
END;
/
BEGIN
   EXECUTE IMMEDIATE 'DROP TABLE Customer CASCADE CONSTRAINTS';
EXCEPTION
   WHEN OTHERS THEN NULL;
END;
/
BEGIN
   EXECUTE IMMEDIATE 'DROP TABLE Shipment CASCADE CONSTRAINTS';
EXCEPTION
   WHEN OTHERS THEN NULL;
END;
/

-- Create tables


CREATE TABLE Customer (
  CustomerID NUMBER PRIMARY KEY,
  CustomerName VARCHAR(30),
  Address VARCHAR(60),
  Email VARCHAR(30),
  MobileNumber VARCHAR(15)
);

CREATE TABLE Orders (
  OrderID NUMBER PRIMARY KEY,
  OrderDate DATE,
  DeliveryDate DATE,
  CustomerID NUMBER,
  EmployeeID NUMBER,
  PaymentID NUMBER,
  CONSTRAINT FK_Orders_Customer FOREIGN KEY (CustomerID) REFERENCES Customer(CustomerID)
);


CREATE TABLE Inventory (
  InventoryID NUMBER PRIMARY KEY,
  Quantity NUMBER,
  Unit VARCHAR(10)
);

CREATE TABLE Category (
  CategoryID NUMBER PRIMARY KEY,
  CategoryName VARCHAR(30),
  SupplierID NUMBER
);

CREATE TABLE Product (
  ProductID NUMBER PRIMARY KEY,
  ProductName VARCHAR(30),
  ProductDescription VARCHAR(60),
  Price FLOAT,
  CategoryID NUMBER,
  InventoryID NUMBER,
  OrderID NUMBER,
  CONSTRAINT FK_Product_Category FOREIGN KEY (CategoryID) REFERENCES Category(CategoryID),
  CONSTRAINT FK_Product_Inventory FOREIGN KEY (InventoryID) REFERENCES Inventory(InventoryID)
);

CREATE TABLE OrderDetails (
  OrderDetailID NUMBER PRIMARY KEY,
  OrderID NUMBER,
  ProductID NUMBER,
  Price FLOAT,
  CONSTRAINT FK_OrderDetails_Order FOREIGN KEY (OrderID) REFERENCES Orders(OrderID),
  CONSTRAINT FK_OrderDetails_Product FOREIGN KEY (ProductID) REFERENCES Product(ProductID)
);



CREATE TABLE Shipment (
  ShipmentID NUMBER PRIMARY KEY,
  ShipmentDate DATE,
  OrderID NUMBER,
  CONSTRAINT FK_Shipment_Order FOREIGN KEY (OrderID) REFERENCES Orders(OrderID)
);
-- inserting data 


INSERT INTO Customer (CustomerID, CustomerName, Address, Email, MobileNumber) 
VALUES (1, 'Alice Johnson', '123 Elm Street', 'alice.johnson@example.com', '555-1234');

INSERT INTO Customer (CustomerID, CustomerName, Address, Email, MobileNumber) 
VALUES (2, 'Bob Smith', '456 Oak Avenue', 'bob.smith@example.com', '555-5678');

INSERT INTO Customer (CustomerID, CustomerName, Address, Email, MobileNumber) 
VALUES (3, 'Charlie Brown', '789 Maple Drive', 'charlie.brown@example.com', '555-9101');

INSERT INTO Customer (CustomerID, CustomerName, Address, Email, MobileNumber) 
VALUES (4, 'Diana Prince', '321 Birch Lane', 'diana.prince@example.com', '555-1122');


INSERT INTO Orders (OrderID, OrderDate, DeliveryDate, CustomerID, EmployeeID, PaymentID) 
VALUES (1, TO_DATE('2023-12-01', 'YYYY-MM-DD'), TO_DATE('2023-12-05', 'YYYY-MM-DD'), 1, 101, 201);

INSERT INTO Orders (OrderID, OrderDate, DeliveryDate, CustomerID, EmployeeID, PaymentID) 
VALUES (2, TO_DATE('2023-12-02', 'YYYY-MM-DD'), TO_DATE('2023-12-06', 'YYYY-MM-DD'), 2, 102, 202);

INSERT INTO Orders (OrderID, OrderDate, DeliveryDate, CustomerID, EmployeeID, PaymentID) 
VALUES (3, TO_DATE('2023-12-03', 'YYYY-MM-DD'), TO_DATE('2023-12-07', 'YYYY-MM-DD'), 3, 103, 203);

INSERT INTO Orders (OrderID, OrderDate, DeliveryDate, CustomerID, EmployeeID, PaymentID) 
VALUES (4, TO_DATE('2023-12-04', 'YYYY-MM-DD'), TO_DATE('2023-12-08', 'YYYY-MM-DD'), 4, 104, 204);


INSERT INTO Inventory (InventoryID, Quantity, Unit) 
VALUES (1, 100, 'Units');

INSERT INTO Inventory (InventoryID, Quantity, Unit) 
VALUES (2, 200, 'Units');

INSERT INTO Inventory (InventoryID, Quantity, Unit) 
VALUES (3, 150, 'Units');

INSERT INTO Inventory (InventoryID, Quantity, Unit) 
VALUES (4, 250, 'Units');


INSERT INTO Category (CategoryID, CategoryName, SupplierID) 
VALUES (1, 'Electronics', 301);

INSERT INTO Category (CategoryID, CategoryName, SupplierID) 
VALUES (2, 'Home Appliances', 302);

INSERT INTO Category (CategoryID, CategoryName, SupplierID) 
VALUES (3, 'Furniture', 303);

INSERT INTO Category (CategoryID, CategoryName, SupplierID) 
VALUES (4, 'Clothing', 304);


INSERT INTO Product (ProductID, ProductName, ProductDescription, Price, CategoryID, InventoryID, OrderID) 
VALUES (1, 'Smartphone', 'Latest model smartphone', 699.99, 1, 1, 1);

INSERT INTO Product (ProductID, ProductName, ProductDescription, Price, CategoryID, InventoryID, OrderID) 
VALUES (2, 'Laptop', 'High-performance laptop', 999.99, 1, 2, 2);

INSERT INTO Product (ProductID, ProductName, ProductDescription, Price, CategoryID, InventoryID, OrderID) 
VALUES (3, 'Microwave', 'Compact microwave oven', 199.99, 2, 3, 3);

INSERT INTO Product (ProductID, ProductName, ProductDescription, Price, CategoryID, InventoryID, OrderID) 
VALUES (4, 'Sofa', 'Comfortable 3-seater sofa', 499.99, 3, 4, 4);


INSERT INTO OrderDetails (OrderDetailID, OrderID, ProductID, Price) 
VALUES (1, 1, 1, 699.99);

INSERT INTO OrderDetails (OrderDetailID, OrderID, ProductID, Price) 
VALUES (2, 2, 2, 999.99);

INSERT INTO OrderDetails (OrderDetailID, OrderID, ProductID, Price) 
VALUES (3, 3, 3, 199.99);

INSERT INTO OrderDetails (OrderDetailID, OrderID, ProductID, Price) 
VALUES (4, 4, 4, 499.99);


INSERT INTO Shipment (ShipmentID, ShipmentDate, OrderID) 
VALUES (1, TO_DATE('2023-12-06', 'YYYY-MM-DD'), 1);

INSERT INTO Shipment (ShipmentID, ShipmentDate, OrderID) 
VALUES (2, TO_DATE('2023-12-07', 'YYYY-MM-DD'), 2);

INSERT INTO Shipment (ShipmentID, ShipmentDate, OrderID) 
VALUES (3, TO_DATE('2023-12-08', 'YYYY-MM-DD'), 3);

INSERT INTO Shipment (ShipmentID, ShipmentDate, OrderID) 
VALUES (4, TO_DATE('2023-12-09', 'YYYY-MM-DD'), 4);





INSERT INTO Customer (CustomerID, CustomerName, Address, Email, MobileNumber) 
VALUES (5, 'Emma Davis', '567 Pine Street', 'emma.davis@example.com', '555-2233');

INSERT INTO Customer (CustomerID, CustomerName, Address, Email, MobileNumber) 
VALUES (6, 'Oliver Brown', '890 Cedar Avenue', 'oliver.brown@example.com', '555-3344');

INSERT INTO Customer (CustomerID, CustomerName, Address, Email, MobileNumber) 
VALUES (7, 'Sophia Wilson', '123 Birch Lane', 'sophia.wilson@example.com', '555-4455');

INSERT INTO Customer (CustomerID, CustomerName, Address, Email, MobileNumber) 
VALUES (8, 'Liam Martinez', '456 Maple Drive', 'liam.martinez@example.com', '555-5566');


INSERT INTO Orders (OrderID, OrderDate, DeliveryDate, CustomerID, EmployeeID, PaymentID) 
VALUES (5, TO_DATE('2023-12-10', 'YYYY-MM-DD'), TO_DATE('2023-12-15', 'YYYY-MM-DD'), 5, 105, 205);

INSERT INTO Orders (OrderID, OrderDate, DeliveryDate, CustomerID, EmployeeID, PaymentID) 
VALUES (6, TO_DATE('2023-12-11', 'YYYY-MM-DD'), TO_DATE('2023-12-16', 'YYYY-MM-DD'), 6, 106, 206);

INSERT INTO Orders (OrderID, OrderDate, DeliveryDate, CustomerID, EmployeeID, PaymentID) 
VALUES (7, TO_DATE('2023-12-12', 'YYYY-MM-DD'), TO_DATE('2023-12-17', 'YYYY-MM-DD'), 7, 107, 207);

INSERT INTO Orders (OrderID, OrderDate, DeliveryDate, CustomerID, EmployeeID, PaymentID) 
VALUES (8, TO_DATE('2023-12-13', 'YYYY-MM-DD'), TO_DATE('2023-12-18', 'YYYY-MM-DD'), 8, 108, 208);


INSERT INTO Inventory (InventoryID, Quantity, Unit) 
VALUES (5, 300, 'Units');

INSERT INTO Inventory (InventoryID, Quantity, Unit) 
VALUES (6, 400, 'Units');

INSERT INTO Inventory (InventoryID, Quantity, Unit) 
VALUES (7, 250, 'Units');

INSERT INTO Inventory (InventoryID, Quantity, Unit) 
VALUES (8, 350, 'Units');



INSERT INTO Category (CategoryID, CategoryName, SupplierID) 
VALUES (5, 'Toys', 305);

INSERT INTO Category (CategoryID, CategoryName, SupplierID) 
VALUES (6, 'Books', 306);

INSERT INTO Category (CategoryID, CategoryName, SupplierID) 
VALUES (7, 'Beauty Products', 307);

INSERT INTO Category (CategoryID, CategoryName, SupplierID) 
VALUES (8, 'Sports Equipment', 308);



INSERT INTO Product (ProductID, ProductName, ProductDescription, Price, CategoryID, InventoryID, OrderID) 
VALUES (5, 'Action Figure', 'Superhero action figure', 19.99, 5, 5, 5);

INSERT INTO Product (ProductID, ProductName, ProductDescription, Price, CategoryID, InventoryID, OrderID) 
VALUES (6, 'Fantasy Novel', 'Epic fantasy adventure novel', 14.99, 6, 6, 6);

INSERT INTO Product (ProductID, ProductName, ProductDescription, Price, CategoryID, InventoryID, OrderID) 
VALUES (7, 'Lipstick', 'Matte red lipstick', 9.99, 7, 7, 7);

INSERT INTO Product (ProductID, ProductName, ProductDescription, Price, CategoryID, InventoryID, OrderID) 
VALUES (8, 'Tennis Racket', 'Professional tennis racket', 49.99, 8, 8, 8);


INSERT INTO OrderDetails (OrderDetailID, OrderID, ProductID, Price) 
VALUES (5, 5, 5, 19.99);

INSERT INTO OrderDetails (OrderDetailID, OrderID, ProductID, Price) 
VALUES (6, 6, 6, 14.99);

INSERT INTO OrderDetails (OrderDetailID, OrderID, ProductID, Price) 
VALUES (7, 7, 7, 9.99);

INSERT INTO OrderDetails (OrderDetailID, OrderID, ProductID, Price) 
VALUES (8, 8, 8, 49.99);


INSERT INTO Shipment (ShipmentID, ShipmentDate, OrderID) 
VALUES (5, TO_DATE('2023-12-16', 'YYYY-MM-DD'), 5);

INSERT INTO Shipment (ShipmentID, ShipmentDate, OrderID) 
VALUES (6, TO_DATE('2023-12-17', 'YYYY-MM-DD'), 6);

INSERT INTO Shipment (ShipmentID, ShipmentDate, OrderID) 
VALUES (7, TO_DATE('2023-12-18', 'YYYY-MM-DD'), 7);

INSERT INTO Shipment (ShipmentID, ShipmentDate, OrderID) 
VALUES (8, TO_DATE('2023-12-19', 'YYYY-MM-DD'), 8);


---------

INSERT INTO Customer (CustomerID, CustomerName, Address, Email, MobileNumber) 
VALUES (9, 'Noah Clark', '789 Birch Street', 'noah.clark@example.com', '555-6677');

INSERT INTO Customer (CustomerID, CustomerName, Address, Email, MobileNumber) 
VALUES (10, 'Mia Anderson', '567 Oak Avenue', 'mia.anderson@example.com', '555-7788');

INSERT INTO Customer (CustomerID, CustomerName, Address, Email, MobileNumber) 
VALUES (11, 'Ethan Lewis', '890 Maple Lane', 'ethan.lewis@example.com', '555-8899');

INSERT INTO Customer (CustomerID, CustomerName, Address, Email, MobileNumber) 
VALUES (12, 'Amelia Walker', '123 Cedar Drive', 'amelia.walker@example.com', '555-9900');

INSERT INTO Orders (OrderID, OrderDate, DeliveryDate, CustomerID, EmployeeID, PaymentID) 
VALUES (9, TO_DATE('2023-12-20', 'YYYY-MM-DD'), TO_DATE('2023-12-25', 'YYYY-MM-DD'), 9, 109, 209);

INSERT INTO Orders (OrderID, OrderDate, DeliveryDate, CustomerID, EmployeeID, PaymentID) 
VALUES (10, TO_DATE('2023-12-21', 'YYYY-MM-DD'), TO_DATE('2023-12-26', 'YYYY-MM-DD'), 10, 110, 210);

INSERT INTO Orders (OrderID, OrderDate, DeliveryDate, CustomerID, EmployeeID, PaymentID) 
VALUES (11, TO_DATE('2023-12-22', 'YYYY-MM-DD'), TO_DATE('2023-12-27', 'YYYY-MM-DD'), 11, 111, 211);

INSERT INTO Orders (OrderID, OrderDate, DeliveryDate, CustomerID, EmployeeID, PaymentID) 
VALUES (12, TO_DATE('2023-12-23', 'YYYY-MM-DD'), TO_DATE('2023-12-28', 'YYYY-MM-DD'), 12, 112, 212);

INSERT INTO Inventory (InventoryID, Quantity, Unit) 
VALUES (9, 500, 'Units');

INSERT INTO Inventory (InventoryID, Quantity, Unit) 
VALUES (10, 300, 'Units');

INSERT INTO Inventory (InventoryID, Quantity, Unit) 
VALUES (11, 400, 'Units');

INSERT INTO Inventory (InventoryID, Quantity, Unit) 
VALUES (12, 350, 'Units');

INSERT INTO Category (CategoryID, CategoryName, SupplierID) 
VALUES (9, 'Furniture', 309);

INSERT INTO Category (CategoryID, CategoryName, SupplierID) 
VALUES (10, 'Clothing', 310);

INSERT INTO Category (CategoryID, CategoryName, SupplierID) 
VALUES (11, 'Food', 311);

INSERT INTO Category (CategoryID, CategoryName, SupplierID) 
VALUES (12, 'Stationery', 312);


INSERT INTO Product (ProductID, ProductName, ProductDescription, Price, CategoryID, InventoryID, OrderID) 
VALUES (9, 'Office Chair', 'Ergonomic office chair', 149.99, 9, 9, 9);

INSERT INTO Product (ProductID, ProductName, ProductDescription, Price, CategoryID, InventoryID, OrderID) 
VALUES (10, 'Winter Coat', 'Warm winter coat', 199.99, 10, 10, 10);

INSERT INTO Product (ProductID, ProductName, ProductDescription, Price, CategoryID, InventoryID, OrderID) 
VALUES (11, 'Organic Pasta', '100% organic wheat pasta', 5.99, 11, 11, 11);

INSERT INTO Product (ProductID, ProductName, ProductDescription, Price, CategoryID, InventoryID, OrderID) 
VALUES (12, 'Notebook', 'Hardcover ruled notebook', 12.99, 12, 12, 12);


INSERT INTO OrderDetails (OrderDetailID, OrderID, ProductID, Price) 
VALUES (9, 9, 9, 149.99);

INSERT INTO OrderDetails (OrderDetailID, OrderID, ProductID, Price) 
VALUES (10, 10, 10, 199.99);

INSERT INTO OrderDetails (OrderDetailID, OrderID, ProductID, Price) 
VALUES (11, 11, 11, 5.99);

INSERT INTO OrderDetails (OrderDetailID, OrderID, ProductID, Price) 
VALUES (12, 12, 12, 12.99);


INSERT INTO Shipment (ShipmentID, ShipmentDate, OrderID) 
VALUES (9, TO_DATE('2023-12-26', 'YYYY-MM-DD'), 9);

INSERT INTO Shipment (ShipmentID, ShipmentDate, OrderID) 
VALUES (10, TO_DATE('2023-12-27', 'YYYY-MM-DD'), 10);

INSERT INTO Shipment (ShipmentID, ShipmentDate, OrderID) 
VALUES (11, TO_DATE('2023-12-28', 'YYYY-MM-DD'), 11);

INSERT INTO Shipment (ShipmentID, ShipmentDate, OrderID) 
VALUES (12, TO_DATE('2023-12-29', 'YYYY-MM-DD'), 12);

-------


INSERT INTO Customer (CustomerID, CustomerName, Address, Email, MobileNumber) 
VALUES (13, 'Liam Evans', '345 Pine Street', 'liam.evans@example.com', '555-1010');

INSERT INTO Customer (CustomerID, CustomerName, Address, Email, MobileNumber) 
VALUES (14, 'Sophia Martinez', '678 Cedar Avenue', 'sophia.martinez@example.com', '555-2020');

INSERT INTO Customer (CustomerID, CustomerName, Address, Email, MobileNumber) 
VALUES (15, 'Olivia Thomas', '123 Birch Lane', 'olivia.thomas@example.com', '555-3030');

INSERT INTO Customer (CustomerID, CustomerName, Address, Email, MobileNumber) 
VALUES (16, 'Lucas Wright', '456 Maple Drive', 'lucas.wright@example.com', '555-4040');

INSERT INTO Customer (CustomerID, CustomerName, Address, Email, MobileNumber) 
VALUES (17, 'Emma Hall', '789 Oak Court', 'emma.hall@example.com', '555-5050');

INSERT INTO Customer (CustomerID, CustomerName, Address, Email, MobileNumber) 
VALUES (18, 'Mason Clark', '890 Elm Circle', 'mason.clark@example.com', '555-6060');

INSERT INTO Customer (CustomerID, CustomerName, Address, Email, MobileNumber) 
VALUES (19, 'Isabella Scott', '567 Redwood Road', 'isabella.scott@example.com', '555-7070');

INSERT INTO Customer (CustomerID, CustomerName, Address, Email, MobileNumber) 
VALUES (20, 'James Hill', '234 Walnut Blvd', 'james.hill@example.com', '555-8080');


INSERT INTO Orders (OrderID, OrderDate, DeliveryDate, CustomerID, EmployeeID, PaymentID) 
VALUES (13, TO_DATE('2023-12-24', 'YYYY-MM-DD'), TO_DATE('2023-12-30', 'YYYY-MM-DD'), 13, 113, 213);

INSERT INTO Orders (OrderID, OrderDate, DeliveryDate, CustomerID, EmployeeID, PaymentID) 
VALUES (14, TO_DATE('2023-12-25', 'YYYY-MM-DD'), TO_DATE('2023-12-31', 'YYYY-MM-DD'), 14, 114, 214);

INSERT INTO Orders (OrderID, OrderDate, DeliveryDate, CustomerID, EmployeeID, PaymentID) 
VALUES (15, TO_DATE('2023-12-26', 'YYYY-MM-DD'), TO_DATE('2024-01-02', 'YYYY-MM-DD'), 15, 115, 215);

INSERT INTO Orders (OrderID, OrderDate, DeliveryDate, CustomerID, EmployeeID, PaymentID) 
VALUES (16, TO_DATE('2023-12-27', 'YYYY-MM-DD'), TO_DATE('2024-01-03', 'YYYY-MM-DD'), 16, 116, 216);

INSERT INTO Orders (OrderID, OrderDate, DeliveryDate, CustomerID, EmployeeID, PaymentID) 
VALUES (17, TO_DATE('2023-12-28', 'YYYY-MM-DD'), TO_DATE('2024-01-04', 'YYYY-MM-DD'), 17, 117, 217);

INSERT INTO Orders (OrderID, OrderDate, DeliveryDate, CustomerID, EmployeeID, PaymentID) 
VALUES (18, TO_DATE('2023-12-29', 'YYYY-MM-DD'), TO_DATE('2024-01-05', 'YYYY-MM-DD'), 18, 118, 218);

INSERT INTO Orders (OrderID, OrderDate, DeliveryDate, CustomerID, EmployeeID, PaymentID) 
VALUES (19, TO_DATE('2023-12-30', 'YYYY-MM-DD'), TO_DATE('2024-01-06', 'YYYY-MM-DD'), 19, 119, 219);

INSERT INTO Orders (OrderID, OrderDate, DeliveryDate, CustomerID, EmployeeID, PaymentID) 
VALUES (20, TO_DATE('2023-12-31', 'YYYY-MM-DD'), TO_DATE('2024-01-07', 'YYYY-MM-DD'), 20, 120, 220);


INSERT INTO Inventory (InventoryID, Quantity, Unit) 
VALUES (13, 450, 'Units');

INSERT INTO Inventory (InventoryID, Quantity, Unit) 
VALUES (14, 320, 'Units');

INSERT INTO Inventory (InventoryID, Quantity, Unit) 
VALUES (15, 380, 'Units');

INSERT INTO Inventory (InventoryID, Quantity, Unit) 
VALUES (16, 300, 'Units');

INSERT INTO Inventory (InventoryID, Quantity, Unit) 
VALUES (17, 270, 'Units');

INSERT INTO Inventory (InventoryID, Quantity, Unit) 
VALUES (18, 500, 'Units');

INSERT INTO Inventory (InventoryID, Quantity, Unit) 
VALUES (19, 600, 'Units');

INSERT INTO Inventory (InventoryID, Quantity, Unit) 
VALUES (20, 350, 'Units');


INSERT INTO Category (CategoryID, CategoryName, SupplierID) 
VALUES (13, 'Sports Equipment', 313);

INSERT INTO Category (CategoryID, CategoryName, SupplierID) 
VALUES (14, 'Toys', 314);

INSERT INTO Category (CategoryID, CategoryName, SupplierID) 
VALUES (15, 'Books', 315);

INSERT INTO Category (CategoryID, CategoryName, SupplierID) 
VALUES (16, 'Music', 316);

INSERT INTO Category (CategoryID, CategoryName, SupplierID) 
VALUES (17, 'Movies', 317);

INSERT INTO Category (CategoryID, CategoryName, SupplierID) 
VALUES (18, 'Gaming', 318);

INSERT INTO Category (CategoryID, CategoryName, SupplierID) 
VALUES (19, 'Kitchenware', 319);

INSERT INTO Category (CategoryID, CategoryName, SupplierID) 
VALUES (20, 'Appliances', 320);


INSERT INTO Product (ProductID, ProductName, ProductDescription, Price, CategoryID, InventoryID, OrderID) 
VALUES (13, 'Football', 'Standard size football', 29.99, 13, 13, 13);

INSERT INTO Product (ProductID, ProductName, ProductDescription, Price, CategoryID, InventoryID, OrderID) 
VALUES (14, 'Toy Car', 'Remote-controlled car', 49.99, 14, 14, 14);

INSERT INTO Product (ProductID, ProductName, ProductDescription, Price, CategoryID, InventoryID, OrderID) 
VALUES (15, 'Fiction Novel', 'Bestselling fiction novel', 19.99, 15, 15, 15);

INSERT INTO Product (ProductID, ProductName, ProductDescription, Price, CategoryID, InventoryID, OrderID) 
VALUES (16, 'Guitar', 'Acoustic guitar', 129.99, 16, 16, 16);

INSERT INTO Product (ProductID, ProductName, ProductDescription, Price, CategoryID, InventoryID, OrderID) 
VALUES (17, 'DVD Movie', 'Latest blockbuster movie', 14.99, 17, 17, 17);

INSERT INTO Product (ProductID, ProductName, ProductDescription, Price, CategoryID, InventoryID, OrderID) 
VALUES (18, 'Video Game', 'Popular action game', 59.99, 18, 18, 18);

INSERT INTO Product (ProductID, ProductName, ProductDescription, Price, CategoryID, InventoryID, OrderID) 
VALUES (19, 'Knife Set', 'Stainless steel knives', 49.99, 19, 19, 19);

INSERT INTO Product (ProductID, ProductName, ProductDescription, Price, CategoryID, InventoryID, OrderID) 
VALUES (20, 'Microwave', '700W compact microwave', 79.99, 20, 20, 20);



INSERT INTO OrderDetails (OrderDetailID, OrderID, ProductID, Price) 
VALUES (13, 13, 13, 29.99);

INSERT INTO OrderDetails (OrderDetailID, OrderID, ProductID, Price) 
VALUES (14, 14, 14, 49.99);

INSERT INTO OrderDetails (OrderDetailID, OrderID, ProductID, Price) 
VALUES (15, 15, 15, 19.99);

INSERT INTO OrderDetails (OrderDetailID, OrderID, ProductID, Price) 
VALUES (16, 16, 16, 129.99);

INSERT INTO OrderDetails (OrderDetailID, OrderID, ProductID, Price) 
VALUES (17, 17, 17, 14.99);

INSERT INTO OrderDetails (OrderDetailID, OrderID, ProductID, Price) 
VALUES (18, 18, 18, 59.99);

INSERT INTO OrderDetails (OrderDetailID, OrderID, ProductID, Price) 
VALUES (19, 19, 19, 49.99);

INSERT INTO OrderDetails (OrderDetailID, OrderID, ProductID, Price) 
VALUES (20, 20, 20, 79.99);


INSERT INTO Shipment (ShipmentID, ShipmentDate, OrderID) 
VALUES (13, TO_DATE('2023-12-30', 'YYYY-MM-DD'), 13);

INSERT INTO Shipment (ShipmentID, ShipmentDate, OrderID) 
VALUES (14, TO_DATE('2023-12-31', 'YYYY-MM-DD'), 14);

INSERT INTO Shipment (ShipmentID, ShipmentDate, OrderID) 
VALUES (15, TO_DATE('2024-01-02', 'YYYY-MM-DD'), 15);

INSERT INTO Shipment (ShipmentID, ShipmentDate, OrderID) 
VALUES (16, TO_DATE('2024-01-03', 'YYYY-MM-DD'), 16);

INSERT INTO Shipment (ShipmentID, ShipmentDate, OrderID) 
VALUES (17, TO_DATE('2024-01-04', 'YYYY-MM-DD'), 17);

INSERT INTO Shipment (ShipmentID, ShipmentDate, OrderID) 
VALUES (18, TO_DATE('2024-01-05', 'YYYY-MM-DD'), 18);

INSERT INTO Shipment (ShipmentID, ShipmentDate, OrderID) 
VALUES (19, TO_DATE('2024-01-06', 'YYYY-MM-DD'), 19);

INSERT INTO Shipment (ShipmentID, ShipmentDate, OrderID) 
VALUES (20, TO_DATE('2024-01-07', 'YYYY-MM-DD'), 20);

----


INSERT INTO Customer (CustomerID, CustomerName, Address, Email, MobileNumber) 
VALUES (21, 'Ethan Brooks', '555 Pine Street', 'ethan.brooks@example.com', '555-1212');

INSERT INTO Customer (CustomerID, CustomerName, Address, Email, MobileNumber) 
VALUES (23, 'Ava Nelson', '789 Birch Avenue', 'ava.nelson@example.com', '555-2323');

INSERT INTO Customer (CustomerID, CustomerName, Address, Email, MobileNumber) 
VALUES (24, 'William Foster', '101 Oak Lane', 'william.foster@example.com', '555-3434');

INSERT INTO Customer (CustomerID, CustomerName, Address, Email, MobileNumber) 
VALUES (25, 'Charlotte Perez', '202 Cedar Drive', 'charlotte.perez@example.com', '555-4545');

INSERT INTO Customer (CustomerID, CustomerName, Address, Email, MobileNumber) 
VALUES (31, 'Benjamin Collins', '333 Maple Blvd', 'benjamin.collins@example.com', '555-5151');

INSERT INTO Customer (CustomerID, CustomerName, Address, Email, MobileNumber) 
VALUES (33, 'Ella Carter', '456 Elm Circle', 'ella.carter@example.com', '555-6262');

INSERT INTO Customer (CustomerID, CustomerName, Address, Email, MobileNumber) 
VALUES (34, 'Noah Turner', '789 Walnut Road', 'noah.turner@example.com', '555-7373');


INSERT INTO Orders (OrderID, OrderDate, DeliveryDate, CustomerID, EmployeeID, PaymentID) 
VALUES (21, TO_DATE('2024-01-08', 'YYYY-MM-DD'), TO_DATE('2024-01-14', 'YYYY-MM-DD'), 21, 121, 221);

INSERT INTO Orders (OrderID, OrderDate, DeliveryDate, CustomerID, EmployeeID, PaymentID) 
VALUES (23, TO_DATE('2024-01-10', 'YYYY-MM-DD'), TO_DATE('2024-01-16', 'YYYY-MM-DD'), 23, 123, 223);

INSERT INTO Orders (OrderID, OrderDate, DeliveryDate, CustomerID, EmployeeID, PaymentID) 
VALUES (24, TO_DATE('2024-01-11', 'YYYY-MM-DD'), TO_DATE('2024-01-17', 'YYYY-MM-DD'), 24, 124, 224);

INSERT INTO Orders (OrderID, OrderDate, DeliveryDate, CustomerID, EmployeeID, PaymentID) 
VALUES (25, TO_DATE('2024-01-12', 'YYYY-MM-DD'), TO_DATE('2024-01-18', 'YYYY-MM-DD'), 25, 125, 225);

INSERT INTO Orders (OrderID, OrderDate, DeliveryDate, CustomerID, EmployeeID, PaymentID) 
VALUES (31, TO_DATE('2024-01-18', 'YYYY-MM-DD'), TO_DATE('2024-01-24', 'YYYY-MM-DD'), 31, 131, 231);

INSERT INTO Orders (OrderID, OrderDate, DeliveryDate, CustomerID, EmployeeID, PaymentID) 
VALUES (33, TO_DATE('2024-01-20', 'YYYY-MM-DD'), TO_DATE('2024-01-26', 'YYYY-MM-DD'), 33, 133, 233);

INSERT INTO Orders (OrderID, OrderDate, DeliveryDate, CustomerID, EmployeeID, PaymentID) 
VALUES (34, TO_DATE('2024-01-21', 'YYYY-MM-DD'), TO_DATE('2024-01-27', 'YYYY-MM-DD'), 34, 134, 234);



INSERT INTO Inventory (InventoryID, Quantity, Unit) 
VALUES (21, 400, 'Units');

INSERT INTO Inventory (InventoryID, Quantity, Unit) 
VALUES (23, 300, 'Units');

INSERT INTO Inventory (InventoryID, Quantity, Unit) 
VALUES (24, 450, 'Units');

INSERT INTO Inventory (InventoryID, Quantity, Unit) 
VALUES (25, 500, 'Units');

INSERT INTO Inventory (InventoryID, Quantity, Unit) 
VALUES (31, 350, 'Units');

INSERT INTO Inventory (InventoryID, Quantity, Unit) 
VALUES (33, 600, 'Units');

INSERT INTO Inventory (InventoryID, Quantity, Unit) 
VALUES (34, 700, 'Units');


INSERT INTO Category (CategoryID, CategoryName, SupplierID) 
VALUES (21, 'Electronics', 321);

INSERT INTO Category (CategoryID, CategoryName, SupplierID) 
VALUES (23, 'Clothing', 323);

INSERT INTO Category (CategoryID, CategoryName, SupplierID) 
VALUES (24, 'Furniture', 324);

INSERT INTO Category (CategoryID, CategoryName, SupplierID) 
VALUES (25, 'Books', 325);

INSERT INTO Category (CategoryID, CategoryName, SupplierID) 
VALUES (31, 'Home Decor', 331);

INSERT INTO Category (CategoryID, CategoryName, SupplierID) 
VALUES (33, 'Beauty Products', 333);

INSERT INTO Category (CategoryID, CategoryName, SupplierID) 
VALUES (34, 'Gaming', 334);


INSERT INTO Product (ProductID, ProductName, ProductDescription, Price, CategoryID, InventoryID, OrderID) 
VALUES (21, 'Smartphone', 'Latest model with advanced features', 799.99, 21, 21, 21);

INSERT INTO Product (ProductID, ProductName, ProductDescription, Price, CategoryID, InventoryID, OrderID) 
VALUES (23, 'T-Shirt', 'Cotton t-shirt in various sizes', 19.99, 23, 23, 23);

INSERT INTO Product (ProductID, ProductName, ProductDescription, Price, CategoryID, InventoryID, OrderID) 
VALUES (24, 'Sofa', 'Comfortable 3-seater sofa', 599.99, 24, 24, 24);

INSERT INTO Product (ProductID, ProductName, ProductDescription, Price, CategoryID, InventoryID, OrderID) 
VALUES (25, 'Mystery Novel', 'Bestselling mystery book', 14.99, 25, 25, 25);

INSERT INTO Product (ProductID, ProductName, ProductDescription, Price, CategoryID, InventoryID, OrderID) 
VALUES (31, 'Wall Clock', 'Minimalist design wall clock', 49.99, 31, 31, 31);

INSERT INTO Product (ProductID, ProductName, ProductDescription, Price, CategoryID, InventoryID, OrderID) 
VALUES (33, 'Lipstick', 'Long-lasting matte lipstick', 12.99, 33, 33, 33);

INSERT INTO Product (ProductID, ProductName, ProductDescription, Price, CategoryID, InventoryID, OrderID) 
VALUES (34, 'Gaming Console', 'Next-gen console with 1TB storage', 499.99, 34, 34, 34);


INSERT INTO OrderDetails (OrderDetailID, OrderID, ProductID, Price) 
VALUES (21, 21, 21, 799.99);

INSERT INTO OrderDetails (OrderDetailID, OrderID, ProductID, Price) 
VALUES (23, 23, 23, 19.99);

INSERT INTO OrderDetails (OrderDetailID, OrderID, ProductID, Price) 
VALUES (24, 24, 24, 599.99);

INSERT INTO OrderDetails (OrderDetailID, OrderID, ProductID, Price) 
VALUES (25, 25, 25, 14.99);

INSERT INTO OrderDetails (OrderDetailID, OrderID, ProductID, Price) 
VALUES (31, 31, 31, 49.99);

INSERT INTO OrderDetails (OrderDetailID, OrderID, ProductID, Price) 
VALUES (33, 33, 33, 12.99);

INSERT INTO OrderDetails (OrderDetailID, OrderID, ProductID, Price) 
VALUES (34, 34, 34, 499.99);


INSERT INTO Shipment (ShipmentID, ShipmentDate, OrderID) 
VALUES (21, TO_DATE('2024-01-14', 'YYYY-MM-DD'), 21);

INSERT INTO Shipment (ShipmentID, ShipmentDate, OrderID) 
VALUES (23, TO_DATE('2024-01-16', 'YYYY-MM-DD'), 23);

INSERT INTO Shipment (ShipmentID, ShipmentDate, OrderID) 
VALUES (24, TO_DATE('2024-01-17', 'YYYY-MM-DD'), 24);

INSERT INTO Shipment (ShipmentID, ShipmentDate, OrderID) 
VALUES (25, TO_DATE('2024-01-18', 'YYYY-MM-DD'), 25);

INSERT INTO Shipment (ShipmentID, ShipmentDate, OrderID) 
VALUES (31, TO_DATE('2024-01-24', 'YYYY-MM-DD'), 31);

INSERT INTO Shipment (ShipmentID, ShipmentDate, OrderID) 
VALUES (33, TO_DATE('2024-01-26', 'YYYY-MM-DD'), 33);

INSERT INTO Shipment (ShipmentID, ShipmentDate, OrderID) 
VALUES (34, TO_DATE('2024-01-27', 'YYYY-MM-DD'), 34);


----


INSERT INTO Customer (CustomerID, CustomerName, Address, Email, MobileNumber) 
VALUES (22, 'Liam Robinson', '456 Maple Avenue', 'liam.robinson@example.com', '555-0022');

INSERT INTO Customer (CustomerID, CustomerName, Address, Email, MobileNumber) 
VALUES (26, 'Amelia White', '789 Cedar Road', 'amelia.white@example.com', '555-0026');

INSERT INTO Customer (CustomerID, CustomerName, Address, Email, MobileNumber) 
VALUES (27, 'Mason Hall', '234 Birch Lane', 'mason.hall@example.com', '555-0027');

INSERT INTO Customer (CustomerID, CustomerName, Address, Email, MobileNumber) 
VALUES (28, 'Sophia Green', '567 Elm Street', 'sophia.green@example.com', '555-0028');

INSERT INTO Customer (CustomerID, CustomerName, Address, Email, MobileNumber) 
VALUES (29, 'Logan Wright', '890 Pine Circle', 'logan.wright@example.com', '555-0029');

INSERT INTO Customer (CustomerID, CustomerName, Address, Email, MobileNumber) 
VALUES (30, 'Isabella Scott', '101 Maple Court', 'isabella.scott@example.com', '555-0030');

INSERT INTO Customer (CustomerID, CustomerName, Address, Email, MobileNumber) 
VALUES (32, 'James Evans', '202 Cedar Avenue', 'james.evans@example.com', '555-0032');



INSERT INTO Orders (OrderID, OrderDate, DeliveryDate, CustomerID, EmployeeID, PaymentID) 
VALUES (22, TO_DATE('2024-01-09', 'YYYY-MM-DD'), TO_DATE('2024-01-15', 'YYYY-MM-DD'), 22, 122, 222);

INSERT INTO Orders (OrderID, OrderDate, DeliveryDate, CustomerID, EmployeeID, PaymentID) 
VALUES (26, TO_DATE('2024-01-13', 'YYYY-MM-DD'), TO_DATE('2024-01-19', 'YYYY-MM-DD'), 26, 126, 226);

INSERT INTO Orders (OrderID, OrderDate, DeliveryDate, CustomerID, EmployeeID, PaymentID) 
VALUES (27, TO_DATE('2024-01-14', 'YYYY-MM-DD'), TO_DATE('2024-01-20', 'YYYY-MM-DD'), 27, 127, 227);

INSERT INTO Orders (OrderID, OrderDate, DeliveryDate, CustomerID, EmployeeID, PaymentID) 
VALUES (28, TO_DATE('2024-01-15', 'YYYY-MM-DD'), TO_DATE('2024-01-21', 'YYYY-MM-DD'), 28, 128, 228);

INSERT INTO Orders (OrderID, OrderDate, DeliveryDate, CustomerID, EmployeeID, PaymentID) 
VALUES (29, TO_DATE('2024-01-16', 'YYYY-MM-DD'), TO_DATE('2024-01-22', 'YYYY-MM-DD'), 29, 129, 229);

INSERT INTO Orders (OrderID, OrderDate, DeliveryDate, CustomerID, EmployeeID, PaymentID) 
VALUES (30, TO_DATE('2024-01-17', 'YYYY-MM-DD'), TO_DATE('2024-01-23', 'YYYY-MM-DD'), 30, 130, 230);

INSERT INTO Orders (OrderID, OrderDate, DeliveryDate, CustomerID, EmployeeID, PaymentID) 
VALUES (32, TO_DATE('2024-01-19', 'YYYY-MM-DD'), TO_DATE('2024-01-25', 'YYYY-MM-DD'), 32, 132, 232);




INSERT INTO Inventory (InventoryID, Quantity, Unit) 
VALUES (22, 300, 'Units');

INSERT INTO Inventory (InventoryID, Quantity, Unit) 
VALUES (26, 450, 'Units');

INSERT INTO Inventory (InventoryID, Quantity, Unit) 
VALUES (27, 400, 'Units');

INSERT INTO Inventory (InventoryID, Quantity, Unit) 
VALUES (28, 350, 'Units');

INSERT INTO Inventory (InventoryID, Quantity, Unit) 
VALUES (29, 600, 'Units');

INSERT INTO Inventory (InventoryID, Quantity, Unit) 
VALUES (30, 700, 'Units');

INSERT INTO Inventory (InventoryID, Quantity, Unit) 
VALUES (32, 550, 'Units');




INSERT INTO Category (CategoryID, CategoryName, SupplierID) 
VALUES (22, 'Toys', 322);

INSERT INTO Category (CategoryID, CategoryName, SupplierID) 
VALUES (26, 'Sports', 326);

INSERT INTO Category (CategoryID, CategoryName, SupplierID) 
VALUES (27, 'Gardening', 327);

INSERT INTO Category (CategoryID, CategoryName, SupplierID) 
VALUES (28, 'Automotive', 328);

INSERT INTO Category (CategoryID, CategoryName, SupplierID) 
VALUES (29, 'Pets', 329);

INSERT INTO Category (CategoryID, CategoryName, SupplierID) 
VALUES (30, 'Gaming', 330);

INSERT INTO Category (CategoryID, CategoryName, SupplierID) 
VALUES (32, 'Books', 332);




INSERT INTO Product (ProductID, ProductName, ProductDescription, Price, CategoryID, InventoryID, OrderID) 
VALUES (22, 'Action Figure', 'Collectible superhero figure', 29.99, 22, 22, 22);

INSERT INTO Product (ProductID, ProductName, ProductDescription, Price, CategoryID, InventoryID, OrderID) 
VALUES (26, 'Football', 'Professional-grade football', 19.99, 26, 26, 26);

INSERT INTO Product (ProductID, ProductName, ProductDescription, Price, CategoryID, InventoryID, OrderID) 
VALUES (27, 'Lawn Mower', 'Electric lawn mower', 249.99, 27, 27, 27);

INSERT INTO Product (ProductID, ProductName, ProductDescription, Price, CategoryID, InventoryID, OrderID) 
VALUES (28, 'Car Battery', 'High-performance battery', 129.99, 28, 28, 28);

INSERT INTO Product (ProductID, ProductName, ProductDescription, Price, CategoryID, InventoryID, OrderID) 
VALUES (29, 'Dog Food', 'Nutritional dog food, 10lb', 49.99, 29, 29, 29);

INSERT INTO Product (ProductID, ProductName, ProductDescription, Price, CategoryID, InventoryID, OrderID) 
VALUES (30, 'Gaming Controller', 'Ergonomic controller', 59.99, 30, 30, 30);

INSERT INTO Product (ProductID, ProductName, ProductDescription, Price, CategoryID, InventoryID, OrderID) 
VALUES (32, 'Fiction Book', 'Bestselling novel', 19.99, 32, 32, 32);




INSERT INTO OrderDetails (OrderDetailID, OrderID, ProductID, Price) 
VALUES (22, 22, 22, 29.99);

INSERT INTO OrderDetails (OrderDetailID, OrderID, ProductID, Price) 
VALUES (26, 26, 26, 19.99);

INSERT INTO OrderDetails (OrderDetailID, OrderID, ProductID, Price) 
VALUES (27, 27, 27, 249.99);

INSERT INTO OrderDetails (OrderDetailID, OrderID, ProductID, Price) 
VALUES (28, 28, 28, 129.99);

INSERT INTO OrderDetails (OrderDetailID, OrderID, ProductID, Price) 
VALUES (29, 29, 29, 49.99);

INSERT INTO OrderDetails (OrderDetailID, OrderID, ProductID, Price) 
VALUES (30, 30, 30, 59.99);

INSERT INTO OrderDetails (OrderDetailID, OrderID, ProductID, Price) 
VALUES (32, 32, 32, 19.99);




INSERT INTO Shipment (ShipmentID, ShipmentDate, OrderID) 
VALUES (22, TO_DATE('2024-01-16', 'YYYY-MM-DD'), 22);

INSERT INTO Shipment (ShipmentID, ShipmentDate, OrderID) 
VALUES (26, TO_DATE('2024-01-20', 'YYYY-MM-DD'), 26);

INSERT INTO Shipment (ShipmentID, ShipmentDate, OrderID) 
VALUES (27, TO_DATE('2024-01-21', 'YYYY-MM-DD'), 27);

INSERT INTO Shipment (ShipmentID, ShipmentDate, OrderID) 
VALUES (28, TO_DATE('2024-01-22', 'YYYY-MM-DD'), 28);

INSERT INTO Shipment (ShipmentID, ShipmentDate, OrderID) 
VALUES (29, TO_DATE('2024-01-23', 'YYYY-MM-DD'), 29);

INSERT INTO Shipment (ShipmentID, ShipmentDate, OrderID) 
VALUES (30, TO_DATE('2024-01-24', 'YYYY-MM-DD'), 30);

INSERT INTO Shipment (ShipmentID, ShipmentDate, OrderID) 
VALUES (32, TO_DATE('2024-01-26', 'YYYY-MM-DD'), 32);

---

INSERT INTO Category (CategoryID, CategoryName, SupplierID) 
VALUES (33, 'Electronics', 333);

INSERT INTO Category (CategoryID, CategoryName, SupplierID) 
VALUES (34, 'Home Appliances', 334);

INSERT INTO Category (CategoryID, CategoryName, SupplierID) 
VALUES (35, 'Furniture', 335);

INSERT INTO Category (CategoryID, CategoryName, SupplierID) 
VALUES (36, 'Clothing', 336);

INSERT INTO Category (CategoryID, CategoryName, SupplierID) 
VALUES (37, 'Beauty Products', 337);

INSERT INTO Category (CategoryID, CategoryName, SupplierID) 
VALUES (38, 'Outdoor Gear', 338);

INSERT INTO Category (CategoryID, CategoryName, SupplierID) 
VALUES (39, 'Stationery', 339);

INSERT INTO Category (CategoryID, CategoryName, SupplierID) 
VALUES (40, 'Automotive Accessories', 340);


INSERT INTO Category (CategoryID, CategoryName, SupplierID) 
VALUES (41, 'Toys & Games', 201);

INSERT INTO Category (CategoryID, CategoryName, SupplierID) 
VALUES (42, 'Sports Equipment', 202);

INSERT INTO Category (CategoryID, CategoryName, SupplierID) 
VALUES (43, 'Health & Wellness', 203);

INSERT INTO Category (CategoryID, CategoryName, SupplierID) 
VALUES (44, 'Books & Media', 204);

INSERT INTO Category (CategoryID, CategoryName, SupplierID) 
VALUES (45, 'Pet Supplies', 205);

INSERT INTO Category (CategoryID, CategoryName, SupplierID) 
VALUES (46, 'Home Improvement', 206);

INSERT INTO Category (CategoryID, CategoryName, SupplierID) 
VALUES (47, 'Automotive', 207);

INSERT INTO Category (CategoryID, CategoryName, SupplierID) 
VALUES (48, 'Office Supplies', 208);

INSERT INTO Category (CategoryID, CategoryName, SupplierID) 
VALUES (49, 'Luxury Items', 209);

INSERT INTO Category (CategoryID, CategoryName, SupplierID) 
VALUES (50, 'Travel Accessories', 210);

INSERT INTO Category (CategoryID, CategoryName, SupplierID) 
VALUES (51, 'Craft Supplies', 211);

INSERT INTO Category (CategoryID, CategoryName, SupplierID) 
VALUES (52, 'Jewelry', 212);

INSERT INTO Category (CategoryID, CategoryName, SupplierID) 
VALUES (53, 'Seasonal Products', 213);

INSERT INTO Category (CategoryID, CategoryName, SupplierID) 
VALUES (54, 'Baby Products', 214);

INSERT INTO Category (CategoryID, CategoryName, SupplierID) 
VALUES (55, 'Musical Instruments', 215);

INSERT INTO Category (CategoryID, CategoryName, SupplierID) 
VALUES (56, 'Camping Gear', 216);

INSERT INTO Category (CategoryID, CategoryName, SupplierID) 
VALUES (57, 'Outdoor Furniture', 217);

INSERT INTO Category (CategoryID, CategoryName, SupplierID) 
VALUES (58, 'Gardening Supplies', 218);

INSERT INTO Category (CategoryID, CategoryName, SupplierID) 
VALUES (59, 'Kitchenware', 219);

INSERT INTO Category (CategoryID, CategoryName, SupplierID) 
VALUES (60, 'Art Supplies', 220);


---

-- Inventory for Travel Accessories
INSERT INTO Inventory (InventoryID, Quantity, Unit) VALUES (314, 200, 'pcs'); -- Travel Pillow
INSERT INTO Inventory (InventoryID, Quantity, Unit) VALUES (315, 150, 'sets'); -- Luggage Organizer
INSERT INTO Inventory (InventoryID, Quantity, Unit) VALUES (316, 300, 'pcs'); -- Portable Charger

-- Inventory for Craft Supplies
INSERT INTO Inventory (InventoryID, Quantity, Unit) VALUES (317, 100, 'sets'); -- Acrylic Paint Set
INSERT INTO Inventory (InventoryID, Quantity, Unit) VALUES (318, 250, 'sets'); -- Knitting Needles
INSERT INTO Inventory (InventoryID, Quantity, Unit) VALUES (319, 500, 'sheets'); -- Origami Paper

-- Inventory for Jewelry
INSERT INTO Inventory (InventoryID, Quantity, Unit) VALUES (320, 50, 'pcs'); -- Gold Necklace
INSERT INTO Inventory (InventoryID, Quantity, Unit) VALUES (322, 120, 'pcs'); -- Charm Bracelet

-- Inventory for Seasonal Products
INSERT INTO Inventory (InventoryID, Quantity, Unit) VALUES (323, 400, 'boxes'); -- Fall Cookies
INSERT INTO Inventory (InventoryID, Quantity, Unit) VALUES (324, 350, 'boxes'); -- Winter Cookies
INSERT INTO Inventory (InventoryID, Quantity, Unit) VALUES (325, 100, 'sets'); -- Christmas Decorations
INSERT INTO Inventory (InventoryID, Quantity, Unit) VALUES (326, 200, 'pcs'); -- Halloween Costumes


-- Travel Accessories
INSERT INTO Product (ProductID, ProductName, ProductDescription, Price, CategoryID, InventoryID, OrderID) 
VALUES (83, 'Travel Pillow', 'Memory foam travel neck pillow', 29.99, 50, 314, NULL);

INSERT INTO Product (ProductID, ProductName, ProductDescription, Price, CategoryID, InventoryID, OrderID) 
VALUES (84, 'Luggage Organizer', 'Set of packing cubes', 19.99, 50, 315, NULL);

INSERT INTO Product (ProductID, ProductName, ProductDescription, Price, CategoryID, InventoryID, OrderID) 
VALUES (85, 'Portable Charger', '10,000mAh power bank', 34.99, 50, 316, NULL);

-- Craft Supplies
INSERT INTO Product (ProductID, ProductName, ProductDescription, Price, CategoryID, InventoryID, OrderID) 
VALUES (86, 'Acrylic Paint Set', '24 vibrant colors', 24.99, 51, 317, NULL);

INSERT INTO Product (ProductID, ProductName, ProductDescription, Price, CategoryID, InventoryID, OrderID) 
VALUES (87, 'Knitting Needles', 'Set of aluminum needles', 14.99, 51, 318, NULL);

INSERT INTO Product (ProductID, ProductName, ProductDescription, Price, CategoryID, InventoryID, OrderID) 
VALUES (88, 'Origami Paper', '50 sheets of assorted colors', 9.99, 51, 319, NULL);

-- Jewelry
INSERT INTO Product (ProductID, ProductName, ProductDescription, Price, CategoryID, InventoryID, OrderID) 
VALUES (89, 'Gold Necklace', 'Heart Locket Necklace', 199.99, 52, 320, NULL);


INSERT INTO Product (ProductID, ProductName, ProductDescription, Price, CategoryID, InventoryID, OrderID) 
VALUES (91, 'Charm Bracelet', 'Customizable charm bracelet', 49.99, 52, 322, NULL);

-- Seasonal Products
INSERT INTO Product (ProductID, ProductName, ProductDescription, Price, CategoryID, InventoryID, OrderID) 
VALUES (92, 'Fall Cookies', 'Pumpkin spice cookies', 14.99, 53, 323, NULL);

INSERT INTO Product (ProductID, ProductName, ProductDescription, Price, CategoryID, InventoryID, OrderID) 
VALUES (93, 'Winter Cookies', 'Peppermint-flavored cookies', 12.99, 53, 324, NULL);

INSERT INTO Product (ProductID, ProductName, ProductDescription, Price, CategoryID, InventoryID, OrderID) 
VALUES (94, 'Christmas Decorations', 'LED string lights and ornaments', 39.99, 53, 325, NULL);

INSERT INTO Product (ProductID, ProductName, ProductDescription, Price, CategoryID, InventoryID, OrderID) 
VALUES (95, 'Halloween Costumes', 'Princess Belle', 29.99, 53, 326, NULL);






INSERT INTO OrderDetails (OrderDetailID, OrderID, ProductID, Price) 
VALUES (35, 32, 32, 19.99);

INSERT INTO OrderDetails (OrderDetailID, OrderID, ProductID, Price) 
VALUES (36, 32, 32, 19.99);

INSERT INTO OrderDetails (OrderDetailID, OrderID, ProductID, Price) 
VALUES (37, 32, 32, 19.99);

INSERT INTO OrderDetails (OrderDetailID, OrderID, ProductID, Price) 
VALUES (38, 32, 32, 19.99);

INSERT INTO OrderDetails (OrderDetailID, OrderID, ProductID, Price) 
VALUES (39, 32, 32, 19.99);

INSERT INTO OrderDetails (OrderDetailID, OrderID, ProductID, Price) 
VALUES (40, 32, 7, 19.99);

INSERT INTO OrderDetails (OrderDetailID, OrderID, ProductID, Price) 
VALUES (41, 21, 7, 19.99);

INSERT INTO OrderDetails (OrderDetailID, OrderID, ProductID, Price) 
VALUES (42, 32, 5, 19.99);

INSERT INTO OrderDetails (OrderDetailID, OrderID, ProductID, Price) 
VALUES (43, 21, 19, 19.99);

INSERT INTO OrderDetails (OrderDetailID, OrderID, ProductID, Price) 
VALUES (44, 5, 32, 19.99);

INSERT INTO OrderDetails (OrderDetailID, OrderID, ProductID, Price) 
VALUES (45, 2, 7, 9.99);

INSERT INTO OrderDetails (OrderDetailID, OrderID, ProductID, Price) 
VALUES (46, 2, 7, 10.99);

INSERT INTO OrderDetails (OrderDetailID, OrderID, ProductID, Price) 
VALUES (47, 2, 26, 29.99);

INSERT INTO OrderDetails (OrderDetailID, OrderID, ProductID, Price) 
VALUES (48, 2, 19, 6.99);

INSERT INTO OrderDetails (OrderDetailID, OrderID, ProductID, Price) 
VALUES (49, 2, 32, 19.99);







INSERT INTO OrderDetails (OrderDetailID, OrderID, ProductID, Price) 
VALUES (50, 2, 7, 9.99);

INSERT INTO OrderDetails (OrderDetailID, OrderID, ProductID, Price) 
VALUES (51, 2, 7, 10.99);

INSERT INTO OrderDetails (OrderDetailID, OrderID, ProductID, Price) 
VALUES (52, 2, 26, 29.99);

INSERT INTO OrderDetails (OrderDetailID, OrderID, ProductID, Price) 
VALUES (53, 2, 19, 6.99);

INSERT INTO OrderDetails (OrderDetailID, OrderID, ProductID, Price) 
VALUES (54, 2, 32, 19.99);











INSERT INTO Inventory (InventoryID, Quantity, Unit) 
VALUES (324, 150, 'pcs');

INSERT INTO Inventory (InventoryID, Quantity, Unit) 
VALUES (325, 120, 'pcs');

INSERT INTO Inventory (InventoryID, Quantity, Unit) 
VALUES (326, 200, 'pcs');

INSERT INTO Inventory (InventoryID, Quantity, Unit) 
VALUES (327, 180, 'pcs');

INSERT INTO Inventory (InventoryID, Quantity, Unit) 
VALUES (328, 100, 'pcs');

INSERT INTO Inventory (InventoryID, Quantity, Unit) 
VALUES (329, 90, 'pcs');

INSERT INTO Inventory (InventoryID, Quantity, Unit) 
VALUES (330, 85, 'pcs');

INSERT INTO Inventory (InventoryID, Quantity, Unit) 
VALUES (331, 140, 'pcs');

INSERT INTO Inventory (InventoryID, Quantity, Unit) 
VALUES (332, 130, 'pcs');

INSERT INTO Inventory (InventoryID, Quantity, Unit) 
VALUES (333, 160, 'pcs');


INSERT INTO Product (ProductID, ProductName, ProductDescription, Price, CategoryID, InventoryID, OrderID) 
VALUES (96, 'Eyeliner', 'Jet black gel eyeliner', 8.99, 7, 327, NULL);

INSERT INTO Product (ProductID, ProductName, ProductDescription, Price, CategoryID, InventoryID, OrderID) 
VALUES (97, 'Eyeshadow Palette', '10-color nude eyeshadow palette', 24.99, 7, 328, NULL);

INSERT INTO Product (ProductID, ProductName, ProductDescription, Price, CategoryID, InventoryID, OrderID) 
VALUES (98, 'Blush', 'Peach pink blush', 14.99, 7, 329, NULL);

INSERT INTO Product (ProductID, ProductName, ProductDescription, Price, CategoryID, InventoryID, OrderID) 
VALUES (99, 'Highlighter', 'Gold shimmer highlighter', 18.99, 7, 330, NULL);

INSERT INTO Product (ProductID, ProductName, ProductDescription, Price, CategoryID, InventoryID, OrderID) 
VALUES (100, 'Concealer', 'Full coverage concealer', 15.99, 7, 331, NULL);

INSERT INTO Product (ProductID, ProductName, ProductDescription, Price, CategoryID, InventoryID, OrderID) 
VALUES (101, 'Setting Spray', 'Long-lasting makeup setting spray', 13.99, 7, 332, NULL);

INSERT INTO Product (ProductID, ProductName, ProductDescription, Price, CategoryID, InventoryID, OrderID) 
VALUES (102, 'Lip Gloss', 'High-shine clear lip gloss', 7.99, 7, 333, NULL);



INSERT INTO Inventory (InventoryID, Quantity, Unit) 
VALUES (334, 100, 'pcs');

INSERT INTO Inventory (InventoryID, Quantity, Unit) 
VALUES (335, 150, 'pcs');

INSERT INTO Inventory (InventoryID, Quantity, Unit) 
VALUES (336, 120, 'pcs');

INSERT INTO Inventory (InventoryID, Quantity, Unit) 
VALUES (337, 90, 'pcs');

INSERT INTO Inventory (InventoryID, Quantity, Unit) 
VALUES (338, 130, 'pcs');

INSERT INTO Inventory (InventoryID, Quantity, Unit) 
VALUES (339, 110, 'pcs');

INSERT INTO Inventory (InventoryID, Quantity, Unit) 
VALUES (340, 80, 'pcs');

INSERT INTO Inventory (InventoryID, Quantity, Unit) 
VALUES (341, 140, 'pcs');

INSERT INTO Inventory (InventoryID, Quantity, Unit) 
VALUES (342, 160, 'pcs');

INSERT INTO Inventory (InventoryID, Quantity, Unit) 
VALUES (343, 200, 'pcs');



INSERT INTO Product (ProductID, ProductName, ProductDescription, Price, CategoryID, InventoryID, OrderID) 
VALUES (101, 'Foundation', 'Liquid foundation for a flawless finish', 25.99, 7, 334, NULL);

INSERT INTO Product (ProductID, ProductName, ProductDescription, Price, CategoryID, InventoryID, OrderID) 
VALUES (102, 'Matte Lipstick', 'Long-lasting matte lipstick', 15.99, 7, 335, NULL);

INSERT INTO Product (ProductID, ProductName, ProductDescription, Price, CategoryID, InventoryID, OrderID) 
VALUES (103, 'Blush', 'Powder blush for a natural glow', 18.99, 7, 336, NULL);

INSERT INTO Product (ProductID, ProductName, ProductDescription, Price, CategoryID, InventoryID, OrderID) 
VALUES (104, 'Eye Shadow Palette', '10-color eyeshadow palette', 29.99, 7, 337, NULL);

INSERT INTO Product (ProductID, ProductName, ProductDescription, Price, CategoryID, InventoryID, OrderID) 
VALUES (105, 'Eyeliner', 'Waterproof gel eyeliner', 12.99, 7, 338, NULL);

INSERT INTO Product (ProductID, ProductName, ProductDescription, Price, CategoryID, InventoryID, OrderID) 
VALUES (106, 'Mascara', 'Volumizing black mascara', 14.99, 7, 339, NULL);

INSERT INTO Product (ProductID, ProductName, ProductDescription, Price, CategoryID, InventoryID, OrderID) 
VALUES (107, 'Highlighter', 'Liquid highlighter for a radiant glow', 19.99, 7, 340, NULL);

INSERT INTO Product (ProductID, ProductName, ProductDescription, Price, CategoryID, InventoryID, OrderID) 
VALUES (108, 'Setting Powder', 'Translucent setting powder', 22.99, 7, 341, NULL);

INSERT INTO Product (ProductID, ProductName, ProductDescription, Price, CategoryID, InventoryID, OrderID) 
VALUES (109, 'Makeup Primer', 'Smoothing makeup primer', 17.99, 7, 342, NULL);

INSERT INTO Product (ProductID, ProductName, ProductDescription, Price, CategoryID, InventoryID, OrderID) 
VALUES (110, 'Lip Gloss', 'High-shine lip gloss', 11.99, 7, 343, NULL);



INSERT INTO OrderDetails (OrderDetailID, OrderID, ProductID, Price) 
VALUES (55, 2, 108, 24.99);

INSERT INTO OrderDetails (OrderDetailID, OrderID, ProductID, Price) 
VALUES (56, 2, 110, 8.99);

INSERT INTO OrderDetails (OrderDetailID, OrderID, ProductID, Price) 
VALUES (57, 2, 110, 7.99);

INSERT INTO OrderDetails (OrderDetailID, OrderID, ProductID, Price) 
VALUES (58, 2, 103, 16.99);

INSERT INTO OrderDetails (OrderDetailID, OrderID, ProductID, Price) 
VALUES (59, 2, 104, 29.99);


INSERT INTO OrderDetails (OrderDetailID, OrderID, ProductID, Price) 
VALUES (60, 4, 108, 24.99);

INSERT INTO OrderDetails (OrderDetailID, OrderID, ProductID, Price) 
VALUES (61, 4, 110, 8.99);

INSERT INTO OrderDetails (OrderDetailID, OrderID, ProductID, Price) 
VALUES (62, 4, 110, 7.99);

INSERT INTO OrderDetails (OrderDetailID, OrderID, ProductID, Price) 
VALUES (63, 4, 103, 16.99);

INSERT INTO OrderDetails (OrderDetailID, OrderID, ProductID, Price) 
VALUES (64, 4, 104, 29.99);


INSERT INTO OrderDetails (OrderDetailID, OrderID, ProductID, Price) 
VALUES (65, 10, 108, 24.99);

INSERT INTO OrderDetails (OrderDetailID, OrderID, ProductID, Price) 
VALUES (66, 10, 106, 9.99);

INSERT INTO OrderDetails (OrderDetailID, OrderID, ProductID, Price) 
VALUES (67, 10, 105, 12.99);

INSERT INTO OrderDetails (OrderDetailID, OrderID, ProductID, Price) 
VALUES (68, 10, 103, 18.99);




SELECT p.ProductID, p.ProductName, COUNT(od.ProductID) AS OrderCount
FROM Product p
JOIN OrderDetails od ON p.ProductID = od.ProductID
GROUP BY p.ProductID, p.ProductName
ORDER BY OrderCount DESC
FETCH FIRST 5 ROWS ONLY;




SELECT c.CategoryID, c.CategoryName, COUNT(od.ProductID) AS TotalOrders
FROM Category c
JOIN Product p ON c.CategoryID = p.CategoryID
JOIN OrderDetails od ON p.ProductID = od.ProductID
GROUP BY c.CategoryID, c.CategoryName
ORDER BY TotalOrders DESC
FETCH FIRST 5 ROWS ONLY;




WITH MostPopularProduct AS (
    SELECT p.ProductID
    FROM Product p
    JOIN OrderDetails od ON p.ProductID = od.ProductID
    GROUP BY p.ProductID
    ORDER BY COUNT(od.ProductID) DESC
    FETCH FIRST 1 ROWS ONLY
),
MostPopularCategory AS (
    SELECT c.CategoryID
    FROM Category c
    JOIN Product p ON c.CategoryID = p.CategoryID
    JOIN OrderDetails od ON p.ProductID = od.ProductID
    GROUP BY c.CategoryID
    ORDER BY COUNT(od.ProductID) DESC
    FETCH FIRST 1 ROWS ONLY
)
SELECT s.ShipmentID, s.ShipmentDate, s.OrderID
FROM Shipment s
JOIN Orders o ON s.OrderID = o.OrderID
JOIN OrderDetails od ON o.OrderID = od.OrderID
JOIN Product p ON od.ProductID = p.ProductID
WHERE p.ProductID IN (SELECT ProductID FROM MostPopularProduct)
   OR p.CategoryID IN (SELECT CategoryID FROM MostPopularCategory);



WITH MostPopularProduct AS (
    SELECT p.ProductID
    FROM Product p
    JOIN OrderDetails od ON p.ProductID = od.ProductID
    GROUP BY p.ProductID
    ORDER BY COUNT(od.ProductID) DESC
    FETCH FIRST 1 ROWS ONLY
),
MostPopularCategory AS (
    SELECT c.CategoryID
    FROM Category c
    JOIN Product p ON c.CategoryID = p.CategoryID
    JOIN OrderDetails od ON p.ProductID = od.ProductID
    GROUP BY c.CategoryID
    ORDER BY COUNT(od.ProductID) DESC
    FETCH FIRST 1 ROWS ONLY
)
SELECT COUNT(DISTINCT s.ShipmentID) AS ShipmentCount
FROM Shipment s
JOIN Orders o ON s.OrderID = o.OrderID
JOIN OrderDetails od ON o.OrderID = od.OrderID
JOIN Product p ON od.ProductID = p.ProductID
WHERE p.ProductID IN (SELECT ProductID FROM MostPopularProduct)
   OR p.CategoryID IN (SELECT CategoryID FROM MostPopularCategory);



WITH MostPopularProduct AS (
    SELECT p.ProductID
    FROM Product p
    JOIN OrderDetails od ON p.ProductID = od.ProductID
    GROUP BY p.ProductID
    ORDER BY COUNT(od.ProductID) DESC
    FETCH FIRST 1 ROWS ONLY
),
MostPopularCategory AS (
    SELECT c.CategoryID
    FROM Category c
    JOIN Product p ON c.CategoryID = p.CategoryID
    JOIN OrderDetails od ON p.ProductID = od.ProductID
    GROUP BY c.CategoryID
    ORDER BY COUNT(od.ProductID) DESC
    FETCH FIRST 1 ROWS ONLY
)
SELECT
    'Most Popular Product' AS Reason,
    COUNT(DISTINCT s.ShipmentID) AS ShipmentCount
FROM Shipment s
JOIN Orders o ON s.OrderID = o.OrderID
JOIN OrderDetails od ON o.OrderID = od.OrderID
JOIN Product p ON od.ProductID = p.ProductID
WHERE p.ProductID IN (SELECT ProductID FROM MostPopularProduct)
UNION ALL
SELECT
    'Most Popular Category' AS Reason,
    COUNT(DISTINCT s.ShipmentID) AS ShipmentCount
FROM Shipment s
JOIN Orders o ON s.OrderID = o.OrderID
JOIN OrderDetails od ON o.OrderID = od.OrderID
JOIN Product p ON od.ProductID = p.ProductID
WHERE p.CategoryID IN (SELECT CategoryID FROM MostPopularCategory);

