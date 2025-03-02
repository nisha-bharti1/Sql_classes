Use bank;

CREATE TABLE employees (
    id INT AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(100),
    department VARCHAR(100)
);

select * from employees;



INSERT INTO employees (name, department) VALUES ('Alice', 'HR');
INSERT INTO employees (name, department) VALUES ('Bob', 'IT');
INSERT INTO employees (name, department) VALUES ('Charlie', 'Finance');

DELETE FROM employees WHERE id = 2;

CREATE TABLE employees_backup AS SELECT * FROM employees;
ALTER TABLE employees AUTO_INCREMENT = 1;

CREATE TABLE temp_employees AS 
SELECT @row := @row + 1 AS id, name, department 
FROM employees, (SELECT @row := 0) AS init
ORDER BY id;

DROP TABLE employees;
ALTER TABLE temp_employees RENAME TO employees;
ALTER TABLE employees MODIFY id INT AUTO_INCREMENT PRIMARY KEY;

select * from employees;

CREATE TABLE users (
    id INT AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(100),
    email VARCHAR(255),
    age INT
);

INSERT INTO users (name, email, age) VALUES 
('John Doe', 'john@example.com', 28),
('Alice Smith', 'alice@example.com', 32),
('Bob Johnson', 'bob@example.com', 25);

SELECT * INTO OUTFILE 'D:\sql class/Uploads/users.csv'
FIELDS TERMINATED BY ',' 
ENCLOSED BY '"' 
LINES TERMINATED BY '\n'
FROM users;

SHOW VARIABLES LIKE 'secure_file_priv';

-- Assuming secure_file_priv is set to "C:/my_exports/"
SELECT *
INTO OUTFILE 'C:/my_exports/users.csv'
FIELDS TERMINATED BY ','
ENCLOSED BY '"'
LINES TERMINATED BY '\n'
FROM users;


