-- 🛠️ Question 1: Achieve 1NF by transforming the multi-valued attributes  
CREATE TABLE ProductDetail_1NF (  
    OrderID INT,  
    CustomerName VARCHAR(100),  
    Product VARCHAR(50)  
);  

-- Insert the normalized data where each product gets its own row  
INSERT INTO ProductDetail_1NF (OrderID, CustomerName, Product) VALUES  
(101, 'John Doe', 'Laptop'),  
(101, 'John Doe', 'Mouse'),  
(102, 'Jane Smith', 'Tablet'),  
(102, 'Jane Smith', 'Keyboard'),  
(102, 'Jane Smith', 'Mouse'),  
(103, 'Emily Clark', 'Phone');  

-- 🧩 Question 2: Achieve 2NF by removing the partial dependencies  
-- Create Customers table where a CustomerName depends only on their CustomerID  
CREATE TABLE Customers (  
    CustomerID INT PRIMARY KEY,  
    CustomerName VARCHAR(100)  
);  

-- Populate Customers table  
INSERT INTO Customers (CustomerID, CustomerName) VALUES  
(1, 'John Doe'),  
(2, 'Jane Smith'),  
(3, 'Emily Clark');  

-- Create Orders table where the OrderID depends fully on the CustomerID  
CREATE TABLE Orders (  
    OrderID INT PRIMARY KEY,  
    CustomerID INT,  
    FOREIGN KEY (CustomerID) REFERENCES Customers(CustomerID)  
);  

-- Populate Orders table  
INSERT INTO Orders (OrderID, CustomerID) VALUES  
(101, 1),  
(102, 2),  
(103, 3);  

-- Create OrderDetails table where the Product and Quantity depends entirely on the OrderID  
CREATE TABLE OrderDetails (  
    OrderID INT,  
    Product VARCHAR(50),  
    Quantity INT,  
    PRIMARY KEY (OrderID, Product),  
    FOREIGN KEY (OrderID) REFERENCES Orders(OrderID)  
);  

-- Populate OrderDetails table  
INSERT INTO OrderDetails (OrderID, Product, Quantity) VALUES  
(101, 'Laptop', 2),  
(101, 'Mouse', 1),  
(102, 'Tablet', 3),  
(102, 'Keyboard', 1),  
(102, 'Mouse', 2),  
(103, 'Phone', 1);  
