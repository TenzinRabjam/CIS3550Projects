use CS3550Summer2018;

with ActorTotalEarning2018 (ActorFirstName, ActorLastName, totalEarning) As (
SELECT  
	dbo.Actor.FirstName , dbo.Actor.LastName, SUM(dbo.Actor.SalaryPerMovie)
FROM 
	dbo.Actor
INNER JOIN 
	dbo.ActorsFilmIndex on dbo.ActorsFilmIndex.ActorID = dbo.Actor.ActorID  
INNER JOIN 
	dbo.Film on dbo.ActorsFilmIndex.FilmID = dbo.Film.FilmID 
where 
	dbo.Film.Year = 2018
group by  
	dbo.Actor.FirstName , dbo.Actor.LastName)


SELECT ActorFirstName, ActorLastName, totalEarning from ActorTotalEarning2018;