/*SELECT
	firstname,
    country,
    email
FROM customers
WHERE LOWER(country) IN('canada', 'usa', 'brazil');*/

/*SELECT
	firstname,
    country,
    email
FROM customers
WHERE email LIKE '%@gmail.com';*/

/*SELECT
	firstname,
    country,
    email
FROM customers
WHERE firstname LIKE 'J___' and country = 'USA';*/

SELECT 
	STRFTIME('%Y-%m-%d', invoicedate),
    billingaddress 
FROM invoices
WHERE 
	STRFTIME('%m', invoicedate) = '04' 
    AND STRFTIME('%Y', invoicedate) = '2009';