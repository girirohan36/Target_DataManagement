-- Drop tables if they exist
BEGIN
   EXECUTE IMMEDIATE 'DROP TABLE CustomerPreferences CASCADE CONSTRAINTS';
EXCEPTION
   WHEN OTHERS THEN NULL;
END;
/
BEGIN
   EXECUTE IMMEDIATE 'DROP TABLE CustomerFeedback CASCADE CONSTRAINTS';
EXCEPTION
   WHEN OTHERS THEN NULL;
END;
/
BEGIN
   EXECUTE IMMEDIATE 'DROP TABLE PurchaseHistory CASCADE CONSTRAINTS';
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
   EXECUTE IMMEDIATE 'DROP TABLE LoyaltyProgram CASCADE CONSTRAINTS';
EXCEPTION
   WHEN OTHERS THEN NULL;
END;
/

-- Create tables
CREATE TABLE LoyaltyProgram (
  LoyaltyID NUMBER PRIMARY KEY,
  CustomerID NUMBER,
  LoyaltyPoints NUMBER,
  ExpiryDate DATE
);

CREATE TABLE Customer (
  CustomerID NUMBER PRIMARY KEY,
  FirstName VARCHAR2(30),
  LastName VARCHAR2(30),
  Email VARCHAR2(30),
  FeedbackID NUMBER,
  LoyaltyID NUMBER,
  PreferenceID NUMBER,
  PurchaseID NUMBER,
  CONSTRAINT FK_Customer_Loyalty FOREIGN KEY (LoyaltyID) REFERENCES LoyaltyProgram(LoyaltyID)
);

CREATE TABLE PurchaseHistory (
  PurchaseID NUMBER,
  CustomerID NUMBER,
  PurchaseDate DATE,
  Quantity FLOAT,
  TotalAmount FLOAT,
  CONSTRAINT FK_PurchaseHistory_Customer FOREIGN KEY (CustomerID) REFERENCES Customer(CustomerID)
);

CREATE TABLE CustomerFeedback (
  FeedbackID NUMBER PRIMARY KEY,
  CustomerID NUMBER,
  FeedbackDate DATE,
  FeedbackText VARCHAR2(60),
  Rating NUMBER,
  CONSTRAINT FK_CustomerFeedback_Customer FOREIGN KEY (CustomerID) REFERENCES Customer(CustomerID)
);

CREATE TABLE CustomerPreferences (
  PreferenceID NUMBER PRIMARY KEY,
  CustomerID NUMBER,
  ProductCategories VARCHAR2(30),
  NewsletterSubscribed CHAR(1), -- Use 'Y' or 'N' for boolean values
  PreferredContactMethod VARCHAR2(30),
  CONSTRAINT FK_CustomerPreferences_Customer FOREIGN KEY (CustomerID) REFERENCES Customer(CustomerID)
);


INSERT INTO LoyaltyProgram (LoyaltyID, CustomerID, LoyaltyPoints, ExpiryDate) VALUES (1, 1, 500, TO_DATE('2024-12-31', 'YYYY-MM-DD'));
INSERT INTO LoyaltyProgram (LoyaltyID, CustomerID, LoyaltyPoints, ExpiryDate) VALUES (2, 2, 300, TO_DATE('2024-11-30', 'YYYY-MM-DD'));
INSERT INTO LoyaltyProgram (LoyaltyID, CustomerID, LoyaltyPoints, ExpiryDate) VALUES (3, 3, 700, TO_DATE('2025-01-15', 'YYYY-MM-DD'));
INSERT INTO LoyaltyProgram (LoyaltyID, CustomerID, LoyaltyPoints, ExpiryDate) VALUES (4, 4, 250, TO_DATE('2024-10-15', 'YYYY-MM-DD'));
INSERT INTO LoyaltyProgram (LoyaltyID, CustomerID, LoyaltyPoints, ExpiryDate) VALUES (5, 5, 1000, TO_DATE('2025-05-20', 'YYYY-MM-DD'));

INSERT INTO Customer (CustomerID, FirstName, LastName, Email, FeedbackID, LoyaltyID, PreferenceID, PurchaseID) VALUES (1, 'Alice', 'Johnson', 'alice.johnson@example.com', 101, 1, 201, 301);
INSERT INTO Customer (CustomerID, FirstName, LastName, Email, FeedbackID, LoyaltyID, PreferenceID, PurchaseID) VALUES (2, 'Bob', 'Smith', 'bob.smith@example.com', 102, 2, 202, 302);
INSERT INTO Customer (CustomerID, FirstName, LastName, Email, FeedbackID, LoyaltyID, PreferenceID, PurchaseID) VALUES (3, 'Charlie', 'Brown', 'charlie.brown@example.com', 103, 3, 203, 303);
INSERT INTO Customer (CustomerID, FirstName, LastName, Email, FeedbackID, LoyaltyID, PreferenceID, PurchaseID) VALUES (4, 'Diana', 'Prince', 'diana.prince@example.com', 104, 4, 204, 304);
INSERT INTO Customer (CustomerID, FirstName, LastName, Email, FeedbackID, LoyaltyID, PreferenceID, PurchaseID) VALUES (5, 'Eve', 'Davis', 'eve.davis@example.com', 105, 5, 205, 305);


INSERT INTO PurchaseHistory (PurchaseID, CustomerID, PurchaseDate, Quantity, TotalAmount) VALUES (301, 1, TO_DATE('2023-11-01', 'YYYY-MM-DD'), 2, 1399.98);
INSERT INTO PurchaseHistory (PurchaseID, CustomerID, PurchaseDate, Quantity, TotalAmount) VALUES (302, 2, TO_DATE('2023-11-02', 'YYYY-MM-DD'), 1, 999.99);
INSERT INTO PurchaseHistory (PurchaseID, CustomerID, PurchaseDate, Quantity, TotalAmount) VALUES (303, 3, TO_DATE('2023-11-03', 'YYYY-MM-DD'), 3, 599.97);
INSERT INTO PurchaseHistory (PurchaseID, CustomerID, PurchaseDate, Quantity, TotalAmount) VALUES (304, 4, TO_DATE('2023-11-04', 'YYYY-MM-DD'), 1, 49.99);
INSERT INTO PurchaseHistory (PurchaseID, CustomerID, PurchaseDate, Quantity, TotalAmount) VALUES (305, 5, TO_DATE('2023-11-05', 'YYYY-MM-DD'), 1, 89.99);


