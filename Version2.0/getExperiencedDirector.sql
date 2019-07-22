alter proc getExperiencedDirector
@numberOfFilms int
as 
SELECT dbo.Director.FirstName, dbo.Director.LastName, dbo.Director.Address, dbo.Director.PerMovieSalary 
FROM dbo.Director
where dbo.Director.NumberOfFilms > @numberOfFilms

--EXEC getExperiencedDirector 3;