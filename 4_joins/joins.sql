-- JOIN Queries Pratice
-- Related datasets: common_datasets/sample_database.db
-- Table employees_join and departments created in create_tables_for_joins.sql

-- 1. Show employee name, department name, and salary
-- Only include employees who have a valid department (so: INNER JOIN)
SELECT e.name,
       d.department_name,
       e.salary
FROM employees_join e
INNER JOIN departments d
ON e.department_id = d.id;


-- 2. Show employee name, department name, and salary include ALL employees, even if they don’t have a valid department
-- All employees even without valid dept_id. So LEFT JOIN
SELECT e.name,
       d.department_name,
       e.salary
FROM employees_join e
LEFT JOIN departments d
ON e.department_id = d.id;

/*
3. Show all employees, 
Show department name if exists. 
Highlight IT employees in logic, but do NOT remove others
*/
SELECT e.name,
       d.department_name,
       e.salary,
CASE
    WHEN d.department_name = 'IT' THEN 'Yes'
    ELSE 'No'
END AS is_it
FROM employees_join e
LEFT JOIN departments d
ON e.department_id = d.id;

/*
4. Show only employees who belong to the IT department.
Display employee name, department name, and salary.
*/
SELECT e.name, 
       d.department_name,
       e.salary
FROM employees_join e
INNER JOIN departments d    -- INNER JOIN is used as we need only valid specific department (IT)
ON e.department_id = d.id
WHERE d.department_name = 'IT';

/*
5. Show ALL employees who are earning more than 55,000.
Show name, department_name, salary
*/
SELECT e.name,
       d.department_name,
       e.salary
FROM employees_join e
LEFT JOIN departments d
ON e.department_id = d.id
WHERE (e.salary > 55000);

/*
6. Show ALL employees:  Show name, department_name, salary
Show only IT department name, but do NOT remove non-IT employees
*/
SELECT e.name,
       d.department_name,
       e.salary
FROM employees_join e
LEFT JOIN departments d
ON e.department_id = d.id  
AND d.department_name = 'IT'; -- LEFT JOIN with condition in ON clause
/*
ON e.department_id = d.id  
AND d.department_name = 'IT'
Only joins a department row when it is IT
For HR/Finance employees, the join fails → d.department_name becomes NULL
*/

--  ----------------------------

/*
7. For each department, show: department name, number of employees and average salary
Include departments even if they have zero employees
*/
SELECT d.department_name,
       COUNT(e.id) AS Emp_count,
       AVG(e.salary)
FROM employees_join e
RIGHT JOIN departments d     -- RIGHT JOIN is used since we want all departments even with 0 employees
ON e.department_id = d.id
GROUP BY d.department_name;

-- 8. Show departments with exactly 1 employee
SELECT d.department_name,
       COUNT(e.id) AS Emp_count
FROM employees_join e
LEFT JOIN departments d
ON e.department_id = d.id
GROUP BY d.department_name
HAVING COUNT(e.id) = 1;


-- 9 Show departments where total salary ≥ 11000
SELECT d.department_name,
       COALESCE(SUM(e.salary), 0) AS total_salary
       -- If a department has no employees, SUM(e.salary) becomes NULL.
       -- With COALESCE(...,0) your logic stays numeric and predictable.
FROM departments d
LEFT JOIN employees_join e
  ON e.department_id = d.id
GROUP BY d.department_name
HAVING COALESCE(SUM(e.salary), 0) >= 11000;


-- 10. Show departments excluding Legal, but only if employee count > 1

SELECT d.department_name,
       COUNT(e.id) AS emp_count
FROM departments d
LEFT JOIN employees_join e
  ON e.department_id = d.id
WHERE d.department_name <> 'Legal'
GROUP BY d.department_name
HAVING COUNT(e.id) > 1;



SELECT d.department_name,
       COUNT(e.id) AS emp_count
FROM departments d
LEFT JOIN employees_join e
  ON e.department_id = d.id
GROUP BY d.department_name
HAVING COUNT(e.id) > 1
   AND d.department_name <> 'Legal';


-- Day 2 pratice on joins

