ALTER FUNCTION GET_DATE(@GET_DATE DATETIME)

RETURNS VARCHAR(100) 

AS 

BEGIN 
	DECLARE @DATE_IN_WORDS VARCHAR(100);
	DECLARE @DAY_IS VARCHAR(50) = 'The day is ';
	DECLARE @1ST VARCHAR(50) =  'st of the ';
	DECLARE @2ND VARCHAR(50) =  'nd of the ';
	DECLARE @3RD VARCHAR(50) =  'rd of the ';
	DECLARE @4TH_AND_OTHER VARCHAR(50) =  'th of the ';
	DECLARE @DAYS_CASE INT = day(@GET_DATE) % 10;

	IF(datepart(HOUR, @GET_DATE) < 12)
		BEGIN
			IF (@DAYS_CASE = 1) 
				BEGIN
					SET @DATE_IN_WORDS = Concat(@DAY_IS, day(@GET_DATE),@1ST, DATENAME(month, @GET_DATE)
					,' ',YEAR(@GET_DATE), ' @ ',FORMAT(@GET_DATE,'hh:mm'), ' AM')
				END
			ELSE IF (@DAYS_CASE = 2)
				BEGIN 
					SET @DATE_IN_WORDS = Concat(@DAY_IS, day(@GET_DATE),@2ND,DATENAME(month, @GET_DATE)
					,' ',YEAR(@GET_DATE), ' @ ',FORMAT(@GET_DATE,'hh:mm'),' AM')
				END 
			ELSE IF (@DAYS_CASE = 3)
				BEGIN 
					SET @DATE_IN_WORDS = Concat(@DAY_IS, day(@GET_DATE),@3RD, DATENAME(month, @GET_DATE)
					,' ',YEAR(@GET_DATE), ' @ ',FORMAT(@GET_DATE,'hh:mm'),' AM')
				END 
	
			ELSE	SET @DATE_IN_WORDS = Concat(@DAY_IS, day(@GET_DATE),@4TH_AND_OTHER,DATENAME(month, @GET_DATE)
					,' ',YEAR(@GET_DATE), ' @ ',FORMAT(@GET_DATE,'hh:mm'),' AM')
		END
	ELSE
		BEGIN
			IF (@DAYS_CASE = 1) 
				BEGIN
					SET @DATE_IN_WORDS = Concat(@DAY_IS, day(@GET_DATE),@1ST, DATENAME(month, @GET_DATE)
					,' ',YEAR(@GET_DATE), ' @ ',FORMAT(@GET_DATE,'hh:mm'),' PM')
				END
			ELSE IF (@DAYS_CASE = 2)
				BEGIN 
					SET @DATE_IN_WORDS = Concat(@DAY_IS, day(@GET_DATE),@2ND,DATENAME(month, @GET_DATE)
					,' ',YEAR(@GET_DATE), ' @ ',FORMAT(@GET_DATE,'hh:mm'),' PM')
				END 
			ELSE IF (@DAYS_CASE = 3)
				BEGIN 
					SET @DATE_IN_WORDS = Concat(@DAY_IS, day(@GET_DATE),@3rd, DATENAME(month, @GET_DATE)
					,' ',YEAR(@GET_DATE), ' @ ',FORMAT(@GET_DATE,'hh:mm'),' PM')
				END 
	
			ELSE	SET @DATE_IN_WORDS = Concat(@DAY_IS, day(@GET_DATE),@4TH_AND_OTHER,DATENAME(month, @GET_DATE)
					,' ',YEAR(@GET_DATE), ' @ ',FORMAT(@GET_DATE,'hh:mm'),' PM')
		END
	return @DATE_IN_WORDS 
END


--SELECT DBO.GET_DATE(getdate()) as YOUR_DAY;

-------------------------------------------------------------------------------
 
--ALTER FUNCTION GET_MONEY(@MONEY MONEY)
--RETURNS VARCHAR(100)

--AS

--BEGIN 
--	DECLARE @MONEY_IN_WORDS VARCHAR(100) = CONCAT('Your total is $', @MONEY);
--	RETURN @MONEY_IN_WORDS
--END

--SELECT DBO.GET_MONEY(2.344) Your_Money;

--------------------------------------------------------------------------------

ALTER FUNCTION GET_PRODUCT(
	@PRODUCT_NAME AS VARCHAR(100)
)
RETURNS TABLE AS RETURN 
	SELECT Sales.Orders.OrderDate, SALES.OrderLines.Description, SALES.ORDERLINES.Quantity, SALES.ORDERLINES.UnitPrice
	
	FROM SALES.ORDERS 
	JOIN SALES.ORDERLINES ON SALES.ORDERLINES.OrderID = SALES.ORDERS.OrderID  
	WHERE  @PRODUCT_NAME = SALES.ORDERLINES.Description

select * from GET_PRODUCT('Black and orange handle with care despatch tape 48mm x 75mm');

----------------------------------------------------------------------------------

--CREATE PROC WEEKENDS
--AS
--DECLARE @START AS date = '01-01-2018';

--with GET_WEEKENDS ([Date])
--AS
--(
--	SELECT @START as [Date]
--	UNION ALL
--	SELECT DateADD(day,1,[Date]) FROM GET_WEEKENDS WHERE [Date] < GETDATE()
--)

--SELECT * FROM GET_WEEKENDS WHERE DATEPART(weekday,[date]) NOT IN(2,3,4,5,6)
--OPTION (MAXRECURSION 0);

--EXEC WEEKENDS ;

--------------------------------------------------------------------------------

--DECLARE @START AS date = GETDATE();
----DECLARE @END AS date = GETDATE();

--DECLARE @MyTable TABLE

--(
--  ProductID int UNIQUE,
--  Price date CHECK(@START = GETDATE())
--)

----SELECT * FROM @MYTABLE;