CREATE TABLE IF NOT EXISTS employees (
    id INTEGER PRIMARY KEY,
    name TEXT,
    department TEXT,
    salary INTEGER
);


INSERT INTO employees (name, department, salary) VALUES
('Alice','HR',50000),
('Bob','IT',60000),
('Charlie','Finance',55000),
('David','IT',62000),
('Eve','HR',53000),
('Frank','Finance',58000);
