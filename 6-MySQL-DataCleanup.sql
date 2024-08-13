Select * from hr_cleanup;


-- 1. Handling Missing Data

-- Identify rows with missing data
SELECT * 
FROM hr_cleanup
WHERE first_name IS NULL 
   OR last_name IS NULL 
   OR email IS NULL 
   OR dept_id IS NULL 
   OR salary IS NULL;

-- Update missing first_name or last_name to 'Unknown'
UPDATE hr_cleanup 
SET Last_name = 'Smith'
WHERE employee_id =2;

UPDATE hr_cleanup
SET first_name = 'Emily'
WHERE employee_id =4;

-- 2. Standardizing Data Formats

-- Normalize hire_date to YYYY-MM-DD format
UPDATE hr_cleanup
SET hire_date = STR_TO_DATE(hire_date, '%Y-%m-%d')
WHERE hire_date LIKE '___%-%-%';

UPDATE hr_cleanup
SET hire_date = STR_TO_DATE(hire_date, '%Y/%m/%d')
WHERE hire_date LIKE '___%/%/%';

UPDATE hr_cleanup
SET hire_date = STR_TO_DATE(hire_date, '%Y.%m.%d')
WHERE hire_date LIKE '___%.%.%';

UPDATE hr_cleanup
SET hire_date = STR_TO_DATE(hire_date, '%m/%d/%Y')
WHERE hire_date LIKE '__%/__%/____%';

UPDATE hr_cleanup
SET hire_date = STR_TO_DATE(hire_date, '%M %d, %Y')
WHERE hire_date LIKE '% %,%';

UPDATE hr_cleanup
SET hire_date = STR_TO_DATE(hire_date, '%d-%m-%Y')
WHERE hire_date LIKE '__%-%-____%';

-- Select hire date to see results

SELECT DISTINCT hire_date from hr_cleanup;

-- Standardize phone numbers to XXX-XXX-XXXX format
UPDATE hr_cleanup
SET phone_number = CONCAT(
    SUBSTRING(phone_number, 2, 3), '-',
    SUBSTRING(phone_number, 7, 3), '-',
    SUBSTRING(phone_number, 11, 4)
)
WHERE phone_number LIKE '(%';

UPDATE hr_cleanup
SET phone_number = CONCAT(
    SUBSTRING(phone_number, 1, 3), '-',
    SUBSTRING(phone_number, 5, 3), '-',
    SUBSTRING(phone_number, 9, 4)
)
WHERE phone_number LIKE '%.%';

UPDATE hr_cleanup
SET phone_number = CONCAT(
    SUBSTRING(phone_number, 1, 3), '-',
    SUBSTRING(phone_number, 5, 3), '-',
    SUBSTRING(phone_number, 9, 4)
)
WHERE phone_number LIKE '%/%';

-- Normalize salary to numeric format
UPDATE hr_cleanup
SET salary = REPLACE(REPLACE(REPLACE(salary, '$', ''), ',', ''), 'K', '000')
WHERE salary LIKE '%$%' OR salary LIKE '%,%' OR salary LIKE '%K';

-- 3. Validating Data

-- Validate email format (simplified example)
SELECT * 
FROM hr_cleanup
WHERE email NOT LIKE '%_@__%.__%';

-- Validate hire_date as a proper date
SELECT * 
FROM hr_cleanup
WHERE hire_date IS NULL OR hire_date = '0000-00-00';

-- Validate dept_id is numeric (MySQL doesn't have isnumeric funciton however we can workaround it using a math trick or regular expressions 
SELECT * 
FROM hr_cleanup
WHERE concat('',dept_id * 1) <> dept_id; -- REGEXP '^[0-9]+$';

-- Example correction: Replace '10A' with a valid dept_id
UPDATE hr_cleanup
SET dept_id = '101' 
WHERE dept_id = '10A';

-- 4. Removing Duplicates

-- Identify duplicates by a criteria (e.g., duplicate email)
SELECT email, COUNT(*)
FROM hr_cleanup
GROUP BY email
HAVING COUNT(*) > 1;

-- Remove duplicates by a criteria (e.g., duplicate email)
DELETE t1 FROM hr_cleanup t1
inner join hr_cleanup t2
on t1.email=t2.email
and t1.employee_id > t2.employee_id;


-- 5. Data Type Correction

-- Convert salary to a numeric data type
ALTER TABLE hr_cleanup
MODIFY COLUMN salary DECIMAL(10, 2);

-- 6. Trimming Whitespace

-- Trim leading and trailing spaces in first_name and last_name
UPDATE hr_cleanup
SET first_name = TRIM(first_name), last_name = TRIM(last_name);

-- 7. Correcting Common Errors

-- Replace common placeholders (like 'N/A') with NULL
UPDATE hr_cleanup
SET phone_number = NULL
WHERE phone_number like '%N/A%';

-- Final Verification

-- Check the cleaned-up data
SELECT * FROM hr_cleanup;
