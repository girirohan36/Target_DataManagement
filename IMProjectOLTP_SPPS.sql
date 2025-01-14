-- Drop tables if they exist
BEGIN
   EXECUTE IMMEDIATE 'DROP TABLE Invoice CASCADE CONSTRAINTS';
EXCEPTION
   WHEN OTHERS THEN NULL;
END;
/
BEGIN
   EXECUTE IMMEDIATE 'DROP TABLE SalesOrderItem CASCADE CONSTRAINTS';
EXCEPTION
   WHEN OTHERS THEN NULL;
END;
/
BEGIN
   EXECUTE IMMEDIATE 'DROP TABLE Payment CASCADE CONSTRAINTS';
EXCEPTION
   WHEN OTHERS THEN NULL;
END;
/
BEGIN
   EXECUTE IMMEDIATE 'DROP TABLE SalesOrder CASCADE CONSTRAINTS';
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
   EXECUTE IMMEDIATE 'DROP TABLE PaymentMethod CASCADE CONSTRAINTS';
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

-- Create tables
CREATE TABLE Product (
  ProductID NUMBER PRIMARY KEY,
  ProductName VARCHAR(30),
  ProductDescription VARCHAR(30),
  Price NUMBER(10, 2),
  Stock NUMBER
);

CREATE TABLE PaymentMethod (
  PaymentMethodID NUMBER PRIMARY KEY,
  MethodName VARCHAR(30)
);

CREATE TABLE Customer (
  CustomerID NUMBER PRIMARY KEY,
  FirstName VARCHAR(30),
  LastName VARCHAR(30),
  Email VARCHAR(30),
  PhoneNumber VARCHAR(15),
  Address VARCHAR2(60)
);

CREATE TABLE SalesOrder (
  OrderID NUMBER PRIMARY KEY,
  OrderDate DATE,
  CustomerID NUMBER,
  SalesRepID NUMBER,
  Status VARCHAR(10),
  CONSTRAINT FK_SalesOrder_Customer FOREIGN KEY (CustomerID) REFERENCES Customer(CustomerID)
);

CREATE TABLE Payment (
  PaymentID NUMBER PRIMARY KEY,
  OrderID NUMBER,
  PaymentMethodID NUMBER,
  PaymentDate DATE,
  Amount NUMBER(10, 2),
  CONSTRAINT FK_Payment_Method FOREIGN KEY (PaymentMethodID) REFERENCES PaymentMethod(PaymentMethodID),
  CONSTRAINT FK_Payment_Order FOREIGN KEY (OrderID) REFERENCES SalesOrder(OrderID)
);

CREATE TABLE SalesOrderItem (
  OrderItemID NUMBER PRIMARY KEY,
  OrderID NUMBER,
  ProductID NUMBER,
  Quantity NUMBER,
  UnitPrice NUMBER(10, 2),
  CONSTRAINT FK_SalesOrderItem_Product FOREIGN KEY (ProductID) REFERENCES Product(ProductID),
  CONSTRAINT FK_SalesOrderItem_Order FOREIGN KEY (OrderID) REFERENCES SalesOrder(OrderID)
);

CREATE TABLE Invoice (
  InvoiceID NUMBER PRIMARY KEY,
  OrderID NUMBER,
  IssueDate DATE,
  TotalAmount NUMBER(10, 2),
  CONSTRAINT FK_Invoice_Order FOREIGN KEY (OrderID) REFERENCES SalesOrder(OrderID)
);

-- insert data 

INSERT INTO Product (ProductID, ProductName, ProductDescription, Price, Stock) VALUES (1, 'Smartphone', 'Latest model smartphone', 699.99, 50);
INSERT INTO Product (ProductID, ProductName, ProductDescription, Price, Stock) VALUES (2, 'Laptop', 'High-performance laptop', 999.99, 30);
INSERT INTO Product (ProductID, ProductName, ProductDescription, Price, Stock) VALUES (3, 'Headphones', 'Noise-cancelling headphones', 199.99, 100);
INSERT INTO Product (ProductID, ProductName, ProductDescription, Price, Stock) VALUES (4, 'Mouse', 'Wireless mouse', 49.99, 200);
INSERT INTO Product (ProductID, ProductName, ProductDescription, Price, Stock) VALUES (5, 'Keyboard', 'Mechanical keyboard', 89.99, 150);

INSERT INTO PaymentMethod (PaymentMethodID, MethodName) VALUES (1, 'Credit Card');
INSERT INTO PaymentMethod (PaymentMethodID, MethodName) VALUES (2, 'Debit Card');
INSERT INTO PaymentMethod (PaymentMethodID, MethodName) VALUES (3, 'PayPal');
INSERT INTO PaymentMethod (PaymentMethodID, MethodName) VALUES (4, 'Bank Transfer');
INSERT INTO PaymentMethod (PaymentMethodID, MethodName) VALUES (5, 'Cash');


INSERT INTO Customer (CustomerID, FirstName, LastName, Email, PhoneNumber, Address) VALUES 
(1, 'Alice', 'Johnson', 'alice.johnson@example.com', '1234567890', '123 Main St');

INSERT INTO Customer (CustomerID, FirstName, LastName, Email, PhoneNumber, Address) VALUES 
(2, 'Bob', 'Smith', 'bob.smith@example.com', '2345678901', '456 Elm St');

INSERT INTO Customer (CustomerID, FirstName, LastName, Email, PhoneNumber, Address) VALUES 
(3, 'Charlie', 'Brown', 'charlie.brown@example.com', '3456789012', '789 Oak St');

INSERT INTO Customer (CustomerID, FirstName, LastName, Email, PhoneNumber, Address) VALUES 
(4, 'Diana', 'Prince', 'diana.prince@example.com', '4567890123', '101 Maple St');

INSERT INTO Customer (CustomerID, FirstName, LastName, Email, PhoneNumber, Address) VALUES 
(5, 'Eve', 'Davis', 'eve.davis@example.com', '5678901234', '202 Pine St');


INSERT INTO SalesOrder (OrderID, OrderDate, CustomerID, SalesRepID, Status) 
VALUES (1, TO_DATE('2023-11-01', 'YYYY-MM-DD'), 1, 101, 'Completed');

INSERT INTO SalesOrder (OrderID, OrderDate, CustomerID, SalesRepID, Status) 
VALUES (2, TO_DATE('2023-11-02', 'YYYY-MM-DD'), 2, 102, 'Pending');

INSERT INTO SalesOrder (OrderID, OrderDate, CustomerID, SalesRepID, Status) 
VALUES (3, TO_DATE('2023-11-03', 'YYYY-MM-DD'), 3, 103, 'Cancelled');

INSERT INTO SalesOrder (OrderID, OrderDate, CustomerID, SalesRepID, Status) 
VALUES (4, TO_DATE('2023-11-04', 'YYYY-MM-DD'), 4, 104, 'Completed');

