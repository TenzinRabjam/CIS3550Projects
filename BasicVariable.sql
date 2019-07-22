use WideWorldImporters;

Declare @Customer_Id int = 814;
Declare @StartDate date = '2012-01-11'; 
Declare @EndDate date = '2013-12-11'; 

--select @Customer_Id, @StartDate, @EndDate;


--how to use variables in here
select Sales.Customers.CustomerName, Sales.orders.CustomerID, 
	month(Sales.orders.OrderDate) [month], year(Sales.orders.OrderDate) [year], Sales.orderLines.UnitPrice * Sales.orderLines.Quantity  totalPrice

from Sales.orders 
join Sales.customers on sales.customers.CustomerID = sales.Orders.CustomerID 
join Sales.OrderLines on Sales.OrderLines.OrderID = sales.Orders.OrderID 
where sales.customers.CustomerID = @Customer_Id and Sales.orders.OrderDate between @StartDate and @EndDate
order by year(Sales.orders.OrderDate), month(Sales.orders.OrderDate);