	DROP DATABASE IF EXISTS `DataBuzz`;
	
	CREATE DATABASE `DataBuzz`;
	
	use `DataBuzz`;
	
	CREATE TABLE employee (
	  employee_id INT NOT NULL,
	  first_name VARCHAR(50),
	  last_name VARCHAR(50),
	  age INT,
	  gender VARCHAR(10),
	  birth_date DATE,
	  PRIMARY KEY (employee_id)
	);
	
	CREATE TABLE employee_salary (
	  employee_id INT NOT NULL,
	  first_name VARCHAR(50) NOT NULL,
	  last_name VARCHAR(50) NOT NULL,
	  job_title VARCHAR(50),
	  salary INT,
	  dept_id INT
	);
    
    CREATE TABLE Exit_List (
	  employee_id INT NOT NULL,
	  first_name VARCHAR(50),
	  last_name VARCHAR(50),
      last_day DATE
    );
	
	
	INSERT INTO employee (employee_id, first_name, last_name, age, gender, birth_date)
	VALUES
	(1, 'John', 'Doe', 28, 'M', '1996-07-15'),
	(2, 'Jane', 'Smith', 32, 'F', '1992-05-21'),
	(3, 'Michael', 'Brown', 25, 'M', '1998-02-13'),
	(5, 'James', 'Wilson', 35, 'M', '1989-11-25'),
	(6, 'Olivia', 'Martinez', 29, 'F', '1995-09-30'),
	(7, 'William', 'Taylor', 45, 'M', '1979-06-17'),
	(8, 'Sophia', 'Anderson', 31, 'F', '1993-12-04'),
	(9, 'Liam', 'Thomas', 27, 'M', '1997-01-28'),
	(10, 'Isabella', 'Jackson', 34, 'F', '1990-04-12'),
	(11, 'Benjamin', 'White', 22, 'M', '2002-08-19'),
	(12, 'Charlotte', 'Harris', 26, 'F', '1998-10-03'),
	(13, 'Mason', 'Clark', 30, 'M', '1993-01-20'),
	(14, 'Clark', 'Kent', 61, 'M', '1963-01-20');
	INSERT INTO employee_salary (employee_id, first_name, last_name, job_title, salary, dept_id)
	VALUES
	(1, 'John', 'Doe', 'Software Engineer', 95000, 1),
	(2, 'Jane', 'Smith', 'HR Manager', 85000, 2),
	(3, 'Michael', 'Brown', 'Data Analyst', 75000, 3),
	(4, 'Emily', 'Davis', 'Marketing Director', 120000, 4),
	(5, 'James', 'Wilson', 'Product Manager', 105000, 5),
	(6, 'Olivia', 'Martinez', 'Sales Executive', 70000, 6),
	(7, 'William', 'Taylor', 'Chief Technology Officer', 180000, 1),
	(8, 'Sophia', 'Anderson', 'HR Specialist', 65000, 2),
	(9, 'Liam', 'Thomas', 'Financial Analyst', 80000, 7),
	(11, 'Benjamin', 'White', 'Junior Developer', 60000, 1),
	(12, 'Charlotte', 'Harris', 'Operations Manager', 90000, 8),
	(13, 'Mason', 'Clark', 'Systems Administrator', 82000, 9);
	
	
	
	CREATE TABLE departments (
	  department_id INT NOT NULL AUTO_INCREMENT,
	  department_name varchar(50) NOT NULL,
	  PRIMARY KEY (department_id)
	);
	
	INSERT INTO departments (department_name)
	VALUES
	('Engineering'),
	('Human Resources'),
	('Business Analysis'),
	('Marketing'),
	('Product Management'),
	('Sales'),
	('Finance'),
	('Operations'),
	('IT Support');