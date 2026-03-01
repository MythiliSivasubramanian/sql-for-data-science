-- 2_filtering_and_conditions/filtering_topics.sql

/*
Database: common_datasets/sample_dataset.db
Main table: employees (id, name, department, salary)

1) IS NULL and IS NOT NULL
2) LIKE with % and _
3) Case-insensitive filtering (LOWER)
4) Operator precedence (AND vs OR)
5) Calculated conditions in WHERE
6) COALESCE for safer filtering
*/

-- A) IS NULL and IS NOT NULL
-- Note: Current employees table has no NULL values.
-- So creating a small temporary table to practice NULL filters.

DROP TABLE IF EXISTS employees_null_demo;

CREATE TEMP TABLE employees_null_demo (
    id INTEGER,
    name TEXT,
    department TEXT,
    salary INTEGER
);

INSERT INTO employees_null_demo (id, name, department, salary) VALUES
(1, 'Alice',   'HR',      50000),
(2, 'Bob',     NULL,      60000),
(3, 'Charlie', 'Finance', NULL),
(4, 'Diana',   'IT',      62000);

-- 1. Rows where department is missing
SELECT id, name, department
FROM employees_null_demo
WHERE department IS NULL;

-- 2. Rows where salary exists
SELECT id, name, salary
FROM employees_null_demo
WHERE salary IS NOT NULL;

-- B) LIKE patterns: % and _
-- %  -> any number of characters
-- _  -> exactly one character

-- 3. Names starting with 'A'
SELECT id, name
FROM employees
WHERE name LIKE 'A%';

-- 4. Names ending with 'e'
SELECT id, name
FROM employees
WHERE name LIKE '%e';

-- 5. Exactly 3-letter names (if any)
SELECT id, name
FROM employees
WHERE name LIKE '___';

-- C) Case-insensitive filtering
-- SQLite string comparisons can be case-sensitive in some setups.
-- LOWER() makes the comparison consistent.

-- 6. Find IT employees, case-insensitive
SELECT id, name, department
FROM employees
WHERE LOWER(department) = 'it';


-- D) Operator precedence (important)
-- AND is evaluated before OR.
-- Use parentheses to make your intention clear.

-- 7. Without parentheses (can be misunderstood)
SELECT id, name, department, salary
FROM employees
WHERE department = 'HR' OR department = 'IT' AND salary > 60000;

-- 8. With parentheses (clear logic)
SELECT id, name, department, salary
FROM employees
WHERE (department = 'HR' OR department = 'IT')
  AND salary > 60000;

-- E) Filtering using calculated values
-- 9. Employees with annual salary >= 700000
-- (monthly salary stored in column salary)
SELECT id, name, salary, salary * 12 AS annual_salary
FROM employees
WHERE salary * 12 >= 700000;

-- F) COALESCE in filters
-- COALESCE(value, fallback) replaces NULL with fallback.

-- 10. Treat NULL salary as 0, then filter rows > 55000
SELECT id, name, department, salary
FROM employees_null_demo
WHERE COALESCE(salary, 0) > 55000;

-- G) Mixed real-world style filter
/*
Goal:
- Department is IT or Finance
- Salary is between 55000 and 65000
- Name does not start with 'D'
- Sorted by salary descending
*/
SELECT id, name, department, salary
FROM employees
WHERE department IN ('IT', 'Finance')
  AND salary BETWEEN 55000 AND 65000
  AND name NOT LIKE 'D%'
ORDER BY salary DESC;