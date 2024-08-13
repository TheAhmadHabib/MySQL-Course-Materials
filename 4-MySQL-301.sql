-- 1. Common Table Expressions (CTEs)

-- This CTE calculates the average salary per department, and then we use it to find employees who earn more than the average salary in their department.
WITH AvgSalaryPerDept AS (
    SELECT dept_id, AVG(salary) AS avg_salary
    FROM employee_salary
    GROUP BY dept_id
)
SELECT es.employee_id, es.first_name, es.last_name, es.dept_id, es.salary, aspd.avg_salary
FROM employee_salary es
INNER JOIN AvgSalaryPerDept aspd ON es.dept_id = aspd.dept_id
WHERE es.salary > aspd.avg_salary;

-- 2. Temporary Tables

-- Creating a temporary table to store high-earning employees for further analysis.
CREATE TEMPORARY TABLE HighEarners AS
SELECT employee_id, first_name, last_name, salary
FROM employee_salary
WHERE salary > 100000;

-- Querying the temporary table to see the high earners.
SELECT * FROM HighEarners;

-- The temporary table is automatically dropped when the session ends.

-- 3. Stored Procedures

-- Creating a stored procedure to get employees by department.
DELIMITER $$
DROP PROCEDURE IF EXISTS `GetEmployeesByDept`;
CREATE PROCEDURE GetEmployeesByDept(p_dept_id INT)
BEGIN
    SELECT e.employee_id, e.first_name, e.last_name, es.dept_id ,es.job_title, es.salary
    FROM employee e
    INNER JOIN employee_salary es ON e.employee_id = es.employee_id
    WHERE es.dept_id = p_dept_id;
END $$
DELIMITER ;

-- Calling the stored procedure to get employees in department 1.
CALL GetEmployeesByDept(1);

-- 4. Triggers and Events

-- Trigger Example
-- Creating a trigger to automatically update the last modified date when an employee's salary is updated.
DELIMITER $$
DROP TRIGGER IF EXISTS `UpdateNames`; 
CREATE TRIGGER UpdateNames
AFTER UPDATE ON employee
FOR EACH ROW
BEGIN
    UPDATE employee_salary
    SET first_name = NEW.first_name,
		last_name = NEW.last_name
    WHERE employee_id = NEW.employee_id;
END$$employee_idemployee_salary
DELIMITER ;
-- Event Example
-- Creating an event to archive old employee salary records every year.

DELIMITER $$
DROP EVENT IF EXISTS `AddToExitList`;
CREATE EVENT AddToExitList
ON SCHEDULE EVERY 1 DAY
DO
BEGIN
    INSERT INTO exit_list (employee_id, first_name, last_name, last_day)
    SELECT employee_id, first_name, last_name, Date_ADD(CURDATE(), INTERVAL 7 DAY)
    FROM employee
    WHERE employee.age > 60;
END$$
DELIMITER ;
-- Check Employee is added to exit list
select * from exit_list
