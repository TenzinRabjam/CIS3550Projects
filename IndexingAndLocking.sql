IF OBJECT_ID('IndexingAndLockingTable') IS NOT NULL
BEGIN
  DROP TABLE IndexingAndLockingTable
END
GO
CREATE TABLE IndexingAndLockingTable(ID   Int Identity(1,1) PRIMARY KEY, 
                       FirstName VarChar(250) NOT NULL DEFAULT NewID(),
                       LastName VarChar(250) NOT NULL DEFAULT NewID(),
                       [Address] VarChar(250) NOT NULL DEFAULT NewID(),
                       [Date] DateTime     NOT NULL DEFAULT GetDate())
GO
GO 
SET NOCOUNT ON 
GO
INSERT INTO IndexingAndLockingTable DEFAULT VALUES 
GO 10

CREATE NONCLUSTERED INDEX index_Test ON IndexingAndLockingTable(FirstName, LastName, [Address])
GO

--INDEX SCAN 
SET STATISTICS IO ON
SELECT *
  FROM IndexingAndLockingTable
WHERE FirstName like 'B%'
SET STATISTICS IO OFF

--KEY LOOKUP AND INDEX SEEK
SET STATISTICS IO ON
SELECT *
  FROM IndexingAndLockingTable WITH(INDEX = index_Test)
WHERE FirstName like 'B%'
SET STATISTICS IO OFF

--TABLE SCAN
SELECT * FROM IndexingAndLockingTable


--TABLE SORT
SELECT * FROM IndexingAndLockingTable
ORDER BY [DATE] 