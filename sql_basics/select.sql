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