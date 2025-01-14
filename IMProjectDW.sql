-- Drop tables if they exist
BEGIN
   EXECUTE IMMEDIATE 'DROP TABLE FactOrder';
EXCEPTION
   WHEN OTHERS THEN NULL;
END;
/
BEGIN
   EXECUTE IMMEDIATE 'DROP TABLE FactPayment';
EXCEPTION
   WHEN OTHERS THEN NULL;
END;
/
BEGIN
   EXECUTE IMMEDIATE 'DROP TABLE FactOrderItem';
EXCEPTION
   WHEN OTHERS THEN NULL;
END;
/
BEGIN
   EXECUTE IMMEDIATE 'DROP TABLE DimPaymentMethod';
EXCEPTION
   WHEN OTHERS THEN NULL;
END;
/
BEGIN
   EXECUTE IMMEDIATE 'DROP TABLE DimCategory';
EXCEPTION
   WHEN OTHERS THEN NULL;
END;
/
BEGIN
   EXECUTE IMMEDIATE 'DROP TABLE FactShipping';
EXCEPTION
   WHEN OTHERS THEN NULL;
END;
/
BEGIN
   EXECUTE IMMEDIATE 'DROP TABLE DimShipmentMethod';
EXCEPTION
   WHEN OTHERS THEN NULL;
END;
/
BEGIN
   EXECUTE IMMEDIATE 'DROP TABLE FactCustomerFeedback';
EXCEPTION
   WHEN OTHERS THEN NULL;
END;
/
BEGIN
   EXECUTE IMMEDIATE 'DROP TABLE DimCustomer';
EXCEPTION
   WHEN OTHERS THEN NULL;
END;
/
BEGIN
   EXECUTE IMMEDIATE 'DROP TABLE DimDate';
EXCEPTION
   WHEN OTHERS THEN NULL;
END;
/
BEGIN
   EXECUTE IMMEDIATE 'DROP TABLE FactInventory';
EXCEPTION
   WHEN OTHERS THEN NULL;
END;
/
BEGIN
   EXECUTE IMMEDIATE 'DROP TABLE DimProduct';
EXCEPTION
   WHEN OTHERS THEN NULL;
END;
/
BEGIN
   EXECUTE IMMEDIATE 'DROP TABLE DimLocation';
EXCEPTION
   WHEN OTHERS THEN NULL;
END;
/

-- Create tables
CREATE TABLE DimLocation (
  LocationID NUMBER PRIMARY KEY,
  LocationName VARCHAR(50)
);

CREATE TABLE DimProduct (
  ProductID NUMBER PRIMARY KEY,
  ProductName VARCHAR(50),
  ProductDescription VARCHAR(200),
  CategoryID NUMBER,
  CategoryName VARCHAR(50),
  Price NUMBER(10, 2)
);

CREATE TABLE FactInventory (
  InventoryID NUMBER PRIMARY KEY,
  ProductID NUMBER,
  LocationID NUMBER,
  Quantity NUMBER,
  Unit VARCHAR(20),
  DateID NUMBER,
  CONSTRAINT FK_FactInventory_Location FOREIGN KEY (LocationID) REFERENCES DimLocation(LocationID),
  CONSTRAINT FK_FactInventory_Product FOREIGN KEY (ProductID) REFERENCES DimProduct(ProductID)
);

CREATE TABLE DimDate (
  DateID NUMBER PRIMARY KEY,
  FullDate DATE,
  Year NUMBER,
  Quarter NUMBER,
  Month NUMBER,
  Day NUMBER,
  Weekday VARCHAR2(20)
);

CREATE TABLE DimCustomer (
  CustomerID NUMBER PRIMARY KEY,
  CustomerName VARCHAR(50),
  Email VARCHAR(100),
  MobileNumber VARCHAR(15),
  Address VARCHAR2(200)
);

CREATE TABLE FactCustomerFeedback (
  FeedbackID NUMBER PRIMARY KEY,
  CustomerID NUMBER,
  FeedbackDate NUMBER,
  FeedbackText VARCHAR2(200),
  Rating NUMBER,
  CONSTRAINT FK_FactCustomerFeedback_Customer FOREIGN KEY (CustomerID) REFERENCES DimCustomer(CustomerID),
  CONSTRAINT FK_FactCustomerFeedback_FeedbackDate FOREIGN KEY (FeedbackDate) REFERENCES DimDate(DateID)
);

CREATE TABLE DimShipmentMethod (
  ShipmentMethodID NUMBER PRIMARY KEY,
  MethodName VARCHAR2(50)
);

CREATE TABLE FactShipping (
  ShipmentID NUMBER PRIMARY KEY,
  OrderID NUMBER,
  ShipmentDate NUMBER,
  LocationID NUMBER,
  ShippingMethod VARCHAR(50),
  CarrierName VARCHAR(50),
  TrackingNumber VARCHAR(50),
  CONSTRAINT FK_FactShipping_Location FOREIGN KEY (LocationID) REFERENCES DimLocation(LocationID),
  CONSTRAINT FK_FactShipping_ShipmentDate FOREIGN KEY (ShipmentDate) REFERENCES DimDate(DateID)
);

CREATE TABLE DimCategory (
  CategoryID NUMBER PRIMARY KEY,
  CategoryName VARCHAR(50),
  SupplierID NUMBER
);

CREATE TABLE FactOrderItem (
  OrderItemID NUMBER PRIMARY KEY,
  OrderID NUMBER,
  ProductID NUMBER,
  Quantity NUMBER,
  Price NUMBER(10, 2),
  Discount NUMBER(10, 2),
  TotalPrice NUMBER(10, 2),
  CONSTRAINT FK_FactOrderItem_Product FOREIGN KEY (ProductID) REFERENCES DimProduct(ProductID)
);

CREATE TABLE DimPaymentMethod (
  PaymentMethodID NUMBER PRIMARY KEY,
  MethodName VARCHAR(50)
);

CREATE TABLE FactPayment (
  PaymentID NUMBER PRIMARY KEY,
  OrderID NUMBER,
  PaymentDate NUMBER,
  Amount NUMBER(10, 2),
  PaymentMethod NUMBER,
  CONSTRAINT FK_FactPayment_Method FOREIGN KEY (PaymentMethod) REFERENCES DimPaymentMethod(PaymentMethodID)
);

CREATE TABLE FactOrder (
  OrderID NUMBER PRIMARY KEY,
  CustomerID NUMBER,
  OrderDate NUMBER,
  DeliveryDate NUMBER,
  SubtotalAmount NUMBER(10, 2),
  Status VARCHAR(50),
  CONSTRAINT FK_FactOrder_OrderDate FOREIGN KEY (OrderDate) REFERENCES DimDate(DateID),
  CONSTRAINT FK_FactOrder_DeliveryDate FOREIGN KEY (DeliveryDate) REFERENCES DimDate(DateID),
  CONSTRAINT FK_FactOrder_Customer FOREIGN KEY (CustomerID) REFERENCES DimCustomer(CustomerID)
);


SELECT * FROM DimLocation;

SELECT * FROM DimProduct;

SELECT * FROM FactInventory;

SELECT * FROM DimDate;

SELECT * FROM DimCustomer;

SELECT * FROM FactCustomerFeedback;

SELECT * FROM DimShipmentMethod;

SELECT * FROM FactShipping;

SELECT * FROM DimCategory;

SELECT * FROM FactOrderItem;

SELECT * FROM DimPaymentMethod;

SELECT * FROM FactPayment;

SELECT * FROM FactOrder;