INSERT INTO CustomerFeedback (FeedbackID, CustomerID, FeedbackDate, FeedbackText, Rating) VALUES (101, 1, TO_DATE('2023-11-05', 'YYYY-MM-DD'), 'Great service and fast delivery!', 5);
INSERT INTO CustomerFeedback (FeedbackID, CustomerID, FeedbackDate, FeedbackText, Rating) VALUES (102, 2, TO_DATE('2023-11-06', 'YYYY-MM-DD'), 'Satisfied with the product.', 4);
INSERT INTO CustomerFeedback (FeedbackID, CustomerID, FeedbackDate, FeedbackText, Rating) VALUES (103, 3, TO_DATE('2023-11-07', 'YYYY-MM-DD'), 'Good quality, but delivery was late.', 3);
INSERT INTO CustomerFeedback (FeedbackID, CustomerID, FeedbackDate, FeedbackText, Rating) VALUES (104, 4, TO_DATE('2023-11-08', 'YYYY-MM-DD'), 'Product not as described.', 2);
INSERT INTO CustomerFeedback (FeedbackID, CustomerID, FeedbackDate, FeedbackText, Rating) VALUES (105, 5, TO_DATE('2023-11-09', 'YYYY-MM-DD'), 'Exceptional product and service!', 5);


INSERT INTO CustomerPreferences (PreferenceID, CustomerID, ProductCategories, NewsletterSubscribed, PreferredContactMethod) VALUES (201, 1, 'Electronics', 'Y', 'Email');
INSERT INTO CustomerPreferences (PreferenceID, CustomerID, ProductCategories, NewsletterSubscribed, PreferredContactMethod) VALUES (202, 2, 'Accessories', 'N', 'Phone');
INSERT INTO CustomerPreferences (PreferenceID, CustomerID, ProductCategories, NewsletterSubscribed, PreferredContactMethod) VALUES (203, 3, 'Home Appliances', 'Y', 'Email');
INSERT INTO CustomerPreferences (PreferenceID, CustomerID, ProductCategories, NewsletterSubscribed, PreferredContactMethod) VALUES (204, 4, 'Clothing', 'N', 'Phone');
INSERT INTO CustomerPreferences (PreferenceID, CustomerID, ProductCategories, NewsletterSubscribed, PreferredContactMethod) VALUES (205, 5, 'Furniture', 'Y', 'Email');






INSERT INTO LoyaltyProgram (LoyaltyID, CustomerID, LoyaltyPoints, ExpiryDate) VALUES (6, 6, 400, TO_DATE('2025-01-01', 'YYYY-MM-DD'));
INSERT INTO LoyaltyProgram (LoyaltyID, CustomerID, LoyaltyPoints, ExpiryDate) VALUES (7, 7, 350, TO_DATE('2025-03-01', 'YYYY-MM-DD'));
INSERT INTO LoyaltyProgram (LoyaltyID, CustomerID, LoyaltyPoints, ExpiryDate) VALUES (8, 8, 600, TO_DATE('2025-06-30', 'YYYY-MM-DD'));
INSERT INTO LoyaltyProgram (LoyaltyID, CustomerID, LoyaltyPoints, ExpiryDate) VALUES (9, 9, 500, TO_DATE('2025-09-15', 'YYYY-MM-DD'));
INSERT INTO LoyaltyProgram (LoyaltyID, CustomerID, LoyaltyPoints, ExpiryDate) VALUES (10, 10, 700, TO_DATE('2025-12-31', 'YYYY-MM-DD'));


INSERT INTO Customer (CustomerID, FirstName, LastName, Email, FeedbackID, LoyaltyID, PreferenceID, PurchaseID) VALUES (6, 'Frank', 'Martin', 'frank.martin@example.com', 106, 6, 206, 306);
INSERT INTO Customer (CustomerID, FirstName, LastName, Email, FeedbackID, LoyaltyID, PreferenceID, PurchaseID) VALUES (7, 'Grace', 'Adams', 'grace.adams@example.com', 107, 7, 207, 307);
INSERT INTO Customer (CustomerID, FirstName, LastName, Email, FeedbackID, LoyaltyID, PreferenceID, PurchaseID) VALUES (8, 'Hank', 'Green', 'hank.green@example.com', 108, 8, 208, 308);
INSERT INTO Customer (CustomerID, FirstName, LastName, Email, FeedbackID, LoyaltyID, PreferenceID, PurchaseID) VALUES (9, 'Ivy', 'White', 'ivy.white@example.com', 109, 9, 209, 309);
INSERT INTO Customer (CustomerID, FirstName, LastName, Email, FeedbackID, LoyaltyID, PreferenceID, PurchaseID) VALUES (10, 'Jack', 'Black', 'jack.black@example.com', 110, 10, 210, 310);


INSERT INTO PurchaseHistory (PurchaseID, CustomerID, PurchaseDate, Quantity, TotalAmount) VALUES (306, 6, TO_DATE('2024-01-01', 'YYYY-MM-DD'), 3, 449.97);
INSERT INTO PurchaseHistory (PurchaseID, CustomerID, PurchaseDate, Quantity, TotalAmount) VALUES (307, 7, TO_DATE('2024-02-15', 'YYYY-MM-DD'), 1, 119.99);
INSERT INTO PurchaseHistory (PurchaseID, CustomerID, PurchaseDate, Quantity, TotalAmount) VALUES (308, 8, TO_DATE('2024-03-20', 'YYYY-MM-DD'), 2, 239.98);
INSERT INTO PurchaseHistory (PurchaseID, CustomerID, PurchaseDate, Quantity, TotalAmount) VALUES (309, 9, TO_DATE('2024-04-10', 'YYYY-MM-DD'), 4, 199.96);
INSERT INTO PurchaseHistory (PurchaseID, CustomerID, PurchaseDate, Quantity, TotalAmount) VALUES (310, 10, TO_DATE('2024-05-05', 'YYYY-MM-DD'), 1, 99.99);


