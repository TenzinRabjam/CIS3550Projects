-- =============================================
-- Author:		Tenzin
-- Create date: 7/18/2018
-- Description:	This trigger is to check if an actor
-- doint multiple movies
-- =============================================

-- CREATE table ActorsMultiMovies(
-- ActorFirstName varchar,
-- ActorLastName varchar,
-- ActorAddress varchar,
-- AlertDate  datetime default getdate(),
-- AlertType varchar(50),
-- AlertDescription varchar(225)
 
--);

ALTER TRIGGER ActorsDoingMultiMovies on dbo.Actor
   AFTER INSERT, UPDATE
AS 
BEGIN
	--Declare @firstName varchar = (select FirstName from dbo.Actor)
	--Declare @lastName varchar = (select LastName from dbo.Actor)
	--Declare @address varchar = (select Address from dbo.Actor)

	--if(@firstName = 'jonny')
	--Begin
		--Raiserror('This actor is doing multiple films at the same time', @firstName, @lastName)
		--INSERT INTO dbo.ActorsMultiMovies values(@firstName,@lastName,@address, GETDATE(), 'type - 19', 'Severity 19 Error' )
	--end

	INSERT INTO dbo.ActorsMultiMovies  
select A.FirstName, A.LastName, A.Address, GETDATE(), 'type - 19',   'Severity 19 Error'  from inserted i
inner join Actor A ON A.FirstName = I.FirstName
AND A.LastName = I.LastName
AND A.Address = I.Address
GROUP BY
	A.FirstName, A.LastName, A.Address
HAVING COUNT(*) > 1
	
END

--SELECT * FROM ActorsMultiMovies;