----create proc test 
----@tableName nvarchar,
----@columnName1 nvarchar,
----@columnName2 nvarchar,
----@value nvarchar

----as 
----Begin 
----Select CONVERT(VARCHAR(100),@columnName1);

----exec test Actor, Actor.FirstName, Actor.LastName, 'he';
----end


--Create PROCEDURE [dbo].[SP_LOT_INSERTLOTEMP]
--@IDENT_TABLA NVARCHAR(10),
--@CLIENTE_CODIGO SMALLINT,
--@CAJA_CODIGO NVARCHAR(15),
--@CAJA_NUMERO SMALLINT
--AS
--BEGIN
--DECLARE @NOMBRE_TABLA NVARCHAR(40)
--SELECT @NOMBRE_TABLA = 'INGRESOLOTEMP_' +  CONVERT(VARCHAR(100),@IDENT_TABLA)
--SELECT @CAJA_CODIGO = CONVERT(VARCHAR(20), @CAJA_CODIGO)

--DECLARE @SQL NVARCHAR(MAX)
--SET @SQL = 'INSERT into dbo.' + @NOMBRE_TABLA    
--SET  @SQL += '(CLIENTE_CODIGO, CAJA_CODIGO, CAJA_NUMERO) 
--VALUES (@CLIENTE_CODIGO, @CAJA_CODIGO,  @CAJA_NUMERO)'

--DECLARE @ParmDefinition nvarchar(500)
--SET @ParmDefinition = '@IDENT_TABLA NVARCHAR(10), @CLIENTE_CODIGO  SMALLINT, @CAJA_CODIGO NVARCHAR(15), @CAJA_NUMERO SMALLINT' 

--SELECT @sql
--EXEC sp_executesql @SQL, @ParmDefinition, 'dbo.Actor', @CLIENTE_CODIGO, @CAJA_CODIGO, @CAJA_NUMERO

--END


--create PROCEDURE test 
--@table_name varchar(50) ,
--@packID varchar(100)
--AS
--BEGIN
--SET NOCOUNT ON;
--SET @table_name = RTRIM(@table_name)
--SET @packID = RTRIM(@packID)
--DECLARE @cmd AS NVARCHAR(max)
--SET @cmd = N'SELECT * FROM ' + @table_name + ''''
--EXEC test 'dbo.Actor',  'FirstName'
--END

--alter PROCEDURE Customers_GetCustomer
--      @CustId NVARCHAR(100),
--	  @columnName1 nvarchar(100)
--AS
--BEGIN
--      DECLARE @SQL NVARCHAR(2000)
--      SET @SQL = 'SELECT ' + @columnName1 + ' FROM  '+ @CustId 
--      EXEC(@SQL)
--END

--Customers_GetCustomer Actor, laSTname

ALTER PROCEDURE BasicDynamicSQL
      @tableName nvarchar(100),
	  @columnName1 nvarchar(100),
	  @columnName2 nvarchar(100),
	  @columnName3 nvarchar(100),
	  @firstValue nvarchar(100),
	  @secondValue nvarchar(100),
	  @thirdValue nvarchar(100), 
	  @searchValue nvarchar(100)
AS
BEGIN
      DECLARE @SQL NVARCHAR(max)
      SET @SQL = 'UPDATE '  + @tableName +' SET ' + @columnName1 + ' = ''' + Convert(varchar, @firstValue) 
	  + ''',' + @columnName2  + ' = ''' + Convert(varchar, @secondValue) 
	  + ''',' + @columnName3  + ' = ''' + Convert(varchar, @thirdValue) + '''  WHERE ' 
	  + @columnName1 + ' = ''' +  Convert(varchar, @searchValue) + '''' 
      
	  EXECUTE sp_executesql @sql
END

--Executing stored procedure
BasicDynamicSQL ACTOR, FIRSTNAME, LASTNAME, [ADDRESS], Cristiano, Ronaldo, RonnyRDMadiera, John