INSERT INTO SalesOrder (OrderID, OrderDate, CustomerID, SalesRepID, Status) 
VALUES (5, TO_DATE('2023-11-05', 'YYYY-MM-DD'), 5, 105, 'Pending');





INSERT INTO Payment (PaymentID, OrderID, PaymentMethodID, PaymentDate, Amount) 
VALUES (1, 1, 1, TO_DATE('2023-11-01', 'YYYY-MM-DD'), 699.99);

INSERT INTO Payment (PaymentID, OrderID, PaymentMethodID, PaymentDate, Amount) 
VALUES (2, 2, 2, TO_DATE('2023-11-02', 'YYYY-MM-DD'), 999.99);

INSERT INTO Payment (PaymentID, OrderID, PaymentMethodID, PaymentDate, Amount) 
VALUES (3, 3, 3, TO_DATE('2023-11-03', 'YYYY-MM-DD'), 199.99);

INSERT INTO Payment (PaymentID, OrderID, PaymentMethodID, PaymentDate, Amount) 
VALUES (4, 4, 4, TO_DATE('2023-11-04', 'YYYY-MM-DD'), 49.99);

INSERT INTO Payment (PaymentID, OrderID, PaymentMethodID, PaymentDate, Amount) 
VALUES (5, 5, 5, TO_DATE('2023-11-05', 'YYYY-MM-DD'), 89.99);




INSERT INTO SalesOrderItem (OrderItemID, OrderID, ProductID, Quantity, UnitPrice) 
VALUES (1, 1, 1, 1, 699.99);

INSERT INTO SalesOrderItem (OrderItemID, OrderID, ProductID, Quantity, UnitPrice) 
VALUES (2, 2, 2, 1, 999.99);

INSERT INTO SalesOrderItem (OrderItemID, OrderID, ProductID, Quantity, UnitPrice) 
VALUES (3, 3, 3, 2, 199.99);

INSERT INTO SalesOrderItem (OrderItemID, OrderID, ProductID, Quantity, UnitPrice) 
VALUES (4, 4, 4, 1, 49.99);

INSERT INTO SalesOrderItem (OrderItemID, OrderID, ProductID, Quantity, UnitPrice) 
VALUES (5, 5, 5, 1, 89.99);





INSERT INTO Invoice (InvoiceID, OrderID, IssueDate, TotalAmount) 
VALUES (1, 1, TO_DATE('2023-11-01', 'YYYY-MM-DD'), 699.99);

INSERT INTO Invoice (InvoiceID, OrderID, IssueDate, TotalAmount) 
VALUES (2, 2, TO_DATE('2023-11-02', 'YYYY-MM-DD'), 999.99);

INSERT INTO Invoice (InvoiceID, OrderID, IssueDate, TotalAmount) 
VALUES (3, 3, TO_DATE('2023-11-03', 'YYYY-MM-DD'), 199.99);

INSERT INTO Invoice (InvoiceID, OrderID, IssueDate, TotalAmount) 
VALUES (4, 4, TO_DATE('2023-11-04', 'YYYY-MM-DD'), 49.99);

INSERT INTO Invoice (InvoiceID, OrderID, IssueDate, TotalAmount) 
VALUES (5, 5, TO_DATE('2023-11-05', 'YYYY-MM-DD'), 89.99);


INSERT INTO Product (ProductID, ProductName, ProductDescription, Price, Stock) 
VALUES (6, 'Tablet', 'High-resolution tablet', 499.99, 75);

INSERT INTO Product (ProductID, ProductName, ProductDescription, Price, Stock) 
VALUES (7, 'Monitor', '27-inch 4K monitor', 349.99, 40);

INSERT INTO Product (ProductID, ProductName, ProductDescription, Price, Stock) 
VALUES (8, 'Speaker', 'Portable Bluetooth speaker', 129.99, 120);

INSERT INTO Product (ProductID, ProductName, ProductDescription, Price, Stock) 
VALUES (9, 'Printer', 'All-in-one laser printer', 199.99, 25);

INSERT INTO Product (ProductID, ProductName, ProductDescription, Price, Stock) 
VALUES (10, 'Camera', 'DSLR camera with 4K video', 899.99, 20);


select * from Product; 


INSERT INTO PaymentMethod (PaymentMethodID, MethodName) 
VALUES (6, 'Mobile Payment');

INSERT INTO PaymentMethod (PaymentMethodID, MethodName) 
VALUES (7, 'Cryptocurrency');


INSERT INTO Customer (CustomerID, FirstName, LastName, Email, PhoneNumber, Address) 
VALUES (6, 'Frank', 'Martin', 'frank.martin@example.com', '6789012345', '300 Birch St');

INSERT INTO Customer (CustomerID, FirstName, LastName, Email, PhoneNumber, Address) 
VALUES (7, 'Grace', 'Adams', 'grace.adams@example.com', '7890123456', '400 Willow St');

INSERT INTO Customer (CustomerID, FirstName, LastName, Email, PhoneNumber, Address) 
VALUES (8, 'Hank', 'Green', 'hank.green@example.com', '8901234567', '500 Aspen St');

INSERT INTO Customer (CustomerID, FirstName, LastName, Email, PhoneNumber, Address) 
VALUES (9, 'Ivy', 'White', 'ivy.white@example.com', '9012345678', '600 Cedar St');

INSERT INTO Customer (CustomerID, FirstName, LastName, Email, PhoneNumber, Address) 
VALUES (10, 'Jack', 'Black', 'jack.black@example.com', '9123456789', '700 Redwood St');


INSERT INTO SalesOrder (OrderID, OrderDate, CustomerID, SalesRepID, Status) 
VALUES (6, TO_DATE('2023-11-06', 'YYYY-MM-DD'), 6, 106, 'Completed');

INSERT INTO SalesOrder (OrderID, OrderDate, CustomerID, SalesRepID, Status) 
VALUES (7, TO_DATE('2023-11-07', 'YYYY-MM-DD'), 7, 107, 'Pending');

INSERT INTO SalesOrder (OrderID, OrderDate, CustomerID, SalesRepID, Status) 
VALUES (8, TO_DATE('2023-11-08', 'YYYY-MM-DD'), 8, 108, 'Completed');

INSERT INTO SalesOrder (OrderID, OrderDate, CustomerID, SalesRepID, Status) 
VALUES (9, TO_DATE('2023-11-09', 'YYYY-MM-DD'), 9, 109, 'Cancelled');

INSERT INTO SalesOrder (OrderID, OrderDate, CustomerID, SalesRepID, Status) 
VALUES (10, TO_DATE('2023-11-10', 'YYYY-MM-DD'), 10, 110, 'Pending');



INSERT INTO Payment (PaymentID, OrderID, PaymentMethodID, PaymentDate, Amount) 
VALUES (6, 6, 6, TO_DATE('2023-11-06', 'YYYY-MM-DD'), 499.99);