INSERT INTO CustomerFeedback (FeedbackID, CustomerID, FeedbackDate, FeedbackText, Rating) VALUES (106, 6, TO_DATE('2024-01-05', 'YYYY-MM-DD'), 'Loved the product!', 5);
INSERT INTO CustomerFeedback (FeedbackID, CustomerID, FeedbackDate, FeedbackText, Rating) VALUES (107, 7, TO_DATE('2024-02-18', 'YYYY-MM-DD'), 'Good value for money.', 4);
INSERT INTO CustomerFeedback (FeedbackID, CustomerID, FeedbackDate, FeedbackText, Rating) VALUES (108, 8, TO_DATE('2024-03-25', 'YYYY-MM-DD'), 'Delivery was late.', 3);
INSERT INTO CustomerFeedback (FeedbackID, CustomerID, FeedbackDate, FeedbackText, Rating) VALUES (109, 9, TO_DATE('2024-04-15', 'YYYY-MM-DD'), 'Excellent customer service!', 5);
INSERT INTO CustomerFeedback (FeedbackID, CustomerID, FeedbackDate, FeedbackText, Rating) VALUES (110, 10, TO_DATE('2024-05-10', 'YYYY-MM-DD'), 'Product quality is great!', 5);


INSERT INTO CustomerPreferences (PreferenceID, CustomerID, ProductCategories, NewsletterSubscribed, PreferredContactMethod) VALUES (206, 6, 'Books', 'Y', 'Email');
INSERT INTO CustomerPreferences (PreferenceID, CustomerID, ProductCategories, NewsletterSubscribed, PreferredContactMethod) VALUES (207, 7, 'Toys', 'N', 'Phone');
INSERT INTO CustomerPreferences (PreferenceID, CustomerID, ProductCategories, NewsletterSubscribed, PreferredContactMethod) VALUES (208, 8, 'Clothing', 'Y', 'Email');
INSERT INTO CustomerPreferences (PreferenceID, CustomerID, ProductCategories, NewsletterSubscribed, PreferredContactMethod) VALUES (209, 9, 'Furniture', 'N', 'Phone');
INSERT INTO CustomerPreferences (PreferenceID, CustomerID, ProductCategories, NewsletterSubscribed, PreferredContactMethod) VALUES (210, 10, 'Groceries', 'Y', 'Email');





INSERT INTO LoyaltyProgram (LoyaltyID, CustomerID, LoyaltyPoints, ExpiryDate) VALUES (11, 11, 450, TO_DATE('2025-01-15', 'YYYY-MM-DD'));
INSERT INTO LoyaltyProgram (LoyaltyID, CustomerID, LoyaltyPoints, ExpiryDate) VALUES (12, 12, 500, TO_DATE('2025-02-28', 'YYYY-MM-DD'));
INSERT INTO LoyaltyProgram (LoyaltyID, CustomerID, LoyaltyPoints, ExpiryDate) VALUES (13, 13, 800, TO_DATE('2025-06-30', 'YYYY-MM-DD'));
INSERT INTO LoyaltyProgram (LoyaltyID, CustomerID, LoyaltyPoints, ExpiryDate) VALUES (14, 14, 600, TO_DATE('2025-09-15', 'YYYY-MM-DD'));
INSERT INTO LoyaltyProgram (LoyaltyID, CustomerID, LoyaltyPoints, ExpiryDate) VALUES (15, 15, 750, TO_DATE('2025-12-31', 'YYYY-MM-DD'));


INSERT INTO Customer (CustomerID, FirstName, LastName, Email, FeedbackID, LoyaltyID, PreferenceID, PurchaseID) VALUES (11, 'Kelly', 'Johnson', 'kelly.johnson@example.com', 111, 11, 211, 311);
INSERT INTO Customer (CustomerID, FirstName, LastName, Email, FeedbackID, LoyaltyID, PreferenceID, PurchaseID) VALUES (12, 'Leo', 'Smith', 'leo.smith@example.com', 112, 12, 212, 312);
INSERT INTO Customer (CustomerID, FirstName, LastName, Email, FeedbackID, LoyaltyID, PreferenceID, PurchaseID) VALUES (13, 'Maya', 'Carter', 'maya.carter@example.com', 113, 13, 213, 313);
INSERT INTO Customer (CustomerID, FirstName, LastName, Email, FeedbackID, LoyaltyID, PreferenceID, PurchaseID) VALUES (14, 'Noah', 'Baker', 'noah.baker@example.com', 114, 14, 214, 314);
INSERT INTO Customer (CustomerID, FirstName, LastName, Email, FeedbackID, LoyaltyID, PreferenceID, PurchaseID) VALUES (15, 'Olivia', 'Reed', 'olivia.reed@example.com', 115, 15, 215, 315);



INSERT INTO PurchaseHistory (PurchaseID, CustomerID, PurchaseDate, Quantity, TotalAmount) VALUES (311, 11, TO_DATE('2024-06-01', 'YYYY-MM-DD'), 2, 799.98);
INSERT INTO PurchaseHistory (PurchaseID, CustomerID, PurchaseDate, Quantity, TotalAmount) VALUES (312, 12, TO_DATE('2024-07-10', 'YYYY-MM-DD'), 1, 499.99);
INSERT INTO PurchaseHistory (PurchaseID, CustomerID, PurchaseDate, Quantity, TotalAmount) VALUES (313, 13, TO_DATE('2024-08-20', 'YYYY-MM-DD'), 4, 999.96);
INSERT INTO PurchaseHistory (PurchaseID, CustomerID, PurchaseDate, Quantity, TotalAmount) VALUES (314, 14, TO_DATE('2024-09-15', 'YYYY-MM-DD'), 3, 749.97);
INSERT INTO PurchaseHistory (PurchaseID, CustomerID, PurchaseDate, Quantity, TotalAmount) VALUES (315, 15, TO_DATE('2024-10-05', 'YYYY-MM-DD'), 1, 249.99);


