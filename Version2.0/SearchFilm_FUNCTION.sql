
alter function GetFilm(
	@Film_Name AS VARCHAR(100)
)
RETURNS TABLE AS RETURN 
	SELECT 
	
	-- top 1

dbo.Film.Title, dbo.Film.Description, dbo.Film.ReleaseDate, 
dbo.Actor.FirstName as ActorFirstName, dbo.Actor.LastName as ActorLastName, 
dbo.Director.FirstName as DirectorFirstName, dbo.Director.LastName as DirectorLastName

FROM dbo.Film
left join dbo.ActorsFilmIndex on dbo.ActorsFilmIndex.FilmID = dbo.Film.FilmID 
left join dbo.Actor on dbo.Actor.ActorID = dbo.ActorsFilmIndex.ActorID 
left join dbo.DirectorFilmIndexID on  dbo.DirectorFilmIndexID.FilmID = dbo.Film.DirectorFilmIndexID 
left join dbo.Director on dbo.Director.DirectorID = dbo.DirectorFilmIndexID.DirectorID 
where dbo.Film.Title = @Film_Name

--without top 1 it is coming 5 rows

--select top 1 * from GetFilm('Millenium 2 ');   


--------------------------------------------------------------------------------------------------------

ALTER FUNCTION Get_Actors_Price(@actorId as int)
RETURNS TABLE AS RETURN


SELECT 
Concat(dbo.Actor.FirstName, ' ', dbo.Actor.LastName  ,' has a request of $',dbo.Actor.SalaryPerMovie, ' per movie.') as ActorsPrice 
from dbo.Actor 
where dbo.Actor.ActorID = @actorId
	


--SELECT * from Get_Actors_Price(2);

--create function actorsIn2018 
--RETURNS TABLE AS RETURN with ActorTotalEarning2018 (ActorFirstName, ActorLastName, totalEarning) As (
--SELECT  
--	dbo.Actor.FirstName , dbo.Actor.LastName, SUM(dbo.Actor.SalaryPerMovie)
--FROM 
--	dbo.Actor
--INNER JOIN 
--	dbo.ActorsFilmIndex on dbo.ActorsFilmIndex.ActorID = dbo.Actor.ActorID  
--INNER JOIN 
--	dbo.Film on dbo.ActorsFilmIndex.FilmID = dbo.Film.FilmID 
--where 
--	dbo.Film.Year = 2018
--group by  
--	dbo.Actor.FirstName , dbo.Actor.LastName)


--SELECT ActorFirstName, ActorLastName, totalEarning from ActorTotalEarning2018;
