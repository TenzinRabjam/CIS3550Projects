use WideWorldImporters;

--This 1st one
SELECT
*
FROM
Sales.Invoices I 
LEFT OUTER JOIN Sales.InvoiceLines IL ON IL.InvoiceID = I.InvoiceID
WHERE  
IL.InvoiceLineID IS NULL;

--This 2ND one
SELECT top 1 Sales.orders.CustomerPurchaseOrderNumber, SUM(Sales.InvoiceLines.InvoiceID) as total_invoice_line_items  
from Sales.Orders 
Join Sales.invoices on Sales.invoices.OrderID = Sales.orders.OrderID 
JOIN Sales.InvoiceLines on Sales.InvoiceLines.InvoiceID = Sales.invoices.InvoiceID 
group by Sales.orders.CustomerPurchaseOrderNumber
ORDER BY SUM(Sales.InvoiceLines.Quantity) DESC;

--3RD ONE
SELECT SALES.InvoiceLines.TaxRate FROM SALES.InvoiceLines 
JOIN Sales.Invoices on Sales.InvoiceLines.InvoiceID = Sales.invoices.InvoiceID 
GROUP BY SALES.InvoiceLines.TaxRate;

--4TH ONE
SELECT TOP 1 SALES.ORDERS.SalespersonPersonID, SUM(SALES.OrderLines.Quantity * SALES.ORDERLINES.UnitPrice) as totalAmount
FROM SALES.ORDERS 
JOIN SALES.ORDERLINES ON SALES.OrderLines.OrderID = SALES.ORDERS.OrderID 
WHERE YEAR(SALES.Orders.OrderDate) = 2013  
GROUP BY SALES.ORDERS.SalespersonPersonID
ORDER BY SUM(SALES.OrderLines.Quantity * SALES.ORDERLINES.UnitPrice) DESC;


--5TH ONE
SELECT MONTH(SALES.Invoices.InvoiceDate) AS Month, 
YEAR(SALES.Invoices.InvoiceDate) as Year, 
COUNT(SALES.Invoices.InvoiceID) as numberOfInvoices,
SUM(SALES.InvoiceLines.UnitPrice * SALES.InvoiceLines.Quantity) as totalAmount,  
SUM(SALES.InvoiceLines.TaxRate * SALES.InvoiceLines.UnitPrice * SALES.InvoiceLines.Quantity) as totalTax,
sum(SALES.InvoiceLines.Quantity) as	totalQuantity 
FROM SALES.Invoices 
JOIN Sales.InvoiceLines on Sales.InvoiceLines.InvoiceID = Sales.invoices.InvoiceID 
where month(InvoiceDate) between 1 and 3 and 
year(InvoiceDate) = 2013 
group by MONTH(SALES.Invoices.InvoiceDate), YEAR(SALES.Invoices.InvoiceDate);




