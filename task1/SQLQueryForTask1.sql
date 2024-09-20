CREATE TABLE Customerss (
    CustomerID INT PRIMARY KEY IDENTITY(1,1),
    FirstName NVARCHAR(50),
    LastName NVARCHAR(50),
    Email NVARCHAR(100) UNIQUE,
    Phone NVARCHAR(15),
    Address NVARCHAR(255)
);
CREATE TABLE Products (
    ProductID INT PRIMARY KEY IDENTITY(1,1),
    ProductName NVARCHAR(100),
    Description NVARCHAR(255),
    Price DECIMAL(10, 2),
    Category NVARCHAR(50)
);
CREATE TABLE Orders (
    OrderID INT PRIMARY KEY IDENTITY(1,1),
    OrderDate DATETIME,
    CustomerID INT,
    TotalAmount DECIMAL(10, 2),
    FOREIGN KEY (CustomerID) REFERENCES Customers(CustomerID)
);
CREATE TABLE OrderDetails (
    OrderDetailID INT PRIMARY KEY IDENTITY(1,1),
    OrderID INT,
    ProductID INT,
    Quantity INT,
    UnitPrice DECIMAL(10, 2),
    FOREIGN KEY (OrderID) REFERENCES Orders(OrderID),
    FOREIGN KEY (ProductID) REFERENCES Products(ProductID)
);
CREATE TABLE Inventory (
    InventoryID INT PRIMARY KEY IDENTITY(1,1),
    ProductID INT,
    QuantityInStock INT,
    ReorderLevel INT,
    LastUpdated DATETIME,
    FOREIGN KEY (ProductID) REFERENCES Products(ProductID)
);


-- inserting the data

-- Insert sample records into Orders table
INSERT INTO Orders (CustomerID, OrderDate, TotalAmount)
VALUES
(1, '2024-09-20', 1499.99),
(2, '2024-09-19', 799.99),
(3, '2024-09-18', 199.99),
(4, '2024-09-17', 549.99),
(5, '2024-09-16', 99.99),
(6, '2024-09-15', 399.99),
(7, '2024-09-14', 799.99),
(8, '2024-09-13', 129.99),
(9, '2024-09-12', 399.99),
(10, '2024-09-11', 249.99);
GO  -- End of Orders Insert


-- Insert sample records into OrderDetails table
INSERT INTO OrderDetails (OrderID, ProductID, Quantity, UnitPrice)
VALUES
(1, 1, 1, 999.99), -- Order 1, Laptop
(1, 3, 1, 199.99), -- Order 1, Headphones
(2, 2, 1, 799.99), -- Order 2, Smartphone
(3, 4, 1, 499.99), -- Order 3, Tablet
(4, 6, 1, 249.99), -- Order 4, Smartwatch
(5, 8, 2, 49.99),  -- Order 5, Wireless Mouse
(6, 5, 3, 129.99), -- Order 6, Bluetooth Speaker
(7, 7, 1, 89.99),  -- Order 7, External Hard Drive
(8, 9, 1, 79.99),  -- Order 8, Keyboard
(9, 10, 1, 399.99);-- Order 9, Monitor
GO  -- End of OrderDetails Insert


-- Insert sample records into Inventory table
INSERT INTO Inventory (ProductID, QuantityInStock, ReorderLevel)
VALUES
(1, 50, 10),  -- Laptop
(2, 100, 20), -- Smartphone
(3, 200, 30), -- Headphones
(4, 75, 15),  -- Tablet
(5, 150, 25), -- Bluetooth Speaker
(6, 80, 10),  -- Smartwatch
(7, 120, 20), -- External Hard Drive
(8, 90, 20),  -- Wireless Mouse
(9, 110, 30), -- Keyboard
(10, 60, 15); -- Monitor
GO  -- End of Inventory Insert ok


INSERT INTO Customers (FirstName, LastName, Email, Phone, Address)
VALUES 
('Purva', 'Patil', 'p@example.com', '1234567890', '123 Elm St'),
('Janavi', 'pol', 'j@example.com', '9876543210', '456 Oak St'),
('xyz', 'abc', 'x@example.com', '4567891230', '789 Pine St'),
('abc', 'pqr', 'a@example.com', '1239874560', '321 Maple St'),
('pqr', 'lmn', 'r@example.com', '6543210987', '654 Birch St'),
('lmn', 'ghj', 'e@example.com', '7891234560', '987 Cedar St'),
('ghj', 'tuv', 'm@example.com', '3456789012', '765 Spruce St'),
('tuv', 'asd', 'lz@example.com', '1230987654', '432 Oakwood St'),
('asd', 'xcv', 'd@example.com', '8901234567', '987 Maple Ave'),
('xcv', 'iop', 's@example.com', '6789012345', '543 Elm Ave');


INSERT INTO Products (ProductName, Description, Price, Category)
VALUES
('Laptop', '15 inch laptop with 16GB RAM', 999.99, 'Electronics'),
('Smartphone', 'Latest 5G smartphone with OLED display', 799.99, 'Electronics'),
('Headphones', 'Wireless noise-canceling headphones', 199.99, 'Accessories'),
('Tablet', '10-inch tablet with pen support', 499.99, 'Electronics'),
('Bluetooth Speaker', 'Portable Bluetooth speaker with 12-hour battery life', 129.99, 'Accessories'),
('Smartwatch', 'Waterproof smartwatch with fitness tracking', 249.99, 'Wearables'),
('External Hard Drive', '1TB external hard drive', 89.99, 'Accessories'),
('Wireless Mouse', 'Ergonomic wireless mouse', 49.99, 'Accessories'),
('Keyboard', 'Mechanical keyboard with RGB backlighting', 79.99, 'Accessories'),
('Monitor', '27-inch 4K monitor', 399.99, 'Electronics');


