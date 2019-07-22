SELECT        
	dbo.Film.FilmID, dbo.Film.Title, dbo.Film.ReleaseDate, 
	dbo.Actor.FirstName AS ActorFirstName, dbo.Actor.LastName AS ActorLastName, 
	dbo.Director.FirstName AS DirectorFirstName, 
    dbo.Director.LastName AS DirectorLastName

FROM  dbo.Film 

INNER JOIN  
	dbo.ActorsFilmIndex ON dbo.Film.ActorFilmIndexID = dbo.ActorsFilmIndex.ActorFilmIndexID INNER JOIN
    dbo.Actor ON dbo.ActorsFilmIndex.ActorID = dbo.Actor.ActorID CROSS JOIN
    dbo.Director