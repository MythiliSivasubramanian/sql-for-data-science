-- JOIN Queries Pratice
-- Related datasets: common_datasets/sample_database.db
-- Table employees_join and departments created in create_tables_for_joins.sql

-- 1. Show employee name, department name, and salary
-- Only include employees who have a valid department (so: INNER JOIN)
SELECT * FROM employees_join;
SELECT * FROM departments;
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

