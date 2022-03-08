/*SELECT name, bytes FROM tracks
ORDER bytes bytes DESC LIMIT 1;*/

SELECT name, bytes FROM tracks
WHERE bytes > (SELECT AVG(bytes) from tracks);