INSERT INTO Payment (PaymentID, OrderID, PaymentMethodID, PaymentDate, Amount) 
VALUES (7, 7, 7, TO_DATE('2023-11-07', 'YYYY-MM-DD'), 349.99);

INSERT INTO Payment (PaymentID, OrderID, PaymentMethodID, PaymentDate, Amount) 
VALUES (8, 8, 1, TO_DATE('2023-11-08', 'YYYY-MM-DD'), 129.99);

INSERT INTO Payment (PaymentID, OrderID, PaymentMethodID, PaymentDate, Amount) 
VALUES (9, 9, 2, TO_DATE('2023-11-09', 'YYYY-MM-DD'), 199.99);

INSERT INTO Payment (PaymentID, OrderID, PaymentMethodID, PaymentDate, Amount) 
VALUES (10, 10, 3, TO_DATE('2023-11-10', 'YYYY-MM-DD'), 899.99);



INSERT INTO SalesOrderItem (OrderItemID, OrderID, ProductID, Quantity, UnitPrice) 
VALUES (6, 6, 6, 1, 499.99);

INSERT INTO SalesOrderItem (OrderItemID, OrderID, ProductID, Quantity, UnitPrice) 
VALUES (7, 7, 7, 1, 349.99);

INSERT INTO SalesOrderItem (OrderItemID, OrderID, ProductID, Quantity, UnitPrice) 
VALUES (8, 8, 8, 2, 129.99);

INSERT INTO SalesOrderItem (OrderItemID, OrderID, ProductID, Quantity, UnitPrice) 
VALUES (9, 9, 9, 1, 199.99);

INSERT INTO SalesOrderItem (OrderItemID, OrderID, ProductID, Quantity, UnitPrice) 
VALUES (10, 10, 10, 1, 899.99);




INSERT INTO Invoice (InvoiceID, OrderID, IssueDate, TotalAmount) 
VALUES (6, 6, TO_DATE('2023-11-06', 'YYYY-MM-DD'), 499.99);

INSERT INTO Invoice (InvoiceID, OrderID, IssueDate, TotalAmount) 
VALUES (7, 7, TO_DATE('2023-11-07', 'YYYY-MM-DD'), 349.99);

INSERT INTO Invoice (InvoiceID, OrderID, IssueDate, TotalAmount) 
VALUES (8, 8, TO_DATE('2023-11-08', 'YYYY-MM-DD'), 129.99);

INSERT INTO Invoice (InvoiceID, OrderID, IssueDate, TotalAmount) 
VALUES (9, 9, TO_DATE('2023-11-09', 'YYYY-MM-DD'), 199.99);

INSERT INTO Invoice (InvoiceID, OrderID, IssueDate, TotalAmount) 
VALUES (10, 10, TO_DATE('2023-11-10', 'YYYY-MM-DD'), 899.99);



INSERT INTO Product (ProductID, ProductName, ProductDescription, Price, Stock) 
VALUES (11, 'Smart Watch', 'Advanced fitness tracking smartwatch', 199.99, 70);

INSERT INTO Product (ProductID, ProductName, ProductDescription, Price, Stock) 
VALUES (12, 'Gaming Console', 'Next-gen gaming console', 499.99, 60);

INSERT INTO Product (ProductID, ProductName, ProductDescription, Price, Stock) 
VALUES (13, 'Router', 'High-speed wireless router', 89.99, 150);

INSERT INTO Product (ProductID, ProductName, ProductDescription, Price, Stock) 
VALUES (14, 'Smart TV', '55-inch 4K Smart TV', 599.99, 40);

INSERT INTO Product (ProductID, ProductName, ProductDescription, Price, Stock) 
VALUES (15, 'Electric Kettle', '1.7L stainless steel kettle', 39.99, 120);

INSERT INTO Product (ProductID, ProductName, ProductDescription, Price, Stock) 
VALUES (16, 'Coffee Maker', 'Programmable coffee maker', 79.99, 50);

INSERT INTO Product (ProductID, ProductName, ProductDescription, Price, Stock) 
VALUES (17, 'Hair Dryer', 'Ionic hair dryer with diffuser', 49.99, 80);

INSERT INTO Product (ProductID, ProductName, ProductDescription, Price, Stock) 
VALUES (18, 'Vacuum Cleaner', 'Robot vacuum with Wi-Fi', 249.99, 30);

INSERT INTO Product (ProductID, ProductName, ProductDescription, Price, Stock) 
VALUES (19, 'Air Purifier', 'HEPA air purifier', 129.99, 45);

INSERT INTO Product (ProductID, ProductName, ProductDescription, Price, Stock) 
VALUES (20, 'Blender', 'High-performance blender', 99.99, 55);



INSERT INTO PaymentMethod (PaymentMethodID, MethodName) 
VALUES (8, 'Google Pay');

INSERT INTO PaymentMethod (PaymentMethodID, MethodName) 
VALUES (9, 'Apple Pay');

INSERT INTO PaymentMethod (PaymentMethodID, MethodName) 
VALUES (10, 'Gift Card');



INSERT INTO Customer (CustomerID, FirstName, LastName, Email, PhoneNumber, Address) 
VALUES (11, 'Kelly', 'Johnson', 'kelly.johnson@example.com', '3451239876', '800 Birch Lane');

INSERT INTO Customer (CustomerID, FirstName, LastName, Email, PhoneNumber, Address) 
VALUES (12, 'Leo', 'Smith', 'leo.smith@example.com', '6784561234', '900 Willow Road');

INSERT INTO Customer (CustomerID, FirstName, LastName, Email, PhoneNumber, Address) 
VALUES (13, 'Maya', 'Carter', 'maya.carter@example.com', '7896541234', '1000 Aspen Drive');

INSERT INTO Customer (CustomerID, FirstName, LastName, Email, PhoneNumber, Address) 
VALUES (14, 'Noah', 'Baker', 'noah.baker@example.com', '8903216789', '1100 Cedar Lane');

INSERT INTO Customer (CustomerID, FirstName, LastName, Email, PhoneNumber, Address) 
VALUES (15, 'Olivia', 'Reed', 'olivia.reed@example.com', '9012345678', '1200 Redwood Blvd');

INSERT INTO Customer (CustomerID, FirstName, LastName, Email, PhoneNumber, Address) 
VALUES (16, 'Paul', 'Harris', 'paul.harris@example.com', '7895432109', '1300 Pine Street');

INSERT INTO Customer (CustomerID, FirstName, LastName, Email, PhoneNumber, Address) 
VALUES (17, 'Quinn', 'Foster', 'quinn.foster@example.com', '6789123456', '1400 Elm Road');

INSERT INTO Customer (CustomerID, FirstName, LastName, Email, PhoneNumber, Address) 
VALUES (18, 'Ryan', 'Walker', 'ryan.walker@example.com', '5678901234', '1500 Maple Blvd');

INSERT INTO Customer (CustomerID, FirstName, LastName, Email, PhoneNumber, Address) 
VALUES (19, 'Sophia', 'Evans', 'sophia.evans@example.com', '4567890123', '1600 Oak Avenue');