-- 11. Show departments where: average salary > 60000 and employees earning < 30000 are ignored
--include departments with zero employees

SELECT d.department_name, 
  AVG(CASE WHEN e.salary > 30000 THEN e.salary END) AS Avg_salary_of_emp_above_30000,
  COUNT(e.id) AS Emp_count
FROM departments d
LEFT JOIN employees_join e
ON e.department_id = d.id
GROUP BY d.department_name
HAVING AVG(CASE WHEN e.salary > 30000 THEN e.salary END) > 60000;


-- 12. Departments with at least 2 employees AND at least 1 employee earning > 70000 

SELECT * FROM employees_join;
SELECT * FROM departments;
SELECT d.department_name,
       COUNT(e.id) AS emp_count,
       SUM(CASE WHEN e.salary > 50000 THEN 1 ELSE 0 END) AS high_earners
FROM departments d
LEFT JOIN employees_join e
  ON e.department_id = d.id
GROUP BY d.department_name
HAVING COUNT(e.id) >= 2
   AND SUM(CASE WHEN e.salary > 50000 THEN 1 ELSE 0 END) >= 1;

-- 13. Show each department and the number of employees earning more than 50,000.
--Include departments even if the count is zero.
SELECT d.department_name,
       SUM(CASE WHEN e.salary > 50000 THEN 1 ELSE 0 END) AS high_salary_emp_count
FROM departments d
LEFT JOIN employees_join e
  ON e.department_id = d.id
GROUP BY d.department_name;

/*
14.  For each department, show: department_name, emp_count (total employees)
it_emp_count (employees that belong to the IT department)
*/

SELECT d.department_name,
       COUNT(e.id) AS Emp_count,
       SUM(CASE WHEN d.id = 2 THEN 1 else 0 END )AS IT_emp_count
FROM departments d
LEFT JOIN employees_join e
ON e.department_id = d.id
GROUP BY d.department_name;

/*
15. Show ALL departments where:
Total salary of employees earning ≥ 60000 is ≥ 120000.

-- Sum the salaries of employees whose salary ≥ 60000, per department,
and keep only departments where that sum ≥ 120000.
*/

SELECT  d.department_name,
        SUM(CASE WHEN e.salary >= 60000 THEN e.salary ELSE 0 END) AS Sum_salary_above_60000
FROM departments d
LEFT JOIN employees_join e
ON e.department_id = d.id
GROUP BY d.department_name
HAVING SUM(CASE WHEN e.salary >= 60000 THEN e.salary ELSE 0 END) >= 120000;

/*
16. Display ALL departments, and for each department show:
department_name , the number of employees earning ≥ 50000
Even if: a department has zero employees, or a department has employees but none earning ≥ 50000
it should still appear, with the count shown as 0.
*/

SELECT d.department_name,
       COUNT(CASE WHEN e.salary >= 50000 THEN 1 ELSE NULL END) AS Emp_count_salary_with_or_morethan_50000
FROM departments d
LEFT JOIN employees_join e
ON e.department_id = d.id
GROUP BY d.department_name;



SELECT d.department_name,
       SUM(CASE WHEN e.salary >= 50000 THEN 1 ELSE 0 END) AS Emp_count_salary_with_or_morethan_50000
FROM departments d
LEFT JOIN employees_join e
ON e.department_id = d.id
GROUP BY d.department_name;

-- 17. Show all departments and the number of employees earning ≥ 60000.

SELECT d.department_name,
       SUM(CASE WHEN e.salary >= 60000 THEN 1 ELSE 0 END) AS Emp_count_salary_with_or_morethan_60000
FROM departments d
LEFT JOIN employees_join e
ON e.department_id = d.id
GROUP BY d.department_name;

-- 18. Display ALL departments, and for each department, show: the total salary paid ONLY to employees who individually earn ≥ 60000

SELECT d.department_name,
    COALESCE(SUM(CASE WHEN e.salary >= 60000 THEN e.salary  END),0) AS Sum_salary_above_60000
FROM departments d
LEFT JOIN employees_join e
ON e.department_id = d.id
GROUP BY d.department_name;