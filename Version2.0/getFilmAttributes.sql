alter proc getFilmAttributes 
@filmName varchar
as 
SELECT 
dbo.Film.Title, dbo.Film.Description, dbo.Film.ReleaseDate, 
dbo.Actor.FirstName as ActorFirstName, dbo.Actor.LastName as ActorLastName, 
dbo.Director.FirstName as DirectorFirstName, dbo.Director.LastName as DirectorLastName

FROM dbo.Film
left join dbo.ActorsFilmIndex on dbo.ActorsFilmIndex.FilmID = dbo.Film.FilmID 
left join dbo.Actor on dbo.Actor.ActorID = dbo.ActorsFilmIndex.ActorID 
left join dbo.DirectorFilmIndexID on  dbo.DirectorFilmIndexID.FilmID = dbo.Film.DirectorFilmIndexID 
left join dbo.Director on dbo.Director.DirectorID = dbo.DirectorFilmIndexID.DirectorID 
where dbo.Film.Title = @filmName

--EXEC getFilmAttributes 'Millenium 2';