INSERT INTO Customer (CustomerID, FirstName, LastName, Email, PhoneNumber, Address) 
VALUES (20, 'Tom', 'Bennett', 'tom.bennett@example.com', '1238904567', '1700 Birch Drive');



INSERT INTO SalesOrder (OrderID, OrderDate, CustomerID, SalesRepID, Status) 
VALUES (11, TO_DATE('2023-11-11', 'YYYY-MM-DD'), 11, 111, 'Completed');

INSERT INTO SalesOrder (OrderID, OrderDate, CustomerID, SalesRepID, Status) 
VALUES (12, TO_DATE('2023-11-12', 'YYYY-MM-DD'), 12, 112, 'Pending');

INSERT INTO SalesOrder (OrderID, OrderDate, CustomerID, SalesRepID, Status) 
VALUES (13, TO_DATE('2023-11-13', 'YYYY-MM-DD'), 13, 113, 'Cancelled');

INSERT INTO SalesOrder (OrderID, OrderDate, CustomerID, SalesRepID, Status) 
VALUES (14, TO_DATE('2023-11-14', 'YYYY-MM-DD'), 14, 114, 'Completed');

INSERT INTO SalesOrder (OrderID, OrderDate, CustomerID, SalesRepID, Status) 
VALUES (15, TO_DATE('2023-11-15', 'YYYY-MM-DD'), 15, 115, 'Pending');



INSERT INTO Payment (PaymentID, OrderID, PaymentMethodID, PaymentDate, Amount) 
VALUES (11, 11, 8, TO_DATE('2023-11-11', 'YYYY-MM-DD'), 599.99);

INSERT INTO Payment (PaymentID, OrderID, PaymentMethodID, PaymentDate, Amount) 
VALUES (12, 12, 9, TO_DATE('2023-11-12', 'YYYY-MM-DD'), 129.99);

INSERT INTO Payment (PaymentID, OrderID, PaymentMethodID, PaymentDate, Amount) 
VALUES (13, 13, 10, TO_DATE('2023-11-13', 'YYYY-MM-DD'), 79.99);



INSERT INTO SalesOrderItem (OrderItemID, OrderID, ProductID, Quantity, UnitPrice) 
VALUES (12, 12, 12, 1, 499.99);

INSERT INTO SalesOrderItem (OrderItemID, OrderID, ProductID, Quantity, UnitPrice) 
VALUES (13, 13, 13, 1, 89.99);




INSERT INTO Invoice (InvoiceID, OrderID, IssueDate, TotalAmount) 
VALUES (12, 12, TO_DATE('2023-11-12', 'YYYY-MM-DD'), 499.99);

INSERT INTO Invoice (InvoiceID, OrderID, IssueDate, TotalAmount) 
VALUES (13, 13, TO_DATE('2023-11-13', 'YYYY-MM-DD'), 129.99);


INSERT INTO Product (ProductID, ProductName, ProductDescription, Price, Stock) 
VALUES (21, 'Projector', 'High-definition projector', 299.99, 25);

INSERT INTO Product (ProductID, ProductName, ProductDescription, Price, Stock) 
VALUES (22, 'Fitness Tracker', 'Waterproof fitness tracker', 59.99, 120);

INSERT INTO Product (ProductID, ProductName, ProductDescription, Price, Stock) 
VALUES (23, 'Drone', 'Camera drone with 4K video', 399.99, 35);

INSERT INTO Product (ProductID, ProductName, ProductDescription, Price, Stock) 
VALUES (24, 'Microwave', 'Compact microwave oven', 89.99, 50);

INSERT INTO Product (ProductID, ProductName, ProductDescription, Price, Stock) 
VALUES (25, 'Laptop Stand', 'Adjustable laptop stand', 29.99, 150);

INSERT INTO Product (ProductID, ProductName, ProductDescription, Price, Stock) 
VALUES (26, 'Smart Light', 'Wi-Fi enabled smart bulb', 19.99, 200);

INSERT INTO Product (ProductID, ProductName, ProductDescription, Price, Stock) 
VALUES (27, 'Gaming Chair', 'Ergonomic gaming chair', 249.99, 30);

INSERT INTO Product (ProductID, ProductName, ProductDescription, Price, Stock) 
VALUES (28, 'External Hard Drive', '1TB external drive', 79.99, 80);

INSERT INTO Product (ProductID, ProductName, ProductDescription, Price, Stock) 
VALUES (29, 'Smart Doorbell', 'Wi-Fi video doorbell', 149.99, 40);

INSERT INTO Product (ProductID, ProductName, ProductDescription, Price, Stock) 
VALUES (30, 'Electric Scooter', 'Foldable electric scooter', 499.99, 20);




INSERT INTO Customer (CustomerID, FirstName, LastName, Email, PhoneNumber, Address) 
VALUES (21, 'Uma', 'Scott', 'uma.scott@example.com', '9876543210', '1800 Fir Lane');

INSERT INTO Customer (CustomerID, FirstName, LastName, Email, PhoneNumber, Address) 
VALUES (22, 'Victor', 'Mills', 'victor.mills@example.com', '8765432109', '1900 Maple Drive');

INSERT INTO Customer (CustomerID, FirstName, LastName, Email, PhoneNumber, Address) 
VALUES (23, 'Wendy', 'Gray', 'wendy.gray@example.com', '7654321098', '2000 Birch Way');

INSERT INTO Customer (CustomerID, FirstName, LastName, Email, PhoneNumber, Address) 
VALUES (24, 'Xander', 'Taylor', 'xander.taylor@example.com', '6543210987', '2100 Cedar Place');

INSERT INTO Customer (CustomerID, FirstName, LastName, Email, PhoneNumber, Address) 
VALUES (25, 'Yasmine', 'Hall', 'yasmine.hall@example.com', '5432109876', '2200 Redwood Avenue');

INSERT INTO Customer (CustomerID, FirstName, LastName, Email, PhoneNumber, Address) 
VALUES (26, 'Zane', 'Lee', 'zane.lee@example.com', '4321098765', '2300 Pine Circle');




INSERT INTO SalesOrder (OrderID, OrderDate, CustomerID, SalesRepID, Status) 
VALUES (16, TO_DATE('2023-11-16', 'YYYY-MM-DD'), 16, 116, 'Completed');

INSERT INTO SalesOrder (OrderID, OrderDate, CustomerID, SalesRepID, Status) 
VALUES (17, TO_DATE('2023-11-17', 'YYYY-MM-DD'), 17, 117, 'Pending');

INSERT INTO SalesOrder (OrderID, OrderDate, CustomerID, SalesRepID, Status) 
VALUES (18, TO_DATE('2023-11-18', 'YYYY-MM-DD'), 18, 118, 'Cancelled');

INSERT INTO SalesOrder (OrderID, OrderDate, CustomerID, SalesRepID, Status) 
VALUES (19, TO_DATE('2023-11-19', 'YYYY-MM-DD'), 19, 119, 'Completed');