INSERT INTO CustomerFeedback (FeedbackID, CustomerID, FeedbackDate, FeedbackText, Rating) VALUES (111, 11, TO_DATE('2024-06-05', 'YYYY-MM-DD'), 'Fantastic customer experience!', 5);
INSERT INTO CustomerFeedback (FeedbackID, CustomerID, FeedbackDate, FeedbackText, Rating) VALUES (112, 12, TO_DATE('2024-07-15', 'YYYY-MM-DD'), 'Product as expected, good delivery.', 4);
INSERT INTO CustomerFeedback (FeedbackID, CustomerID, FeedbackDate, FeedbackText, Rating) VALUES (113, 13, TO_DATE('2024-08-25', 'YYYY-MM-DD'), 'Loved the quality, will buy again.', 5);
INSERT INTO CustomerFeedback (FeedbackID, CustomerID, FeedbackDate, FeedbackText, Rating) VALUES (114, 14, TO_DATE('2024-09-20', 'YYYY-MM-DD'), 'Slightly overpriced, but great service.', 4);
INSERT INTO CustomerFeedback (FeedbackID, CustomerID, FeedbackDate, FeedbackText, Rating) VALUES (115, 15, TO_DATE('2024-10-10', 'YYYY-MM-DD'), 'Excellent product, worth the money.', 5);


INSERT INTO CustomerPreferences (PreferenceID, CustomerID, ProductCategories, NewsletterSubscribed, PreferredContactMethod) VALUES (211, 11, 'Kitchen Appliances', 'Y', 'Email');
INSERT INTO CustomerPreferences (PreferenceID, CustomerID, ProductCategories, NewsletterSubscribed, PreferredContactMethod) VALUES (212, 12, 'Electronics', 'N', 'Phone');
INSERT INTO CustomerPreferences (PreferenceID, CustomerID, ProductCategories, NewsletterSubscribed, PreferredContactMethod) VALUES (213, 13, 'Books', 'Y', 'Email');
INSERT INTO CustomerPreferences (PreferenceID, CustomerID, ProductCategories, NewsletterSubscribed, PreferredContactMethod) VALUES (214, 14, 'Home Decor', 'N', 'Phone');
INSERT INTO CustomerPreferences (PreferenceID, CustomerID, ProductCategories, NewsletterSubscribed, PreferredContactMethod) VALUES (215, 15, 'Groceries', 'Y', 'Email');








INSERT INTO LoyaltyProgram (LoyaltyID, CustomerID, LoyaltyPoints, ExpiryDate) VALUES (16, 16, 800, TO_DATE('2025-06-30', 'YYYY-MM-DD'));
INSERT INTO LoyaltyProgram (LoyaltyID, CustomerID, LoyaltyPoints, ExpiryDate) VALUES (17, 17, 550, TO_DATE('2025-03-15', 'YYYY-MM-DD'));
INSERT INTO LoyaltyProgram (LoyaltyID, CustomerID, LoyaltyPoints, ExpiryDate) VALUES (18, 18, 400, TO_DATE('2025-01-10', 'YYYY-MM-DD'));
INSERT INTO LoyaltyProgram (LoyaltyID, CustomerID, LoyaltyPoints, ExpiryDate) VALUES (19, 19, 700, TO_DATE('2025-12-31', 'YYYY-MM-DD'));
INSERT INTO LoyaltyProgram (LoyaltyID, CustomerID, LoyaltyPoints, ExpiryDate) VALUES (20, 20, 600, TO_DATE('2025-07-15', 'YYYY-MM-DD'));

INSERT INTO Customer (CustomerID, FirstName, LastName, Email, FeedbackID, LoyaltyID, PreferenceID, PurchaseID) VALUES (16, 'Paul', 'Harris', 'paul.harris@example.com', 116, 16, 216, 316);
INSERT INTO Customer (CustomerID, FirstName, LastName, Email, FeedbackID, LoyaltyID, PreferenceID, PurchaseID) VALUES (17, 'Quinn', 'Foster', 'quinn.foster@example.com', 117, 17, 217, 317);
INSERT INTO Customer (CustomerID, FirstName, LastName, Email, FeedbackID, LoyaltyID, PreferenceID, PurchaseID) VALUES (18, 'Ryan', 'Walker', 'ryan.walker@example.com', 118, 18, 218, 318);
INSERT INTO Customer (CustomerID, FirstName, LastName, Email, FeedbackID, LoyaltyID, PreferenceID, PurchaseID) VALUES (19, 'Sophia', 'Evans', 'sophia.evans@example.com', 119, 19, 219, 319);
INSERT INTO Customer (CustomerID, FirstName, LastName, Email, FeedbackID, LoyaltyID, PreferenceID, PurchaseID) VALUES (20, 'Tom', 'Bennett', 'tom.bennett@example.com', 120, 20, 220, 320);

INSERT INTO PurchaseHistory (PurchaseID, CustomerID, PurchaseDate, Quantity, TotalAmount) VALUES (316, 16, TO_DATE('2024-01-01', 'YYYY-MM-DD'), 3, 599.97);
INSERT INTO PurchaseHistory (PurchaseID, CustomerID, PurchaseDate, Quantity, TotalAmount) VALUES (317, 17, TO_DATE('2024-02-15', 'YYYY-MM-DD'), 2, 299.98);
INSERT INTO PurchaseHistory (PurchaseID, CustomerID, PurchaseDate, Quantity, TotalAmount) VALUES (318, 18, TO_DATE('2024-03-20', 'YYYY-MM-DD'), 1, 199.99);
INSERT INTO PurchaseHistory (PurchaseID, CustomerID, PurchaseDate, Quantity, TotalAmount) VALUES (319, 19, TO_DATE('2024-04-10', 'YYYY-MM-DD'), 4, 799.96);
INSERT INTO PurchaseHistory (PurchaseID, CustomerID, PurchaseDate, Quantity, TotalAmount) VALUES (320, 20, TO_DATE('2024-05-05', 'YYYY-MM-DD'), 1, 99.99);


