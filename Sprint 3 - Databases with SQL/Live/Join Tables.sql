/*SELECT * FROM artists, albums
WHERE artists.ArtistId = albums.ArtistId;*/

/*SELECT
	artists.*,
    albums.title,
    tracks.name AS trackName,
    tracks.composer,
    genres.name AS genreName
FROM artists 
JOIN albums ON artists.ArtistId = albums.ArtistId
JOIN tracks ON albums.albumid = tracks.albumid
JOIN genres ON tracks.genreid = genres.GenreId;*/

SELECT artists.Name, COUNT(*)
FROM artists 
JOIN albums ON artists.ArtistId = albums.ArtistId
JOIN tracks ON albums.albumid = tracks.albumid
JOIN genres ON tracks.genreid = genres.GenreId
WHERE genres.name = 'Rock'
GROUP BY artists.name ORDER BY COUNT(*) DESC LIMIT 5;