INSERT INTO SalesOrder (OrderID, OrderDate, CustomerID, SalesRepID, Status) 
VALUES (20, TO_DATE('2023-11-20', 'YYYY-MM-DD'), 20, 120, 'Pending');





INSERT INTO Product (ProductID, ProductName, ProductDescription, Price, Stock) 
VALUES (31, 'Bread', 'Whole wheat bread loaf', 2.99, 200);

INSERT INTO Product (ProductID, ProductName, ProductDescription, Price, Stock) 
VALUES (32, 'Milk', 'Organic whole milk', 3.49, 150);

INSERT INTO Product (ProductID, ProductName, ProductDescription, Price, Stock) 
VALUES (33, 'T-Shirt', 'Cotton crew neck t-shirt', 14.99, 100);

INSERT INTO Product (ProductID, ProductName, ProductDescription, Price, Stock) 
VALUES (34, 'Jeans', 'Slim-fit denim jeans', 49.99, 75);

INSERT INTO Product (ProductID, ProductName, ProductDescription, Price, Stock) 
VALUES (35, 'Apple', 'Fresh red apples', 1.99, 300);

INSERT INTO Product (ProductID, ProductName, ProductDescription, Price, Stock) 
VALUES (36, 'Banana', 'Organic bananas', 0.79, 400);

INSERT INTO Product (ProductID, ProductName, ProductDescription, Price, Stock) 
VALUES (37, 'Jacket', 'Winter down jacket', 89.99, 40);

INSERT INTO Product (ProductID, ProductName, ProductDescription, Price, Stock) 
VALUES (38, 'Eggs', 'Free-range eggs, dozen', 4.99, 180);

INSERT INTO Product (ProductID, ProductName, ProductDescription, Price, Stock) 
VALUES (39, 'Socks', 'Woolen winter socks', 9.99, 120);

INSERT INTO Product (ProductID, ProductName, ProductDescription, Price, Stock) 
VALUES (40, 'Chicken', 'Fresh whole chicken', 12.99, 60);

INSERT INTO Product (ProductID, ProductName, ProductDescription, Price, Stock) 
VALUES (41, 'Salmon', 'Fresh Atlantic salmon', 19.99, 50);

INSERT INTO Product (ProductID, ProductName, ProductDescription, Price, Stock) 
VALUES (42, 'Rice', 'Basmati white rice, 5lb', 8.99, 90);

INSERT INTO Product (ProductID, ProductName, ProductDescription, Price, Stock) 
VALUES (43, 'Shoes', 'Running shoes', 59.99, 70);

INSERT INTO Product (ProductID, ProductName, ProductDescription, Price, Stock) 
VALUES (44, 'Pants', 'Khaki trousers', 39.99, 65);

INSERT INTO Product (ProductID, ProductName, ProductDescription, Price, Stock) 
VALUES (45, 'Yogurt', 'Greek yogurt', 2.49, 140);

INSERT INTO Product (ProductID, ProductName, ProductDescription, Price, Stock) 
VALUES (46, 'Sweater', 'Wool knit sweater', 29.99, 50);

INSERT INTO Product (ProductID, ProductName, ProductDescription, Price, Stock) 
VALUES (47, 'Pizza', 'Frozen pepperoni pizza', 6.99, 90);

INSERT INTO Product (ProductID, ProductName, ProductDescription, Price, Stock) 
VALUES (48, 'Juice', 'Orange juice, 1L', 3.99, 110);

INSERT INTO Product (ProductID, ProductName, ProductDescription, Price, Stock) 
VALUES (49, 'Milkshake', 'Strawberry milkshake', 4.49, 100);

INSERT INTO Product (ProductID, ProductName, ProductDescription, Price, Stock) 
VALUES (50, 'Hat', 'Baseball cap', 19.99, 80);



INSERT INTO PaymentMethod (PaymentMethodID, MethodName) 
VALUES (13, 'Venmo');

INSERT INTO PaymentMethod (PaymentMethodID, MethodName) 
VALUES (14, 'Zelle');


INSERT INTO Customer (CustomerID, FirstName, LastName, Email, PhoneNumber, Address) 
VALUES (27, 'Alice', 'Ford', 'alice.ford@example.com', '3219876540', '300 Birch Avenue');

INSERT INTO Customer (CustomerID, FirstName, LastName, Email, PhoneNumber, Address) 
VALUES (28, 'Bob', 'Grant', 'bob.grant@example.com', '1237894560', '400 Oak Street');

INSERT INTO Customer (CustomerID, FirstName, LastName, Email, PhoneNumber, Address) 
VALUES (29, 'Chris', 'Howard', 'chris.howard@example.com', '5671238904', '500 Cedar Road');

INSERT INTO Customer (CustomerID, FirstName, LastName, Email, PhoneNumber, Address) 
VALUES (30, 'Dana', 'Ivy', 'dana.ivy@example.com', '8765432101', '600 Maple Circle');



INSERT INTO SalesOrder (OrderID, OrderDate, CustomerID, SalesRepID, Status) 
VALUES (21, TO_DATE('2023-12-01', 'YYYY-MM-DD'), 27, 121, 'Completed');

INSERT INTO SalesOrder (OrderID, OrderDate, CustomerID, SalesRepID, Status) 
VALUES (22, TO_DATE('2023-12-02', 'YYYY-MM-DD'), 28, 122, 'Pending');





INSERT INTO Payment (PaymentID, OrderID, PaymentMethodID, PaymentDate, Amount) 
VALUES (18, 22, 14, TO_DATE('2023-12-02', 'YYYY-MM-DD'), 59.99);


INSERT INTO SalesOrderItem (OrderItemID, OrderID, ProductID, Quantity, UnitPrice) 
VALUES (18, 22, 33, 1, 14.99);


INSERT INTO Invoice (InvoiceID, OrderID, IssueDate, TotalAmount) 
VALUES (18, 22, TO_DATE('2023-12-02', 'YYYY-MM-DD'), 59.99);





INSERT INTO Product (ProductID, ProductName, ProductDescription, Price, Stock) 
VALUES (51, 'Lego Set', 'Classic brick building set', 49.99, 100);

INSERT INTO Product (ProductID, ProductName, ProductDescription, Price, Stock) 
VALUES (52, 'Action Figure', 'Superhero action figure', 19.99, 150);

INSERT INTO Product (ProductID, ProductName, ProductDescription, Price, Stock) 
VALUES (53, 'Board Game', 'Family strategy board game', 29.99, 80);

INSERT INTO Product (ProductID, ProductName, ProductDescription, Price, Stock) 
VALUES (54, 'Storybook', 'Illustrated children’s book', 9.99, 120);

INSERT INTO Product (ProductID, ProductName, ProductDescription, Price, Stock) 
VALUES (55, 'Novel', 'Mystery thriller novel', 14.99, 90);

