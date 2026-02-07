/*
File        : case_when_salary_band_analysis.sql
Practice    : CASE WHEN + GROUP BY Aggregation
Objective   : Classify employees into salary bands
Bands       : Low, Medium, High
Metrics     : Employee count, Average salary
*/


SELECT 
CASE
    WHEN e.salary < 40000 THEN 'Low'
    WHEN e.salary BETWEEN 40000 AND 70000 THEN 'Medium'
    ELSE 'High'
    END AS salary_band,
    COUNT(e.id) AS employee_count,
    ROUND(AVG(e.salary), 2) AS avg_salary
FROM employees_join e
GROUP BY salary_band;
