-- select.sql
-- Practicing all basic SELECT queries on employees table ( table from folder common_datasets with file name sample_dataset.db

-- 1. Select only the department column
SELECT department FROM employees;

-- 2. Select employees with salary > 55000
SELECT name FROM employees WHERE salary > 55000;

-- 3. Select names in alphabetical order, by default ascending. DESC for descending
SELECT name FROM employees ORDER BY name;
-- SELECT name FROM employees ORDER BY name ASC;

-- 4. Employees from IT with salary > 55000, sorted by name
SELECT * FROM employees WHERE department = 'IT' AND salary > 55000 ORDER BY name;

-- 5. Employees from Finance earning > 50000, sorted by salary descending
SELECT * FROM employees WHERE department = 'Finance' AND salary > 50000 ORDER BY salary DESC;

-- 6. Employees in HR or salary > 60000, show name & department, sorted by name
SELECT name, department FROM employees WHERE department = 'HR' OR salary > 60000 ORDER BY name;

-- 7. Select distinct departments (unique values)
SELECT DISTINCT department FROM employees;

-- 8. Select first 2 employees
SELECT * FROM employees LIMIT 2;

-- 9. Combine DISTINCT + LIMIT (top 3 departments with salary > 55000)
SELECT DISTINCT department FROM employees WHERE salary > 55000 LIMIT 3;

-- 2026-01-22: More SELECT practice (variations)

-- 10. Select only the salary column with alias
SELECT salary AS emp_salary FROM employees;

-- 12. Employees from Sales with salary > 50000, sorted by salary descending
SELECT name, salary FROM employees WHERE department = 'Sales' AND salary > 50000 ORDER BY salary DESC;

-- 13. Unique departments in alphabetical order
SELECT DISTINCT department FROM employees ORDER BY department;

-- 14. First 5 employees with salary > 55000, sorted by name
SELECT name, salary FROM employees WHERE salary > 55000 ORDER BY name LIMIT 5;

-- 15. Employees from IT or Finance, show name, department, salary, sorted by salary descending
SELECT name, department, salary FROM employees WHERE department IN ('IT', 'Finance') ORDER BY salary DESC;

-- 16. Rename columns: name → EmployeeName, salary → EmployeeSalary
SELECT name AS EmployeeName, salary AS EmployeeSalary, department FROM employees;

-- 17. Employees with salary between 40000 and 60000, sorted by department then name
SELECT name, department, salary FROM employees WHERE salary > 40000 AND salary < 60000 ORDER BY department, name;

-- 18. Top 3 highest salaries, show name, department, salary
SELECT name, department, salary FROM employees ORDER BY salary DESC LIMIT 3;

-- Day 3 Pratice on Aggregates
-- Aggregates Practice (COUNT, GROUP BY)
-- Date: 2026-01-23

-- 19. Count IT employees with salary >= 55000
SELECT COUNT(*) AS it_high_earners
FROM employees
WHERE department = 'IT'
  AND salary >= 55000;

-- 20. Count employees per department
SELECT department, COUNT(*) AS employee_count
FROM employees
GROUP BY department;

-- Day 4 Pratice on SELECT , GROUP BY , HAVING
-- Aggregates Practice (COUNT, SUM, AVG)
-- Date: 2026-01-25

-- 21. Count how many employees earn more than 50000
SELECT COUNT(*) FROM employees WHERE salary > 50000;

-- 22. Find the average salary of employees in the IT department.
SELECT AVG(salary) FROM employees WHERE department = 'IT';

-- 23. Count how many employees work in either HR or Finance.
SELECT COUNT(*) FROM employees WHERE (department = 'HR' OR department = 'Finance');
SELECT COUNT(*) FROM employees WHERE department IN ('HR','Finance');

/* 
24.Select name and salary of employees whose salary is between 45,000 and 65,000, 
sorted by salary ascending.
*/

SELECT name,salary FROM employees WHERE (salary BETWEEN 45000 AND 65000) ORDER BY salary;

/*
25. Show the total salary (SUM) paid to employees in the Sales department 
who earn more than 40,000.
*/
SELECT SUM(salary) FROM employees WHERE (salary > 40000 AND department = 'sales');

-- 26. Count how many employees are in each department.
SELECT department, COUNT(*) FROM employees GROUP BY department; 

/*
27. Find departments where the average salary is greater than 55,000. 
Show department and average salary.
*/
SELECT department, AVG(salary) FROM employees GROUP BY department HAVING AVG(salary) > 55000;

-- 28. Find the top 2 departments with the most employees.
SELECT department,COUNT(name) as Emp_count 
FROM employees 
GROUP BY department 
ORDER BY EMP_count 
LIMIT 2;

-- 29. Find the average salary for each department.
SELECT department, AVG(salary) FROM employees GROUP BY department;


/*
30. Show only the departments where the total salary (SUM) is greater than 110000.
Show: department and total salary
*/
SELECT department,SUM(salary) AS total_salary FROM employees GROUP BY department HAVING SUM(salary) > 110000;

/*
31. Find the average salary per department, but only for employees earning more than 52,000.
Show: department and average salary
*/
SELECT department, AVG(salary) FROM employees WHERE salary > 52000 GROUP BY department;

/*
32. Show departments where the average salary is greater than 55,000,
but only considering employees who earn more than 50,000.
Show: department and average salary
*/
SELECT department, AVG(salary) 
FROM employees 
WHERE salary > 50000 
GROUP BY department 
HAVING AVG(salary) > 55000;