INSERT INTO Product (ProductID, ProductName, ProductDescription, Price, Stock) 
VALUES (56, 'DVD', 'Blockbuster movie DVD', 12.99, 100);

INSERT INTO Product (ProductID, ProductName, ProductDescription, Price, Stock) 
VALUES (57, 'Blu-ray', 'High-definition movie Blu-ray', 19.99, 70);

INSERT INTO Product (ProductID, ProductName, ProductDescription, Price, Stock) 
VALUES (58, 'Mascara', 'Lengthening black mascara', 9.99, 50);

INSERT INTO Product (ProductID, ProductName, ProductDescription, Price, Stock) 
VALUES (59, 'Lipstick', 'Matte red lipstick', 7.99, 60);

INSERT INTO Product (ProductID, ProductName, ProductDescription, Price, Stock) 
VALUES (60, 'Foundation', 'Lightweight liquid foundation', 14.99, 40);

INSERT INTO Product (ProductID, ProductName, ProductDescription, Price, Stock) 
VALUES (61, 'Face Wash', 'Gentle foaming cleanser', 6.99, 120);

INSERT INTO Product (ProductID, ProductName, ProductDescription, Price, Stock) 
VALUES (62, 'Moisturizer', 'Hydrating daily moisturizer', 12.99, 80);

INSERT INTO Product (ProductID, ProductName, ProductDescription, Price, Stock) 
VALUES (63, 'Sunscreen', 'SPF 50+ broad-spectrum lotion', 9.99, 90);

INSERT INTO Product (ProductID, ProductName, ProductDescription, Price, Stock) 
VALUES (64, 'Vitamin C', '1000mg immune support', 14.99, 100);

INSERT INTO Product (ProductID, ProductName, ProductDescription, Price, Stock) 
VALUES (65, 'Multivitamin', 'Daily multivitamin for adults', 19.99, 120);

INSERT INTO Product (ProductID, ProductName, ProductDescription, Price, Stock) 
VALUES (66, 'Omega-3', 'Fish oil supplement, 1000mg', 24.99, 90);

INSERT INTO Product (ProductID, ProductName, ProductDescription, Price, Stock) 
VALUES (67, 'Hair Serum', 'Nourishing hair growth serum', 11.99, 70);

INSERT INTO Product (ProductID, ProductName, ProductDescription, Price, Stock) 
VALUES (68, 'Toy Car', 'Die-cast toy race car', 5.99, 200);

INSERT INTO Product (ProductID, ProductName, ProductDescription, Price, Stock) 
VALUES (69, 'Puzzle', '1000-piece jigsaw puzzle', 19.99, 100);

INSERT INTO Product (ProductID, ProductName, ProductDescription, Price, Stock) 
VALUES (70, 'Eye Cream', 'Anti-aging eye treatment', 14.99, 50);




INSERT INTO Customer (CustomerID, FirstName, LastName, Email, PhoneNumber, Address) 
VALUES (31, 'Ella', 'James', 'ella.james@example.com', '5678902345', '800 Birch Way');

INSERT INTO Customer (CustomerID, FirstName, LastName, Email, PhoneNumber, Address) 
VALUES (32, 'Finn', 'Taylor', 'finn.taylor@example.com', '6789013456', '900 Maple Blvd');

INSERT INTO Customer (CustomerID, FirstName, LastName, Email, PhoneNumber, Address) 
VALUES (33, 'Grace', 'Moore', 'grace.moore@example.com', '7890124567', '1000 Cedar Ave');

INSERT INTO Customer (CustomerID, FirstName, LastName, Email, PhoneNumber, Address) 
VALUES (34, 'Harry', 'Cooper', 'harry.cooper@example.com', '8901235678', '1100 Elm St');





INSERT INTO Product (ProductID, ProductName, ProductDescription, Price, Stock) 
VALUES (71, 'Color Pencils', '24-pack of color pencils', 7.99, 200);

INSERT INTO Product (ProductID, ProductName, ProductDescription, Price, Stock) 
VALUES (72, 'Sketchbook', 'Hardcover, 100 pages', 12.99, 150);

INSERT INTO Product (ProductID, ProductName, ProductDescription, Price, Stock) 
VALUES (73, 'Cookbook', 'Healthy recipe collection', 19.99, 80);

INSERT INTO Product (ProductID, ProductName, ProductDescription, Price, Stock) 
VALUES (74, 'Toy Robot', 'Interactive programmable toy', 59.99, 50);

INSERT INTO Product (ProductID, ProductName, ProductDescription, Price, Stock) 
VALUES (75, 'Building Blocks', '100-piece wooden block set', 29.99, 90);

INSERT INTO Product (ProductID, ProductName, ProductDescription, Price, Stock) 
VALUES (76, 'Eyeliner', 'Waterproof gel eyeliner', 6.99, 100);

INSERT INTO Product (ProductID, ProductName, ProductDescription, Price, Stock) 
VALUES (77, 'Face Mask', 'Hydrating sheet mask, 10-pack', 14.99, 75);

INSERT INTO Product (ProductID, ProductName, ProductDescription, Price, Stock) 
VALUES (78, 'Movie Poster', 'Limited edition movie artwork', 9.99, 40);

INSERT INTO Product (ProductID, ProductName, ProductDescription, Price, Stock) 
VALUES (79, 'Comic Book', 'Superhero comic, Volume 1', 4.99, 120);

INSERT INTO Product (ProductID, ProductName, ProductDescription, Price, Stock) 
VALUES (80, 'Puzzle Book', 'Brain-teasing games', 7.49, 130);

INSERT INTO Product (ProductID, ProductName, ProductDescription, Price, Stock) 
VALUES (81, 'Lip Balm', 'Moisturizing lip care', 3.49, 180);

INSERT INTO Product (ProductID, ProductName, ProductDescription, Price, Stock) 
VALUES (82, 'Body Lotion', 'Nourishing almond oil lotion', 8.99, 90);

INSERT INTO Product (ProductID, ProductName, ProductDescription, Price, Stock) 
VALUES (83, 'Toy Train', 'Classic wooden toy train', 24.99, 70);

INSERT INTO Product (ProductID, ProductName, ProductDescription, Price, Stock) 
VALUES (84, 'Hair Conditioner', 'Deep conditioning treatment', 11.99, 60);

INSERT INTO Product (ProductID, ProductName, ProductDescription, Price, Stock) 
VALUES (85, 'Yoga Mat', 'Non-slip yoga mat, 6mm', 19.99, 50);

INSERT INTO Product (ProductID, ProductName, ProductDescription, Price, Stock) 
VALUES (86, 'Notebook', 'Ruled journal, 200 pages', 5.99, 100);

INSERT INTO Product (ProductID, ProductName, ProductDescription, Price, Stock) 
VALUES (87, 'Socks Pack', '5-pair cotton socks', 8.99, 140);

