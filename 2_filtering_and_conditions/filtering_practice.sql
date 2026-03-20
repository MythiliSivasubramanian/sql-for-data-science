-- 2_filtering_and_conditions/filtering_practice.sql

/*
Practicing filtering and conditions on employees table.
Database is in common_datasets folder with file name as sample_dataset.db
*/

-- 1. Select all employees from IT department
SELECT * FROM employees WHERE department = 'IT';

-- 2. Select name and salary of employees earning less than 60000
SELECT name, salary FROM employees WHERE salary < 60000;

-- 3. Select employees whose salary is greater than or equal to 55000
SELECT name, department, salary FROM employees WHERE salary >= 55000;

-- 4. Select employees from HR or Finance
SELECT name, department FROM employees WHERE department IN ('HR','Finance');
SELECT name, department FROM employees WHERE department = 'HR' OR department = 'Finance';

-- 5. Select employees not working in Finance
SELECT name, department FROM employees WHERE department != 'Finance';
SELECT name, department FROM employees WHERE department <> 'Finance';

-- 6. Select employees whose salary is between 52000 and 62000
SELECT name, salary FROM employees WHERE salary BETWEEN 52000 AND 62000;

-- 7. Select employees whose salary is not between 52000 and 62000
SELECT name, salary FROM employees WHERE salary NOT BETWEEN 52000 AND 62000;
SELECT name, salary FROM employees WHERE salary < 52000 OR salary > 62000;

