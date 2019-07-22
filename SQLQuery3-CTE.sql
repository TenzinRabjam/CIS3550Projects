use WideWorldImportersDW;

with price_calc (total_sales, salesPerson) As (
SELECT  SUM(FACT.Sale.[Tax Rate] * fACT.SALE.[Unit Price]) , fact.sale.[Salesperson Key] 
FROM FACT.SALE 
INNER JOIN Dimension.Customer on Dimension.Customer.[Customer Key] = Fact.sale.[Customer Key] 
WHERE Dimension.Customer.[Postal Code] = '90374' 
group by fact.sale.[Salesperson Key])

SELECT total_sales, salesPerson from price_calc;

--Recursive One
--WITH   recursiveCte (order_key, orderDate, customer_level)
--AS     (SELECT fact.[order].[Order Key],  fact.[order].[Order Date Key], 1 AS n from fact.[order] 
--	    GROUP BY fact.[order].[Order Key],  fact.[order].[Order Date Key]    -- anchor member
        
--		UNION ALL 
        
--		SELECT recursiveCte.order_key,  recursiveCte.orderDate, customer_level - 1 -- recursive member
--        FROM   recursiveCte 
--        WHERE  customer_level = 5 	
--       )

--SELECT *
--FROM   recursiveCte;

