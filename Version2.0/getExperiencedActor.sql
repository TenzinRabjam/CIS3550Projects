alter proc getExperiencedActor 
@numberOfFilms int
as 
SELECT dbo.Actor.FirstName, dbo.Actor.LastName, dbo.Actor.Address, dbo.Actor.Gender, dbo.Actor.SalaryPerMovie 
FROM dbo.Actor

where dbo.Actor.NumberOfMovies > @numberOfFilms

EXEC getExperiencedActor 3;