INSERT INTO CustomerFeedback (FeedbackID, CustomerID, FeedbackDate, FeedbackText, Rating) VALUES (116, 16, TO_DATE('2024-01-05', 'YYYY-MM-DD'), 'Great product and timely delivery!', 5);
INSERT INTO CustomerFeedback (FeedbackID, CustomerID, FeedbackDate, FeedbackText, Rating) VALUES (117, 17, TO_DATE('2024-02-20', 'YYYY-MM-DD'), 'Satisfied with the product.', 4);
INSERT INTO CustomerFeedback (FeedbackID, CustomerID, FeedbackDate, FeedbackText, Rating) VALUES (118, 18, TO_DATE('2024-03-25', 'YYYY-MM-DD'), 'Delivery was late but quality is good.', 3);
INSERT INTO CustomerFeedback (FeedbackID, CustomerID, FeedbackDate, FeedbackText, Rating) VALUES (119, 19, TO_DATE('2024-04-15', 'YYYY-MM-DD'), 'Exceptional customer service!', 5);
INSERT INTO CustomerFeedback (FeedbackID, CustomerID, FeedbackDate, FeedbackText, Rating) VALUES (120, 20, TO_DATE('2024-05-10', 'YYYY-MM-DD'), 'Excellent quality, would buy again.', 5);

INSERT INTO CustomerPreferences (PreferenceID, CustomerID, ProductCategories, NewsletterSubscribed, PreferredContactMethod) VALUES (216, 16, 'Books', 'Y', 'Email');
INSERT INTO CustomerPreferences (PreferenceID, CustomerID, ProductCategories, NewsletterSubscribed, PreferredContactMethod) VALUES (217, 17, 'Clothing', 'N', 'Phone');
INSERT INTO CustomerPreferences (PreferenceID, CustomerID, ProductCategories, NewsletterSubscribed, PreferredContactMethod) VALUES (218, 18, 'Furniture', 'Y', 'Email');
INSERT INTO CustomerPreferences (PreferenceID, CustomerID, ProductCategories, NewsletterSubscribed, PreferredContactMethod) VALUES (219, 19, 'Groceries', 'N', 'Phone');
INSERT INTO CustomerPreferences (PreferenceID, CustomerID, ProductCategories, NewsletterSubscribed, PreferredContactMethod) VALUES (220, 20, 'Home Appliances', 'Y', 'Email');




INSERT INTO LoyaltyProgram (LoyaltyID, CustomerID, LoyaltyPoints, ExpiryDate) VALUES (21, 21, 550, TO_DATE('2025-04-30', 'YYYY-MM-DD'));
INSERT INTO LoyaltyProgram (LoyaltyID, CustomerID, LoyaltyPoints, ExpiryDate) VALUES (22, 22, 700, TO_DATE('2025-06-15', 'YYYY-MM-DD'));
INSERT INTO LoyaltyProgram (LoyaltyID, CustomerID, LoyaltyPoints, ExpiryDate) VALUES (23, 23, 600, TO_DATE('2025-08-20', 'YYYY-MM-DD'));
INSERT INTO LoyaltyProgram (LoyaltyID, CustomerID, LoyaltyPoints, ExpiryDate) VALUES (24, 24, 800, TO_DATE('2025-10-10', 'YYYY-MM-DD'));
INSERT INTO LoyaltyProgram (LoyaltyID, CustomerID, LoyaltyPoints, ExpiryDate) VALUES (25, 25, 900, TO_DATE('2025-12-31', 'YYYY-MM-DD'));

INSERT INTO Customer (CustomerID, FirstName, LastName, Email, FeedbackID, LoyaltyID, PreferenceID, PurchaseID) VALUES (21, 'Uma', 'Scott', 'uma.scott@example.com', 121, 21, 221, 321);
INSERT INTO Customer (CustomerID, FirstName, LastName, Email, FeedbackID, LoyaltyID, PreferenceID, PurchaseID) VALUES (22, 'Victor', 'Mills', 'victor.mills@example.com', 122, 22, 222, 322);
INSERT INTO Customer (CustomerID, FirstName, LastName, Email, FeedbackID, LoyaltyID, PreferenceID, PurchaseID) VALUES (23, 'Wendy', 'Gray', 'wendy.gray@example.com', 123, 23, 223, 323);
INSERT INTO Customer (CustomerID, FirstName, LastName, Email, FeedbackID, LoyaltyID, PreferenceID, PurchaseID) VALUES (24, 'Xander', 'Taylor', 'xander.taylor@example.com', 124, 24, 224, 324);
INSERT INTO Customer (CustomerID, FirstName, LastName, Email, FeedbackID, LoyaltyID, PreferenceID, PurchaseID) VALUES (25, 'Yasmine', 'Hall', 'yasmine.hall@example.com', 125, 25, 225, 325);

INSERT INTO PurchaseHistory (PurchaseID, CustomerID, PurchaseDate, Quantity, TotalAmount) VALUES (321, 21, TO_DATE('2024-01-20', 'YYYY-MM-DD'), 2, 499.98);
INSERT INTO PurchaseHistory (PurchaseID, CustomerID, PurchaseDate, Quantity, TotalAmount) VALUES (322, 22, TO_DATE('2024-02-25', 'YYYY-MM-DD'), 1, 299.99);
INSERT INTO PurchaseHistory (PurchaseID, CustomerID, PurchaseDate, Quantity, TotalAmount) VALUES (323, 23, TO_DATE('2024-03-15', 'YYYY-MM-DD'), 3, 599.97);
INSERT INTO PurchaseHistory (PurchaseID, CustomerID, PurchaseDate, Quantity, TotalAmount) VALUES (324, 24, TO_DATE('2024-04-10', 'YYYY-MM-DD'), 1, 199.99);
INSERT INTO PurchaseHistory (PurchaseID, CustomerID, PurchaseDate, Quantity, TotalAmount) VALUES (325, 25, TO_DATE('2024-05-05', 'YYYY-MM-DD'), 4, 999.96);

