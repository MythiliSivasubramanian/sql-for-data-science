/*
Date 06 Feb 2026
Pratice : JOINS, GROUP BY, HAVING
Db: common_datasets/sample_dataset.db
*/

/*
Task : List all departments and show: department_name, employee_count, avg_salary (rounded to 2 decimals)
Filter to show only departments where:
employee_count >= 2
*/

SELECT d.department_name,
COUNT(e.id) AS emp_count,
ROUND(AVG(e.salary),2) AS Avg_salary -- Round to 2 decimals
FROM departments d
LEFT JOIN employees_join e
ON e.department_id = d.id
GROUP BY d.department_name
HAVING COUNT(e.id) >= 2;