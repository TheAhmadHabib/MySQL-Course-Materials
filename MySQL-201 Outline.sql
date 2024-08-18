/* Let's re-examine our data set
   first we select all employees from employee and employee_salary tables, try to find the difference
*/


/* 1. INNER JOIN:
-- This query retrieves the employee details by joining the employee table with the employee_salary table based on employee_id.
-- Since employee 4 is missing from the employee table, they will not appear in the result even though they are in the employee_salary table.
*/

/* 2. LEFT JOIN:
-- This query retrieves all employees from the employee table and their corresponding salary details, including those without a matching record in the employee_salary table.
-- Employee 4, who is missing from the employee table, will not appear because this join starts from the left table (employee).
*/

/* 3. RIGHT JOIN:
-- This query retrieves all employees from the employee_salary table and their details from the employee table, including those without a matching record in the employee table.
-- Since employee 4 is present in the employee_salary table but missing from the employee table, their salary and job title will appear with NULLs for the employee details.
*/

/* Difference between INNER JOIN, LEFT JOIN and RIGHT JOIN in this context:
-- INNER JOIN: Ensures that only rows common in both tables are included
-- LEFT JOIN: Ensures that all rows from the employee table are included, but since employee 4 is missing from the employee table, they won't appear.
-- RIGHT JOIN: Ensures that all rows from the employee_salary table are included, so employee 4 will appear with NULLs for their employee details.
*/

/* 4. FULL OUTER JOIN (Note: Not available in some SQL dialects including MySQL):
-- This query retrieves all employees and their salary details, showing NULL where there is no match.
-- If your SQL dialect supports FULL OUTER JOIN, this would show both employees and their salaries, even if one table is missing a corresponding record.
-- Since employee 4 is missing from the employee table, their details will appear with NULLs for the employee columns.
-- The below query won't work on MySQL as full joins are not supported


SELECT e.employee_id, e.first_name, e.last_name, es.job_title, es.salary 
FROM employee e
FULL OUTER JOIN employee_salary es ON e.employee_id = es.employee_id;

*/

/* 5. While Full outer join is not supported, we can simulate it with UNION:

SELECT e.employee_id, e.first_name, e.last_name, es.job_title, es.salary 
FROM employee e
LEFT JOIN employee_salary es ON e.employee_id = es.employee_id
UNION
SELECT e.employee_id, e.first_name, e.last_name, es.job_title, es.salary 
FROM employee e
RIGHT JOIN employee_salary es ON e.employee_id = es.employee_id;
*/