INSERT INTO CustomerFeedback (FeedbackID, CustomerID, FeedbackDate, FeedbackText, Rating) VALUES (121, 21, TO_DATE('2024-01-25', 'YYYY-MM-DD'), 'Fast delivery, great service.', 5);
INSERT INTO CustomerFeedback (FeedbackID, CustomerID, FeedbackDate, FeedbackText, Rating) VALUES (122, 22, TO_DATE('2024-02-28', 'YYYY-MM-DD'), 'Good product but expensive.', 4);
INSERT INTO CustomerFeedback (FeedbackID, CustomerID, FeedbackDate, FeedbackText, Rating) VALUES (123, 23, TO_DATE('2024-03-20', 'YYYY-MM-DD'), 'Very satisfied, highly recommend.', 5);
INSERT INTO CustomerFeedback (FeedbackID, CustomerID, FeedbackDate, FeedbackText, Rating) VALUES (124, 24, TO_DATE('2024-04-15', 'YYYY-MM-DD'), 'Product quality is okay.', 3);
INSERT INTO CustomerFeedback (FeedbackID, CustomerID, FeedbackDate, FeedbackText, Rating) VALUES (125, 25, TO_DATE('2024-05-10', 'YYYY-MM-DD'), 'Excellent value for money.', 5);

INSERT INTO CustomerPreferences (PreferenceID, CustomerID, ProductCategories, NewsletterSubscribed, PreferredContactMethod) VALUES (221, 21, 'Sports Equipment', 'Y', 'Email');
INSERT INTO CustomerPreferences (PreferenceID, CustomerID, ProductCategories, NewsletterSubscribed, PreferredContactMethod) VALUES (222, 22, 'Books', 'N', 'Phone');
INSERT INTO CustomerPreferences (PreferenceID, CustomerID, ProductCategories, NewsletterSubscribed, PreferredContactMethod) VALUES (223, 23, 'Fashion', 'Y', 'Email');
INSERT INTO CustomerPreferences (PreferenceID, CustomerID, ProductCategories, NewsletterSubscribed, PreferredContactMethod) VALUES (224, 24, 'Furniture', 'N', 'Phone');
INSERT INTO CustomerPreferences (PreferenceID, CustomerID, ProductCategories, NewsletterSubscribed, PreferredContactMethod) VALUES (225, 25, 'Groceries', 'Y', 'Email');



-- LoyaltyProgram
INSERT INTO LoyaltyProgram (LoyaltyID, CustomerID, LoyaltyPoints, ExpiryDate) VALUES (26, 26, 650, TO_DATE('2025-05-20', 'YYYY-MM-DD'));
INSERT INTO LoyaltyProgram (LoyaltyID, CustomerID, LoyaltyPoints, ExpiryDate) VALUES (27, 27, 700, TO_DATE('2025-07-15', 'YYYY-MM-DD'));
INSERT INTO LoyaltyProgram (LoyaltyID, CustomerID, LoyaltyPoints, ExpiryDate) VALUES (28, 28, 550, TO_DATE('2025-09-10', 'YYYY-MM-DD'));
INSERT INTO LoyaltyProgram (LoyaltyID, CustomerID, LoyaltyPoints, ExpiryDate) VALUES (29, 29, 800, TO_DATE('2025-11-25', 'YYYY-MM-DD'));
INSERT INTO LoyaltyProgram (LoyaltyID, CustomerID, LoyaltyPoints, ExpiryDate) VALUES (30, 30, 900, TO_DATE('2025-12-31', 'YYYY-MM-DD'));

-- Customer
INSERT INTO Customer (CustomerID, FirstName, LastName, Email, FeedbackID, LoyaltyID, PreferenceID, PurchaseID) VALUES (26, 'Zane', 'Lee', 'zane.lee@example.com', 126, 26, 226, 326);
INSERT INTO Customer (CustomerID, FirstName, LastName, Email, FeedbackID, LoyaltyID, PreferenceID, PurchaseID) VALUES (27, 'Alice', 'Ford', 'alice.ford@example.com', 127, 27, 227, 327);
INSERT INTO Customer (CustomerID, FirstName, LastName, Email, FeedbackID, LoyaltyID, PreferenceID, PurchaseID) VALUES (28, 'Bob', 'Grant', 'bob.grant@example.com', 128, 28, 228, 328);
INSERT INTO Customer (CustomerID, FirstName, LastName, Email, FeedbackID, LoyaltyID, PreferenceID, PurchaseID) VALUES (29, 'Chris', 'Howard', 'chris.howard@example.com', 129, 29, 229, 329);
INSERT INTO Customer (CustomerID, FirstName, LastName, Email, FeedbackID, LoyaltyID, PreferenceID, PurchaseID) VALUES (30, 'Dana', 'Ivy', 'dana.ivy@example.com', 130, 30, 230, 330);

-- PurchaseHistory
INSERT INTO PurchaseHistory (PurchaseID, CustomerID, PurchaseDate, Quantity, TotalAmount) VALUES (326, 26, TO_DATE('2024-06-05', 'YYYY-MM-DD'), 2, 499.98);
INSERT INTO PurchaseHistory (PurchaseID, CustomerID, PurchaseDate, Quantity, TotalAmount) VALUES (327, 27, TO_DATE('2024-07-12', 'YYYY-MM-DD'), 1, 249.99);
INSERT INTO PurchaseHistory (PurchaseID, CustomerID, PurchaseDate, Quantity, TotalAmount) VALUES (328, 28, TO_DATE('2024-08-18', 'YYYY-MM-DD'), 3, 749.97);
INSERT INTO PurchaseHistory (PurchaseID, CustomerID, PurchaseDate, Quantity, TotalAmount) VALUES (329, 29, TO_DATE('2024-09-25', 'YYYY-MM-DD'), 1, 199.99);
INSERT INTO PurchaseHistory (PurchaseID, CustomerID, PurchaseDate, Quantity, TotalAmount) VALUES (330, 30, TO_DATE('2024-10-30', 'YYYY-MM-DD'), 4, 999.96);

