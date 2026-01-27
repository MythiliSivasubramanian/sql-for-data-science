-- create_tables_for_joins.sql
-- Tables used for JOIN practice
-- Database: common_databases/sample_database.db

-- Departments table
CREATE TABLE IF NOT EXISTS departments (
    id INTEGER PRIMARY KEY,
    department_name TEXT
);

INSERT INTO departments (id, department_name) VALUES
(1, 'HR'),
(2, 'IT'),
(3, 'Finance');

-- Employees table (JOIN-ready)
CREATE TABLE IF NOT EXISTS employees_join (
    id INTEGER PRIMARY KEY,
    name TEXT,
    department_id INTEGER,
    salary INTEGER,
    FOREIGN KEY (department_id) REFERENCES departments(id)
);

INSERT INTO employees_join (name, department_id, salary) VALUES
('Alice', 1, 50000),
('Bob', 2, 60000),
('Charlie', 3, 55000),
('David', 2, 62000),
('Eve', 1, 53000),
('Frank', 3, 58000);