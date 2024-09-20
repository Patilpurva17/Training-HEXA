-- 1. Retrieve the Names and Emails of All Customers
SELECT FirstName, LastName, Email
FROM Customers;
GO

-- 2. List All Orders with Their Order Dates and Corresponding Customer Names
SELECT O.OrderID, O.OrderDate, C.FirstName, C.LastName
FROM Orders O
JOIN Customers C ON O.CustomerID = C.CustomerID;
GO

-- 3. Insert a New Customer Record into the "Customers" Table
INSERT INTO Customers (FirstName, LastName, Email, Phone, Address)
VALUES ('Mark', 'Jones', 'mark.jones@example.com', '5551234567', '789 Willow St');
GO

-- 4. Update the Prices of All Electronic Gadgets in the "Products" Table by Increasing Them by 10%
UPDATE Products
SET Price = Price * 1.10
WHERE Category = 'Electronics';
GO

-- 5. Delete a Specific Order and Its Associated Order Details from "Orders" and "OrderDetails" Tables
DECLARE @OrderID INT;
SET @OrderID = 5;  -- Input Order ID

DELETE FROM OrderDetails WHERE OrderID = @OrderID;
DELETE FROM Orders WHERE OrderID = @OrderID;
GO

-- 6. Insert a New Order into the "Orders" Table
INSERT INTO Orders (CustomerID, OrderDate, TotalAmount)
VALUES (1, GETDATE(), 199.99);  -- CustomerID = 1, TotalAmount = 199.99
GO

-- 7. Update the Contact Information of a Specific Customer
DECLARE @CustomerID1 INT;
DECLARE @NewEmail NVARCHAR(255);
DECLARE @NewAddress NVARCHAR(255);

SET @CustomerID1 = 2;  -- Input Customer ID
SET @NewEmail = 'new.email@example.com';  -- New email
SET @NewAddress = '456 New Address St';   -- New address

UPDATE Customers
SET Email = @NewEmail, Address = @NewAddress
WHERE CustomerID = @CustomerID1;
GO

-- 8. Recalculate and Update the Total Cost of Each Order in the "Orders" Table
UPDATE Orders
SET TotalAmount = (
    SELECT SUM(OD.Quantity * OD.UnitPrice)
    FROM OrderDetails OD
    WHERE OD.OrderID = Orders.OrderID
);
GO

-- 9. Delete All Orders and Their Associated Order Details for a Specific Customer
DECLARE @CustomerID2 INT;
SET @CustomerID2 = 3;  -- Input Customer ID

DELETE FROM OrderDetails
WHERE OrderID IN (SELECT OrderID FROM Orders WHERE CustomerID = @CustomerID2);
DELETE FROM Orders
WHERE CustomerID = @CustomerID2;
GO

-- 10. Insert a New Electronic Gadget Product into the "Products" Table
INSERT INTO Products (ProductName, Description, Price, Category)
VALUES ('Smart TV', '55-inch 4K Smart TV', 599.99, 'Electronics');
GO

-- 11. Update the Status of a Specific Order in the "Orders" Table
DECLARE @OrderID1 INT;
DECLARE @NewStatus NVARCHAR(50);

SET @OrderID1 = 4;  -- Input Order ID
SET @NewStatus = 'Shipped';  -- New status

UPDATE Orders
SET Status = @NewStatus
WHERE OrderID = @OrderID1;
GO

-- 12. Calculate and Update the Number of Orders Placed by Each Customer in the "Customers" Table
UPDATE Customers
SET NumberOfOrders = (
    SELECT COUNT(*)
    FROM Orders
    WHERE Orders.CustomerID = Customers.CustomerID
);
GO
