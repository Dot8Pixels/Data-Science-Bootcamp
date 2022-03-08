SELECT cus.firstname, SUM(sub.total) FROM customers cus
JOIN (
  SELECT * FROM invoices
  WHERE STRFTIME('%Y', invoicedate) = '2010'
  ) sub
ON cus.customerid = sub.customerid
GROUP BY 1
ORDER BY 2 LIMIT 5;