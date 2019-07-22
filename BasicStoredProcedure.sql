alter proc getColor 
@colorID int
as 
SELECT Warehouse.Colors.Colorname, Warehouse.StockItems.StockItemName 
FROM Warehouse.Colors
left join Warehouse.StockItems on Warehouse.StockItems.ColorID = Warehouse.Colors.ColorID 
where Warehouse.Colors.ColorID = @colorID

--EXEC getColor 3;