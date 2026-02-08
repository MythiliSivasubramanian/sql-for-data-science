-- Task 1 — Employee Count per Department
- Task 2 — Average Salary per Department
- Task 3 — Filter High-Paying Departments avg_salary > 60000

SELECT * FROM employees_join;
SELECT * FROM departments;

SELECT department_id,
       COUNT(id) AS emp_count,
       ROUND(AVG(salary),2) AS avg_salary
FROM employees_join
GROUP BY department_id
HAVING AVG(salary) > 60000;