USE WideWorldImporters;

SELECT Sales.Orders.OrderID, Sales.Orders.CustomerID, Sales.Orders.OrderDate 
FROM Sales.Orders 
ORDER BY Sales.Orders.OrderDate DESC; 

SELECT Sales.Customers.CustomerID, Sales.Customers.CustomerName, Sales.Customers.DeliveryAddressLine1,
Sales.Customers.DeliveryAddressLine2, Sales.Customers.PostalPostalCode 
from Sales.Customers 
where Sales.Customers.PostalPostalCode = 90204;

SELECT Sales.Orders.CustomerPurchaseOrderNumber, Sales.Orders.SalespersonPersonID, Sales.Customers.CreditLimit 
from Sales.Orders 
JOIN Sales.Customers ON Sales.Customers.CustomerID = Sales.Orders.CustomerID;

SELECT Sales.Customers.CustomerID,  Sales.Customers.CustomerName 
FROM SALES.CUSTOMERS  
LEFT JOIN Sales.ORDERS ON SALES.Orders.CustomerID = SALES.Customers.CustomerID 
WHERE SALES.Orders.ORDERID IS NULL; 

 Select sales.Orders.OrderID, sales.Orders.OrderDate, Sales.Customers.CustomerID, Sales.Customers.CustomerName
 FROM sales.Orders 
 INNER JOIN Sales.Customers ON Sales.Customers.CustomerID = sales.Orders.CustomerID 
 INNER JOIN Sales.BuyingGroups ON Sales.Customers.BuyingGroupID = Sales.BuyingGroups.BuyingGroupID 
 INNER JOIN sALES.SpecialDeals on Sales.BuyingGroups.BuyingGroupID = SALES.SpecialDeals.BuyingGroupID;

SELECT Sales.Customers.CustomerName 
FROM Sales.Customers 
LEFT JOIN sales.Orders ON sales.Orders.CustomerID = Sales.Customers.CustomerID 
WHERE CONVERT(VARCHAR, SALES.ORDERS.OrderDate, 120) LIKE '2015-12-31%' 
GROUP BY Sales.Customers.CustomerName;

SELECT SUM(Sales.OrderLines.Quantity) as numberOfItems, Sales.Orders.OrderDate 
FROM Sales.OrderLines 
LEFT JOIN Sales.Orders ON Sales.Orders.OrderID = Sales.OrderLines.OrderID 
WHERE SALES.ORDERS.OrderDate = '2014/11/26' 
GROUP BY SALES.ORDERS.OrderDate;

SELECT SUM(Sales.OrderLines.Quantity), Sales.Orders.OrderDate  
FROM Sales.OrderLines 
LEFT JOIN Sales.Orders ON Sales.Orders.OrderID = Sales.OrderLines.OrderID 
WHERE Sales.Orders.OrderDate > '1/1/15' AND Sales.Orders.OrderDate < '1/1/16' 
GROUP BY Sales.Orders.OrderDate 
HAVING SUM(Sales.OrderLines.Quantity) > 100;	

SELECT Sales.Customers.CustomerName, Sales.Customers.CreditLimit 
FROM Sales.Customers 
WHERE Sales.Customers.CreditLimit IN (3000, 2940, 2000);

SELECT Sales.Customers.CustomerName 
FROM Sales.Customers 
WHERE Sales.Customers.CustomerName LIKE '%TOYS%';