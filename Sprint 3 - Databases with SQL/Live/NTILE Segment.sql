/*SELECT 
	name, 
    milliseconds,
    NTILE(5) OVER(ORDER BY milliseconds) AS Segment
FROM tracks;*/

SELECT * FROM (
  SELECT 
      name, 
      milliseconds,
      NTILE(5) OVER(ORDER BY milliseconds) AS Segment
  FROM tracks
  )
WHERE Segment = 3;