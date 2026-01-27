-- aggregations_practice.sql
-- Practicing COUNT, SUM, AVG, MIN, MAX, GROUP BY, HAVING
-- Database: datasets/sample.db


-- 1. Count total employees
SELECT COUNT(name) AS Emp_Count FROM employees;

-- 2. Sum of all salaries
SELECT SUM(salary) AS Total_salaries_all_emp FROM employees;

-- 3. Average salary overall (of all employees)
SELECT AVG(salary) AS Avg_salary FROM employees;

-- 4. Minimum and maximum salary
SELECT MIN(salary) AS Min_Salary, 
    MAX(salary) AS Max_Salary 
FROM employees;

-- 5. Average salary per department 
SELECT department, 
    AVG(salary) AS Avg_salary_per_dept 
FROM employees 
GROUP BY department;

-- 6. Show departments with average salary greater than 55000.
SELECT department,AVG(salary) FROM employees GROUP BY department HAVING AVG(salary) > 55000;

/*
7. Find the average salary per department,
but only include employees earning more than 50,000.
Show only departments where the average salary is greater than 55,000.
*/

SELECT department, AVG(salary) 
FROM employees 
WHERE (salary > 50000)
GROUP BY department
HAVING (AVG(salary) > 55000);

/*
For each department: find number of employees, total salary, average salary.
Only include departments where:
Employee count is at least 2
Average salary is greater than 54,000
Results by total salary descending
*/
 
SELECT department,
       COUNT(*) AS Emp_Count,  -- COUNT(*) is to count rows even when name field is null or missing
       SUM(salary) AS Total_Salary,
       AVG(salary) AS Avg_Salary
FROM employees
GROUP BY department
HAVING COUNT(*) >= 2 AND AVG(salary) > 54000
ORDER BY Total_Salary DESC;


/* IMPORTANT NOTES:
Cannot use column aliases in HAVING and usually not in WHERE aswell. 
SELECT SUM(salary) AS Total_Salary FROM employees HAVING Total_Salary > 50000; is wrong
SELECT SUM(salary) AS Total_Salary FROM employees HAVING SUM(salary) > 50000; is correct because
Even though the aliases are defined in SELECT SQL evaluates HAVING before the SELECT aliases are finalized.
*/

