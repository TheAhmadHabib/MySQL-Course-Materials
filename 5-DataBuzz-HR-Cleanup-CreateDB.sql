DROP TABLE IF EXISTS `hr_cleanup`;

CREATE TABLE hr_cleanup (
    employee_id INT,
    first_name VARCHAR(50),
    last_name VARCHAR(50),
    email VARCHAR(100),
    phone_number VARCHAR(20),
    hire_date VARCHAR(20),
    salary VARCHAR(20),
    dept_id VARCHAR(10)
);

INSERT INTO hr_cleanup (employee_id, first_name, last_name, email, phone_number, hire_date, salary, dept_id)
VALUES 
(1, 'John', 'Doe', 'john.doe@example.com', '(123) 456-7890', '2023-05-01', '85,000', '101'),
(2, 'Jane', NULL, 'jane.smith@company.com', '123-456-7890', '2023/04/15', '90000', '102'),
(3, 'Michael', 'Brown', 'michael.brown@company.com', '4567890123', 'May 21, 2023', '75K', NULL),
(4, NULL, 'Davis', 'emily.davis@example.com', '(123)4567890', '2023.06.01', '$60,000', '104'),
(5, 'James', 'Wilson', 'jameswilson@company.com', '1234567890', '2023-07-15', '95000.00', '10A'),
(6, 'Olivia', 'Martinez', 'olivia.martinez@example.com', '987-654-3210', '2023-08-01', '105000', '106'),
(7, 'William', 'Taylor', 'william.taylor@example.com', '555-789-0123', '01-09-2023', '100,000', '101'),
(8, 'Sophia', 'Taylor ', 'sophia.taylor@example', '123.456.7890', '2023-02-28', '$100,000', '102'),
(9, 'Liam', 'Thomas', 'liam.thomas@example.com', '123/456/7890', '2023/10/05', NULL, '107'),
(10, 'Isabella', 'Jackson', 'isabella.jackson@example.com', 'N/A', '2023-11-01', '80,000', '108'),
(11, 'John', 'Doe', 'john.doe@example.com', '(123) 456-7890', '2023-05-01', '85,000', '101');

