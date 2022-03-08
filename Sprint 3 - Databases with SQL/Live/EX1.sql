SELECT
	cus.firstname,
    cus.lastname,
    cus.country,
    cus.email,
    SUM(inv.total) AS total_revenue
FROM customers cus
JOIN invoices inv ON cus.CustomerId = inv.customerid
WHERE STRFTIME('%Y', invoicedate) = '2010'
GROUP BY 1, 2, 3
ORDER BY 4 DESC LIMIT 5;