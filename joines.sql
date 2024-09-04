CREATE TABLE employees (
    employee_id INT PRIMARY KEY,
    first_name VARCHAR(50),
    last_name VARCHAR(50),
    department_id INT
);


CREATE TABLE departments (
    department_id INT PRIMARY KEY,
    department_name VARCHAR(50)
);


CREATE TABLE salaries (
    salary_id INT PRIMARY KEY,
    employee_id INT,
    salary DECIMAL(10, 2),
    FOREIGN KEY (employee_id) REFERENCES employees(employee_id)
);



-- Insert data into employees
INSERT INTO employees (employee_id, first_name, last_name, department_id) VALUES
(1, 'John', 'Doe', 1),
(2, 'Jane', 'Smith', 2),
(3, 'Jim', 'Brown', 1);

-- Insert data into departments
INSERT INTO departments (department_id, department_name) VALUES
(1, 'HR'),
(2, 'Engineering');

-- Insert data into salaries
INSERT INTO salaries (salary_id, employee_id, salary) VALUES
(1, 1, 50000),
(2, 2, 60000),
(3, 3, 55000);


--inner join
SELECT employees.first_name, employees.last_name, departments.department_name
FROM employees
INNER JOIN departments ON employees.department_id = departments.department_id;



--left join
SELECT employees.first_name, employees.last_name, departments.department_name
FROM employees
LEFT JOIN departments ON employees.department_id = departments.department_id;


--right join
SELECT employees.first_name, employees.last_name, departments.department_name
FROM employees
RIGHT JOIN departments ON employees.department_id = departments.department_id;



-- Full outer join

SELECT employees.first_name, employees.last_name, departments.department_name
FROM employees
LEFT JOIN departments ON employees.department_id = departments.department_id
UNION
SELECT employees.first_name, employees.last_name, departments.department_name
FROM employees
RIGHT JOIN departments ON employees.department_id = departments.department_id;




SELECT employees.first_name, employees.last_name, departments.department_name, salaries.salary
FROM employees
INNER JOIN departments ON employees.department_id = departments.department_id
INNER JOIN salaries ON employees.employee_id = salaries.employee_id;