INSERT INTO Product (ProductID, ProductName, ProductDescription, Price, Stock) 
VALUES (88, 'Toy Drone', 'Mini drone with camera', 99.99, 30);

INSERT INTO Product (ProductID, ProductName, ProductDescription, Price, Stock) 
VALUES (89, 'Action Camera', '4K waterproof action camera', 129.99, 20);

INSERT INTO Product (ProductID, ProductName, ProductDescription, Price, Stock) 
VALUES (90, 'Board Shorts', 'Quick-dry swim shorts', 24.99, 50);

INSERT INTO Product (ProductID, ProductName, ProductDescription, Price, Stock) 
VALUES (91, 'Chess Set', 'Classic wooden chess set', 34.99, 80);

INSERT INTO Product (ProductID, ProductName, ProductDescription, Price, Stock) 
VALUES (92, 'Hand Cream', 'Shea butter hand moisturizer', 4.99, 200);

INSERT INTO Product (ProductID, ProductName, ProductDescription, Price, Stock) 
VALUES (93, 'Movie Blu-ray', 'Special edition Blu-ray', 14.99, 60);

INSERT INTO Product (ProductID, ProductName, ProductDescription, Price, Stock) 
VALUES (94, 'Puzzle Box', '3D wooden puzzle box', 29.99, 70);

INSERT INTO Product (ProductID, ProductName, ProductDescription, Price, Stock) 
VALUES (95, 'Sports Cap', 'Adjustable baseball cap', 9.99, 100);

INSERT INTO Product (ProductID, ProductName, ProductDescription, Price, Stock) 
VALUES (96, 'Backpack', 'Durable school backpack', 29.99, 120);

INSERT INTO Product (ProductID, ProductName, ProductDescription, Price, Stock) 
VALUES (97, 'Sneakers', 'Comfortable running shoes', 49.99, 60);

INSERT INTO Product (ProductID, ProductName, ProductDescription, Price, Stock) 
VALUES (98, 'Vitamin D', '5000 IU capsules', 12.99, 100);

INSERT INTO Product (ProductID, ProductName, ProductDescription, Price, Stock) 
VALUES (99, 'Notebook Set', '3-pack ruled notebooks', 8.99, 200);

INSERT INTO Product (ProductID, ProductName, ProductDescription, Price, Stock) 
VALUES (100, 'Lip Gloss', 'Shiny pink lip gloss', 4.99, 80);





INSERT INTO Product (ProductID, ProductName, ProductDescription, Price, Stock) 
VALUES (101, 'Desk', 'Wooden study desk', 129.99, 50);

INSERT INTO Product (ProductID, ProductName, ProductDescription, Price, Stock) 
VALUES (102, 'Chair', 'Ergonomic office chair', 89.99, 75);

INSERT INTO Product (ProductID, ProductName, ProductDescription, Price, Stock) 
VALUES (103, 'Bookshelf', '5-tier wooden bookshelf', 149.99, 40);

INSERT INTO Product (ProductID, ProductName, ProductDescription, Price, Stock) 
VALUES (104, 'Sofa', '3-seater fabric sofa', 399.99, 20);

INSERT INTO Product (ProductID, ProductName, ProductDescription, Price, Stock) 
VALUES (105, 'Coffee Table', 'Glass top coffee table', 79.99, 30);

INSERT INTO Product (ProductID, ProductName, ProductDescription, Price, Stock) 
VALUES (106, 'Bed Frame', 'Queen size bed frame', 249.99, 15);

INSERT INTO Product (ProductID, ProductName, ProductDescription, Price, Stock) 
VALUES (107, 'Dining Table', '6-seater wooden dining table', 299.99, 10);

INSERT INTO Product (ProductID, ProductName, ProductDescription, Price, Stock) 
VALUES (108, 'TV Stand', 'Modern TV stand with storage', 199.99, 25);

INSERT INTO Product (ProductID, ProductName, ProductDescription, Price, Stock) 
VALUES (109, 'Wardrobe', '3-door wooden wardrobe', 349.99, 12);

INSERT INTO Product (ProductID, ProductName, ProductDescription, Price, Stock) 
VALUES (110, 'Nightstand', '2-drawer wooden nightstand', 59.99, 50);

INSERT INTO Product (ProductID, ProductName, ProductDescription, Price, Stock) 
VALUES (111, 'Floor Lamp', 'Adjustable floor lamp', 39.99, 60);

INSERT INTO Product (ProductID, ProductName, ProductDescription, Price, Stock) 
VALUES (112, 'Wall Clock', 'Minimalist round wall clock', 19.99, 80);

INSERT INTO Product (ProductID, ProductName, ProductDescription, Price, Stock) 
VALUES (113, 'Vase', 'Ceramic decorative vase', 24.99, 70);

INSERT INTO Product (ProductID, ProductName, ProductDescription, Price, Stock) 
VALUES (114, 'Throw Pillow', 'Velvet throw pillow', 14.99, 100);

INSERT INTO Product (ProductID, ProductName, ProductDescription, Price, Stock) 
VALUES (115, 'Curtains', 'Blackout window curtains', 29.99, 40);

INSERT INTO Product (ProductID, ProductName, ProductDescription, Price, Stock) 
VALUES (116, 'Mirror', 'Full-length dressing mirror', 79.99, 30);

INSERT INTO Product (ProductID, ProductName, ProductDescription, Price, Stock) 
VALUES (117, 'Rug', 'Area rug, 6x9 ft', 119.99, 20);

INSERT INTO Product (ProductID, ProductName, ProductDescription, Price, Stock) 
VALUES (118, 'Wall Art', 'Abstract canvas painting', 49.99, 25);

INSERT INTO Product (ProductID, ProductName, ProductDescription, Price, Stock) 
VALUES (119, 'Chandelier', 'Crystal hanging chandelier', 199.99, 10);

INSERT INTO Product (ProductID, ProductName, ProductDescription, Price, Stock) 
VALUES (120, 'Shelf Decor', 'Assorted decorative items', 39.99, 50);








-- Second purchase for CustomerID 20


INSERT INTO SalesOrderItem (OrderItemID, OrderID, ProductID, Quantity, UnitPrice) 
VALUES (15, 15, 7, 1, 349.99);

INSERT INTO Payment (PaymentID, OrderID, PaymentMethodID, PaymentDate, Amount) 
VALUES (15, 15, 1, TO_DATE('2023-12-05', 'YYYY-MM-DD'), 349.99);

INSERT INTO Invoice (InvoiceID, OrderID, IssueDate, TotalAmount) 
VALUES (15, 15, TO_DATE('2023-12-05', 'YYYY-MM-DD'), 349.99);


-- Second purchase for CustomerID 23


INSERT INTO SalesOrderItem (OrderItemID, OrderID, ProductID, Quantity, UnitPrice) 
VALUES (16, 16, 9, 1, 199.99);

INSERT INTO Payment (PaymentID, OrderID, PaymentMethodID, PaymentDate, Amount) 
VALUES (16, 16, 2, TO_DATE('2023-12-06', 'YYYY-MM-DD'), 199.99);

