-- 1. Retrieve all columns:
-- This query retrieves every column (employee_id, first_name, last_name, job_title, salary, dept_id) from the employee_salary table.
SELECT * FROM employee_salary;

-- 2. Retrieve specific columns:
-- This query retrieves only the first_name, last_name, and salary of each employee from the employee_salary table.
SELECT first_name, last_name, salary FROM employee_salary;

-- 3. Using the WHERE condition:
-- This query retrieves the first name, last name, and salary of employees who earn more than $80,000.
SELECT first_name, last_name, salary 
FROM employee_salary 
WHERE salary > 80000;

-- 4. Combining conditions with AND, OR, and using IN:
-- AND: This query retrieves the first name, last name, and job title of employees who are in the 'Engineering' department and earn more than $70,000.
SELECT first_name, last_name, job_title, salary 
FROM employee_salary 
WHERE dept_id = 1 AND salary > 70000;

-- OR: This query retrieves the first name, last name, and job title of employees who are either in the 'Engineering' department or earn more than $100,000.
SELECT first_name, last_name, job_title, salary 
FROM employee_salary 
WHERE dept_id = 1 OR salary > 100000;

-- IN: This query retrieves the first name, last name, and job title of employees who are in either the 'Engineering' or 'Finance' departments.
SELECT first_name, last_name, job_title 
FROM employee_salary 
WHERE dept_id IN (1, 7);

-- 5. Sorting results with ORDER BY:
-- This query retrieves all the employees from the employee_salary table, sorted by salary in descending order (highest salary first).
SELECT * FROM employee_salary 
ORDER BY salary DESC;

-- 6. Grouping results with GROUP BY:
-- This query groups employees by department and calculates the average salary in each department.
SELECT dept_id, AVG(salary) AS average_salary 
FROM employee_salary 
GROUP BY dept_id;

-- 7. Using HAVING vs WHERE:
-- WHERE: This query filters rows before the grouping; it retrieves employees from the 'Engineering' department and calculates their average salary.
SELECT dept_id, AVG(salary) AS average_salary 
FROM employee_salary 
WHERE dept_id = 1
GROUP BY dept_id;

-- HAVING: This query calculates the average salary for each department and then filters to show only departments with an average salary greater than $75,000.
SELECT dept_id, AVG(salary) AS average_salary 
FROM employee_salary 
GROUP BY dept_id
HAVING AVG(salary) > 75000;

-- 8. Limiting results and using aliases for readability:
-- LIMIT: This query retrieves the first 3 employees with the highest salaries.
SELECT first_name, last_name, salary 
FROM employee_salary 
ORDER BY salary DESC 
LIMIT 3;

-- Aliasing: This query retrieves the employee ID, first name, and last name, with an alias for each column for better readability.
SELECT employee_id as ID, first_name FirstName, last_name LastName 
FROM employee_salary;