-- CustomerFeedback
INSERT INTO CustomerFeedback (FeedbackID, CustomerID, FeedbackDate, FeedbackText, Rating) VALUES (126, 26, TO_DATE('2024-06-10', 'YYYY-MM-DD'), 'Quick delivery and great product.', 5);
INSERT INTO CustomerFeedback (FeedbackID, CustomerID, FeedbackDate, FeedbackText, Rating) VALUES (127, 27, TO_DATE('2024-07-15', 'YYYY-MM-DD'), 'Satisfied with the purchase.', 4);
INSERT INTO CustomerFeedback (FeedbackID, CustomerID, FeedbackDate, FeedbackText, Rating) VALUES (128, 28, TO_DATE('2024-08-20', 'YYYY-MM-DD'), 'Quality exceeded expectations.', 5);
INSERT INTO CustomerFeedback (FeedbackID, CustomerID, FeedbackDate, FeedbackText, Rating) VALUES (129, 29, TO_DATE('2024-09-28', 'YYYY-MM-DD'), 'Good value for the price.', 4);
INSERT INTO CustomerFeedback (FeedbackID, CustomerID, FeedbackDate, FeedbackText, Rating) VALUES (130, 30, TO_DATE('2024-11-01', 'YYYY-MM-DD'), 'Amazing product, highly recommend.', 5);

-- CustomerPreferences
INSERT INTO CustomerPreferences (PreferenceID, CustomerID, ProductCategories, NewsletterSubscribed, PreferredContactMethod) VALUES (226, 26, 'Toys', 'Y', 'Email');
INSERT INTO CustomerPreferences (PreferenceID, CustomerID, ProductCategories, NewsletterSubscribed, PreferredContactMethod) VALUES (227, 27, 'Clothing', 'N', 'Phone');
INSERT INTO CustomerPreferences (PreferenceID, CustomerID, ProductCategories, NewsletterSubscribed, PreferredContactMethod) VALUES (228, 28, 'Books', 'Y', 'Email');
INSERT INTO CustomerPreferences (PreferenceID, CustomerID, ProductCategories, NewsletterSubscribed, PreferredContactMethod) VALUES (229, 29, 'Electronics', 'N', 'Phone');
INSERT INTO CustomerPreferences (PreferenceID, CustomerID, ProductCategories, NewsletterSubscribed, PreferredContactMethod) VALUES (230, 30, 'Home Appliances', 'Y', 'Email');



-- LoyaltyProgram
INSERT INTO LoyaltyProgram (LoyaltyID, CustomerID, LoyaltyPoints, ExpiryDate) VALUES (31, 31, 600, TO_DATE('2025-01-10', 'YYYY-MM-DD'));
INSERT INTO LoyaltyProgram (LoyaltyID, CustomerID, LoyaltyPoints, ExpiryDate) VALUES (32, 32, 700, TO_DATE('2025-02-20', 'YYYY-MM-DD'));
INSERT INTO LoyaltyProgram (LoyaltyID, CustomerID, LoyaltyPoints, ExpiryDate) VALUES (33, 33, 800, TO_DATE('2025-03-15', 'YYYY-MM-DD'));
INSERT INTO LoyaltyProgram (LoyaltyID, CustomerID, LoyaltyPoints, ExpiryDate) VALUES (34, 34, 500, TO_DATE('2025-04-25', 'YYYY-MM-DD'));
INSERT INTO LoyaltyProgram (LoyaltyID, CustomerID, LoyaltyPoints, ExpiryDate) VALUES (35, 35, 750, TO_DATE('2025-05-30', 'YYYY-MM-DD'));

-- Customer
INSERT INTO Customer (CustomerID, FirstName, LastName, Email, FeedbackID, LoyaltyID, PreferenceID, PurchaseID) VALUES (31, 'Ella', 'James', 'ella.james@example.com', 131, 31, 231, 331);
INSERT INTO Customer (CustomerID, FirstName, LastName, Email, FeedbackID, LoyaltyID, PreferenceID, PurchaseID) VALUES (32, 'Finn', 'Taylor', 'finn.taylor@example.com', 132, 32, 232, 332);
INSERT INTO Customer (CustomerID, FirstName, LastName, Email, FeedbackID, LoyaltyID, PreferenceID, PurchaseID) VALUES (33, 'Grace', 'Moore', 'grace.moore@example.com', 133, 33, 233, 333);
INSERT INTO Customer (CustomerID, FirstName, LastName, Email, FeedbackID, LoyaltyID, PreferenceID, PurchaseID) VALUES (34, 'Harry', 'Cooper', 'harry.cooper@example.com', 134, 34, 234, 334);
INSERT INTO Customer (CustomerID, FirstName, LastName, Email, FeedbackID, LoyaltyID, PreferenceID, PurchaseID) VALUES (35, 'Ivy', 'Clark', 'ivy.clark@example.com', 135, 35, 235, 335);

-- PurchaseHistory
INSERT INTO PurchaseHistory (PurchaseID, CustomerID, PurchaseDate, Quantity, TotalAmount) VALUES (331, 31, TO_DATE('2024-01-05', 'YYYY-MM-DD'), 2, 399.98);
INSERT INTO PurchaseHistory (PurchaseID, CustomerID, PurchaseDate, Quantity, TotalAmount) VALUES (332, 32, TO_DATE('2024-02-15', 'YYYY-MM-DD'), 1, 249.99);
INSERT INTO PurchaseHistory (PurchaseID, CustomerID, PurchaseDate, Quantity, TotalAmount) VALUES (333, 33, TO_DATE('2024-03-25', 'YYYY-MM-DD'), 3, 749.97);
INSERT INTO PurchaseHistory (PurchaseID, CustomerID, PurchaseDate, Quantity, TotalAmount) VALUES (334, 34, TO_DATE('2024-04-10', 'YYYY-MM-DD'), 1, 199.99);