INSERT INTO Invoice (InvoiceID, OrderID, IssueDate, TotalAmount) 
VALUES (16, 16, TO_DATE('2023-12-06', 'YYYY-MM-DD'), 199.99);


-- Third purchase for CustomerID 30


INSERT INTO SalesOrderItem (OrderItemID, OrderID, ProductID, Quantity, UnitPrice) 
VALUES (17, 17, 3, 2, 199.99);

INSERT INTO Payment (PaymentID, OrderID, PaymentMethodID, PaymentDate, Amount) 
VALUES (17, 17, 3, TO_DATE('2023-12-07', 'YYYY-MM-DD'), 399.98);

INSERT INTO Invoice (InvoiceID, OrderID, IssueDate, TotalAmount) 
VALUES (17, 17, TO_DATE('2023-12-07', 'YYYY-MM-DD'), 399.98);









-- Second purchase


INSERT INTO SalesOrderItem (OrderItemID, OrderID, ProductID, Quantity, UnitPrice) 
VALUES (19, 19, 8, 2, 129.99);

INSERT INTO Payment (PaymentID, OrderID, PaymentMethodID, PaymentDate, Amount) 
VALUES (19, 19, 2, TO_DATE('2023-12-09', 'YYYY-MM-DD'), 259.98);

INSERT INTO Invoice (InvoiceID, OrderID, IssueDate, TotalAmount) 
VALUES (19, 19, TO_DATE('2023-12-09', 'YYYY-MM-DD'), 259.98);

-- Third purchase

INSERT INTO SalesOrderItem (OrderItemID, OrderID, ProductID, Quantity, UnitPrice) 
VALUES (20, 20, 4, 3, 49.99);

INSERT INTO Payment (PaymentID, OrderID, PaymentMethodID, PaymentDate, Amount) 
VALUES (20, 20, 1, TO_DATE('2023-12-10', 'YYYY-MM-DD'), 149.97);

INSERT INTO Invoice (InvoiceID, OrderID, IssueDate, TotalAmount) 
VALUES (20, 20, TO_DATE('2023-12-10', 'YYYY-MM-DD'), 149.97);

-- Fourth purchase


INSERT INTO SalesOrderItem (OrderItemID, OrderID, ProductID, Quantity, UnitPrice) 
VALUES (21, 21, 6, 1, 499.99);

INSERT INTO Payment (PaymentID, OrderID, PaymentMethodID, PaymentDate, Amount) 
VALUES (21, 21, 5, TO_DATE('2023-12-11', 'YYYY-MM-DD'), 499.99);

INSERT INTO Invoice (InvoiceID, OrderID, IssueDate, TotalAmount) 
VALUES (21, 21, TO_DATE('2023-12-11', 'YYYY-MM-DD'), 499.99);







INSERT INTO SalesOrder (OrderID, OrderDate, CustomerID, SalesRepID, Status) 
VALUES (35, TO_DATE('2023-12-22', 'YYYY-MM-DD'), 8, 301, 'Completed');

INSERT INTO SalesOrderItem (OrderItemID, OrderID, ProductID, Quantity, UnitPrice) 
VALUES (35, 35, 10, 1, 899.99);

INSERT INTO Payment (PaymentID, OrderID, PaymentMethodID, PaymentDate, Amount) 
VALUES (35, 35, 3, TO_DATE('2023-12-22', 'YYYY-MM-DD'), 899.99);

INSERT INTO Invoice (InvoiceID, OrderID, IssueDate, TotalAmount) 
VALUES (35, 35, TO_DATE('2023-12-22', 'YYYY-MM-DD'), 899.99);









INSERT INTO SalesOrder (OrderID, OrderDate, CustomerID, SalesRepID, Status) 
VALUES (36, TO_DATE('2023-12-23', 'YYYY-MM-DD'), 33, 302, 'Completed');

INSERT INTO SalesOrderItem (OrderItemID, OrderID, ProductID, Quantity, UnitPrice) 
VALUES (36, 36, 12, 2, 59.99);

INSERT INTO Payment (PaymentID, OrderID, PaymentMethodID, PaymentDate, Amount) 
VALUES (36, 36, 1, TO_DATE('2023-12-23', 'YYYY-MM-DD'), 119.98);

INSERT INTO Invoice (InvoiceID, OrderID, IssueDate, TotalAmount) 
VALUES (36, 36, TO_DATE('2023-12-23', 'YYYY-MM-DD'), 119.98);









INSERT INTO Customer (CustomerID, FirstName, LastName, Email, PhoneNumber, Address) VALUES 
(71, 'Lizzie', 'Potter', 'lizpotter@aol.com', '4903471123', '38 Elm Way');






SELECT pm.MethodName, COUNT(p.PaymentID) AS PaymentCount
FROM Payment p
JOIN PaymentMethod pm ON p.PaymentMethodID = pm.PaymentMethodID
GROUP BY pm.MethodName
ORDER BY PaymentCount DESC
FETCH FIRST 1 ROWS ONLY;




SELECT c.CustomerID, c.FirstName, c.LastName, COUNT(so.OrderID) AS OrderCount
FROM Customer c
JOIN SalesOrder so ON c.CustomerID = so.CustomerID
GROUP BY c.CustomerID, c.FirstName, c.LastName
ORDER BY OrderCount DESC;



SELECT c.CustomerID, c.FirstName, c.LastName, SUM(p.Amount) AS TotalPaid
FROM Customer c
JOIN SalesOrder so ON c.CustomerID = so.CustomerID
JOIN Payment p ON so.OrderID = p.OrderID
GROUP BY c.CustomerID, c.FirstName, c.LastName
ORDER BY TotalPaid DESC;




SELECT 
    c.CustomerID, 
    c.FirstName, 
    c.LastName, 
    pm.MethodName AS PaymentMethod, 
    p.Amount AS PaymentAmount, 
    p.PaymentDate
FROM 
    Customer c
JOIN 
    SalesOrder so ON c.CustomerID = so.CustomerID
JOIN 
    Payment p ON so.OrderID = p.OrderID
JOIN 
    PaymentMethod pm ON p.PaymentMethodID = pm.PaymentMethodID
WHERE 
    c.CustomerID = 8;
    
    
SELECT 
    c.CustomerID, 
    c.FirstName, 
    c.LastName, 
    pm.MethodName AS PaymentMethod, 
    SUM(p.Amount) AS TotalPaid
FROM 
    Customer c
JOIN 
    SalesOrder so ON c.CustomerID = so.CustomerID
JOIN 
    Payment p ON so.OrderID = p.OrderID
JOIN 
    PaymentMethod pm ON p.PaymentMethodID = pm.PaymentMethodID
GROUP BY 
    c.CustomerID, c.FirstName, c.LastName, pm.MethodName
ORDER BY 
    TotalPaid DESC
FETCH FIRST 2 ROWS ONLY;



