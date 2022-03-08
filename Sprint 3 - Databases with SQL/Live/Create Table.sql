CREATE TABLE emails AS
  SELECT 
      firstname, 
      lastname, 
      firstname || ' ' || lastname AS FullName,
      firstname || '@gmail.com' AS NewEmail
  FROM customers;