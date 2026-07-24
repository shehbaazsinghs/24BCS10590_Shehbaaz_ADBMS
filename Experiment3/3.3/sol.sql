SELECT NAME AS Customers
FROM Customers 
WHERE ID NOT IN
(SELECT CustomerID FROM Orders);