-- Query all of the entries in the Genre table
SELECT "GenreId", "label"
FROM Genre;

SELECT "title", "SongLength", "releaseDate"
FROM Song;

-- Using the INSERT statement, add one of your favorite artists to the Artist table.

INSERT INTO Artist (ArtistId, ArtistName, YearEstablished)
VALUES (null, "Joe Lizzo", 2019);

-- Using the INSERT statement, add one, or more, albums by your artist to the Album table.
INSERT INTO Album (AlbumId, Title, ReleaseDate, AlbumLength, Label, ArtistId, GenreId)
VALUES (null, "taking care of business", "9/9/99", 1099, "mau5trap", 28, 5);

-- Using the INSERT statement, add some songs that are on that album to the Song table.
INSERT INTO Song (SongId, Title, SongLength, ReleaseDate, GenreId, ArtistId, AlbumId)
VALUES (null, "bitch who", 69, "11/1/1111", 14, 28, 23);

UPDATE Song
SET Title = "Just another day"
WHERE GenreId = 2;
-- Write a SELECT query that provides the song titles, album title, and artist name for all of the data you just entered in. Use the LEFT JOIN keyword sequence to connect the tables, and the WHERE keyword to filter the results to the album and artist you added.

-- Reminder: Direction of join matters. Try the following statements and see the difference in results.

SELECT a.Title, s.Title FROM Album a LEFT JOIN Song s ON s.AlbumId = a.AlbumId;
SELECT a.Title, s.Title FROM Song s LEFT JOIN Album a ON s.AlbumId = a.AlbumId;
-- Write a SELECT statement to display how many songs exist for each album. You'll need to use the COUNT() function and the GROUP BY keyword sequence.
SELECT COUNT(SongId), Title
FROM Song
GROUP BY Title;

-- Write a SELECT statement to display how many songs exist for each artist. You'll need to use the COUNT() function and the GROUP BY keyword sequence.
SELECT COUNT(Song.ArtistId), Artist.ArtistName
FROM song
JOIN Artist
ON Artist.ArtistId = Song.ArtistId
GROUP BY Song.ArtistId;

-- Write a SELECT statement to display how many songs exist for each genre. You'll need to use the COUNT() function and the GROUP BY keyword sequence.
SELECT COUNT(Song.GenreId), Genre.Label
FROM Song
JOIN Genre
ON Genre.GenreId = Song.GenreId
GROUP BY Song.GenreId;

-- Using MAX() function, write a select statement to find the album with the longest duration. The result should display the album title and the duration.
SELECT MAX(AlbumLength), Title
FROM Album;

-- Using MAX() function, write a select statement to find the song with the longest duration. The result should display the song title and the duration.
SELECT MAX(SongLength), Title, SongLength
FROM Song;

-- Modify the previous query to also display the title of the album.
SELECT MAX(Song.SongLength), Song.Title, Album.Title
FROM Song
JOIN Album
ON Song.AlbumId = Album.AlbumId;
