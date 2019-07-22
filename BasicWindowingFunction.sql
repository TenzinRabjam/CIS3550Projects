--CREATE PROC NAME_TODO
--AS
--SELECT Sales.OrderLines.Description, 
--count(Sales.orderLines.orderID) Orders_Count, 
--rank() over (order by sum(Sales.orderLines.UnitPrice * (Sales.orderLines.UnitPrice * Sales.orderLines.TaxRate))) 
--Total_Sales_Value,
--rank() over (order by sum(Sales.orderLines.Quantity)) Total_Sales_Quantity 

--from Sales.OrderLines group by Sales.OrderLines.Description;

 --EXEC NAME_TODO;

SELECT SALES.InvoiceLines.Description, SUM(SALES.InvoiceLines.Quantity) total_quantity,
DENSE_RANK() OVER (ORDER BY COUNT(SALES.InvoiceLine)  DESC) Number_Of_Orders_Rank
FROM SALES.InvoiceLines 
JOIN SALES.INVOICES ON SALES.Invoices.InvoiceID = SALES.InvoiceLines.InvoiceID 
JOIN SALES.Orders ON SALES.Orders.OrderID = SALES.Invoices.OrderID 
WHERE YEAR(SALES.ORDERS.OrderDate) = 2013  
GROUP BY SALES.InvoiceLines.Description;

--SELECT 
--SALES.Orders.CustomerID, ROW_NUMBER() OVER( ORDER BY SALES.ORDERS.OrderDate) [ROW_NUMBER], SALES.ORDERS.OrderDate
--FROM SALES.Orders;