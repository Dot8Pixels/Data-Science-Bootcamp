/*SELECT 
	name, 
    salary,
    salary * 1.15 AS new_salary,
    LOWER(name) || '@company.com' AS company_email
FROM employee;*/

/*SELECT * FROM employee
WHERE department = 'Marketing' AND salary >= 90000;*/

/*SELECT * FROM employee
WHERE department IN ('Marketing', 'IT');*/

SELECT * FROM employee
WHERE salary <= 90000;