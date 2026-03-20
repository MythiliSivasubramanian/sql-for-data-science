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

-- 8. Select employees whose name starts with C
SELECT name, department FROM employees WHERE name LIKE 'C%';

-- 9. Select employees whose name ends with e
SELECT name, department FROM employees WHERE name LIKE '%e';

-- 10. Select employees whose name contains a
SELECT name, department FROM employees WHERE name LIKE '%a%';

/*
Day 2 : More practice on AND OR NOT conditions
Database : common_datasets/sample_dataset.db
*/

-- 11. Employees from IT department and salary greater than 58000
SELECT name, department, salary FROM employees WHERE (department = 'IT' AND salary > 58000);

-- 12. Employees from HR or salary less than 55000
SELECT name, department, salary FROM employees WHERE (department = 'HR' OR salary < 55000);

-- 13. Employees not in IT and salary above 50000
SELECT name, department, salary FROM employees WHERE (department != 'IT' AND salary > 50000);

-- 14. Employees from Finance with salary between 54000 and 62000
SELECT name, department, salary FROM employees WHERE (department = 'Finance' AND salary BETWEEN 54000 AND 62000);

-- 15. Employees whose name starts with A or D
SELECT name, department FROM employees WHERE name LIKE 'A%' OR name LIKE 'D%';

-- 16. Employees not in HR or Finance
SELECT name, department FROM employees WHERE department NOT IN ('HR','Finance');
SELECT name, department FROM employees WHERE department != 'HR' AND department != 'Finance';

-- 17. Show all employees sorted by salary descending
SELECT * FROM employees ORDER BY salary DESC;

-- 18. Show name and salary of employees from IT sorted by salary ascending
SELECT name, salary FROM employees WHERE department = 'IT' ORDER BY salary ASC;

