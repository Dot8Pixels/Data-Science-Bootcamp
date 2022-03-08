SELECT
	ROW_NUMBER() OVER(PARTITION BY country ORDER BY firstname) AS RowNum,
	firstname,
    country
FROM customers;