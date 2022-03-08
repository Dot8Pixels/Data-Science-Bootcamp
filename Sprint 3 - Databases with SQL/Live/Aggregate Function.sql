--SELECT COUNT(*), COUNT(firstname), COUNT(company), COUNT(email) from customers;

SELECT 
	country, 
    COUNT(*) AS number_customers
FROM customers
WHERE country in ('USA', 'Canada', 'France')
GROUP BY 1
HAVING number_customers > 10
ORDER BY 2 DESC
LIMIT 5;