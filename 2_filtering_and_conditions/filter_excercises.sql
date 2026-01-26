-- filtering_and_conditions/filter_exercises.sql
/*
Practicing filtering conditions on employees table. 
Dataset is in Folder common_datasets with file name as sample_dataset.db
*/


-- 1: Employees with salary > 55000
SELECT name, salary FROM employees WHERE salary > 55000;

-- 2: Employees in IT or Finance
SELECT name, department FROM employees WHERE department IN ('IT', 'Finance');

-- 3: Employees whose name starts with 'A'
SELECT name, department FROM employees WHERE name LIKE 'A%';

/*
Day 2 : Practicing WHERE conditions 
Database : common_datasets/sample_dataset.db
*/

-- 4. Select name and salary of employees whose salary is greater than 55,000.
SELECT name, salary FROM employees WHERE salary > 55000;

/*
5. Select name, department, and salary of employees 
who are in the IT department AND earn more than 60,000
*/
SELECT name, department, salary FROM employees WHERE (department = 'IT' AND salary > 60000);

-- 6. Select name and department of employees who work in HR or Finance.
SELECT name, department FROM employees WHERE department IN ('HR','Finance');
SELECT name, department FROM employees WHERE (department = 'HR' OR department = 'Finance');

-- 7. Select name and salary of employees whose salary is between 50,000 and 60,000 (inclusive).
SELECT name, salary FROM employees WHERE salary BETWEEN 50000 and 60000;

-- 8. Select name and department of employees whose name starts with the letter A.
SELECT name, department FROM employees WHERE name LIKE ('A%');

-- 9.Select name and department of employees who are NOT in the IT department.
SELECT name, department FROM employees WHERE department != 'IT';
SELECT name, department FROM employees WHERE department <> 'IT';

-- 10. Get names of employees NOT in HR or Finance
SELECT name FROM employees WHERE department != 'HR' AND department != 'Finance';
SELECT name FROM employees WHERE department <> 'HR' AND department <> 'Finance';
SELECT name FROM employees WHERE department NOT IN ('HR','Finance');

-- 11. Get employees who are in IT OR earn more than 58000
SELECT * FROM employees WHERE (department = 'IT' OR salary > 58000);

/*
12. Select employees who: are NOT in HR AND salary is between 52000 and 60000
show only name, department, salary, sort by salary descending
*/
SELECT name, department, salary 
FROM employees 
WHERE (department NOT IN ('HR') AND salary BETWEEN 52000 AND 60000) 
ORDER BY salary DESC;

SELECT name, department, salary 
FROM employees 
WHERE (department != 'HR' AND salary BETWEEN 52000 AND 60000) 
ORDER BY salary DESC;

-- 13. Get employees whose name starts with A or D. Show name and department
SELECT name, department FROM employees WHERE name LIKE 'A%' OR name LIKE 'D%';

-- 14. Employees from Finance with salary between 54000 and 60000. Show name, department, salary, sorted by salary ascending
-- SORT BY by default Ascending. 
SELECT name, department, salary FROM employees WHERE (department = 'Finance' AND salary BETWEEN 54000 AND 60000) ORDER BY salary;
SELECT name, department, salary FROM employees WHERE (department = 'Finance' AND salary BETWEEN 54000 AND 60000) ORDER BY salary ASC;

-- 15. Employees whose salary is NOT between 50000 and 60000.
SELECT * FROM employees WHERE salary NOT BETWEEN 50000 AND 60000;
SELECT * FROM employees WHERE salary < 50000 OR salary > 60000;


/*
Show name, department, salary of employees who:
Are NOT in HR, OR earn more than 58000, 
And their name starts with A or D,
Salary must NOT be between 50000 and 52000,
Sort the results by salary descending.
*/

SELECT name, department, salary 
FROM employees 
WHERE (department != 'HR' OR salary > 58000 ) 
AND (name LIKE 'A%' OR name LIKE 'D%') 
AND salary NOT BETWEEN 50000 AND 52000 
ORDER BY salary DESC;
