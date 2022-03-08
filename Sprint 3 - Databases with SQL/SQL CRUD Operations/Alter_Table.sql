--ALTER TABLE employee RENAME To MyEmployee;

/*ALTER TABLE MyEmployee
ADD email TEXT;*/

UPDATE MyEmployee
SET email = 'ceo@company.com'
WHERE id = 1;

SELECT * FROM MyEmployee;