-- CustomerFeedback
INSERT INTO CustomerFeedback (FeedbackID, CustomerID, FeedbackDate, FeedbackText, Rating) VALUES (131, 31, TO_DATE('2024-01-10', 'YYYY-MM-DD'), 'Fast shipping and great quality!', 5);
INSERT INTO CustomerFeedback (FeedbackID, CustomerID, FeedbackDate, FeedbackText, Rating) VALUES (132, 32, TO_DATE('2024-02-20', 'YYYY-MM-DD'), 'Good value for the price.', 4);
INSERT INTO CustomerFeedback (FeedbackID, CustomerID, FeedbackDate, FeedbackText, Rating) VALUES (133, 33, TO_DATE('2024-03-30', 'YYYY-MM-DD'), 'Exceeded my expectations!', 5);
INSERT INTO CustomerFeedback (FeedbackID, CustomerID, FeedbackDate, FeedbackText, Rating) VALUES (134, 34, TO_DATE('2024-04-15', 'YYYY-MM-DD'), 'Product quality was satisfactory.', 3);

-- CustomerPreferences
INSERT INTO CustomerPreferences (PreferenceID, CustomerID, ProductCategories, NewsletterSubscribed, PreferredContactMethod) VALUES (231, 31, 'Kitchen Appliances', 'Y', 'Email');
INSERT INTO CustomerPreferences (PreferenceID, CustomerID, ProductCategories, NewsletterSubscribed, PreferredContactMethod) VALUES (232, 32, 'Electronics', 'N', 'Phone');
INSERT INTO CustomerPreferences (PreferenceID, CustomerID, ProductCategories, NewsletterSubscribed, PreferredContactMethod) VALUES (233, 33, 'Home Decor', 'Y', 'Email');
INSERT INTO CustomerPreferences (PreferenceID, CustomerID, ProductCategories, NewsletterSubscribed, PreferredContactMethod) VALUES (234, 34, 'Clothing', 'N', 'Phone');
INSERT INTO CustomerPreferences (PreferenceID, CustomerID, ProductCategories, NewsletterSubscribed, PreferredContactMethod) VALUES (235, 35, 'Books', 'Y', 'Email');





-- LoyaltyProgram
INSERT INTO LoyaltyProgram (LoyaltyID, CustomerID, LoyaltyPoints, ExpiryDate) VALUES (36, 36, 550, TO_DATE('2025-06-15', 'YYYY-MM-DD'));
INSERT INTO LoyaltyProgram (LoyaltyID, CustomerID, LoyaltyPoints, ExpiryDate) VALUES (37, 37, 600, TO_DATE('2025-07-20', 'YYYY-MM-DD'));
INSERT INTO LoyaltyProgram (LoyaltyID, CustomerID, LoyaltyPoints, ExpiryDate) VALUES (38, 38, 750, TO_DATE('2025-08-10', 'YYYY-MM-DD'));
INSERT INTO LoyaltyProgram (LoyaltyID, CustomerID, LoyaltyPoints, ExpiryDate) VALUES (39, 39, 800, TO_DATE('2025-09-05', 'YYYY-MM-DD'));
INSERT INTO LoyaltyProgram (LoyaltyID, CustomerID, LoyaltyPoints, ExpiryDate) VALUES (40, 40, 900, TO_DATE('2025-10-30', 'YYYY-MM-DD'));

-- Customer
INSERT INTO Customer (CustomerID, FirstName, LastName, Email, FeedbackID, LoyaltyID, PreferenceID, PurchaseID) VALUES (36, 'Jake', 'Miller', 'jake.miller@example.com', 136, 36, 236, 336);
INSERT INTO Customer (CustomerID, FirstName, LastName, Email, FeedbackID, LoyaltyID, PreferenceID, PurchaseID) VALUES (37, 'Karen', 'Anderson', 'karen.anderson@example.com', 137, 37, 237, 337);
INSERT INTO Customer (CustomerID, FirstName, LastName, Email, FeedbackID, LoyaltyID, PreferenceID, PurchaseID) VALUES (38, 'Liam', 'Taylor', 'liam.taylor@example.com', 138, 38, 238, 338);
INSERT INTO Customer (CustomerID, FirstName, LastName, Email, FeedbackID, LoyaltyID, PreferenceID, PurchaseID) VALUES (39, 'Mia', 'Harris', 'mia.harris@example.com', 139, 39, 239, 339);
INSERT INTO Customer (CustomerID, FirstName, LastName, Email, FeedbackID, LoyaltyID, PreferenceID, PurchaseID) VALUES (40, 'Noah', 'Martinez', 'noah.martinez@example.com', 140, 40, 240, 340);


-- CustomerPreferences
INSERT INTO CustomerPreferences (PreferenceID, CustomerID, ProductCategories, NewsletterSubscribed, PreferredContactMethod) VALUES (236, 36, 'Electronics', 'Y', 'Email');
INSERT INTO CustomerPreferences (PreferenceID, CustomerID, ProductCategories, NewsletterSubscribed, PreferredContactMethod) VALUES (237, 37, 'Home Appliances', 'N', 'Phone');
INSERT INTO CustomerPreferences (PreferenceID, CustomerID, ProductCategories, NewsletterSubscribed, PreferredContactMethod) VALUES (238, 38, 'Furniture', 'Y', 'Email');
INSERT INTO CustomerPreferences (PreferenceID, CustomerID, ProductCategories, NewsletterSubscribed, PreferredContactMethod) VALUES (239, 39, 'Books', 'N', 'Phone');
INSERT INTO CustomerPreferences (PreferenceID, CustomerID, ProductCategories, NewsletterSubscribed, PreferredContactMethod) VALUES (240, 40, 'Clothing', 'Y', 'Email');

INSERT INTO PurchaseHistory (PurchaseID, CustomerID, PurchaseDate, Quantity, TotalAmount) 
VALUES (341, 30, TO_DATE('2024-11-01', 'YYYY-MM-DD'), 1, 149.99);

INSERT INTO CustomerFeedback (FeedbackID, CustomerID, FeedbackDate, FeedbackText, Rating) 
VALUES (141, 30, TO_DATE('2024-11-05', 'YYYY-MM-DD'), 'Satisfied with the second purchase, great value!', 4);




SELECT DISTINCT c.CustomerID, c.FirstName, c.LastName, c.Email, p.purchaseid
FROM Customer c
JOIN PurchaseHistory p ON c.CustomerID = p.CustomerID
WHERE c.CustomerID IN (
    SELECT lp.CustomerID
    FROM LoyaltyProgram lp
);



