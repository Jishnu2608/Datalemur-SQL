/*Imagine you're an HR analyst at a tech company tasked with analyzing employee salaries. 
Your manager is keen on understanding the pay distribution and asks you to determine the 
second highest salary among all employees.

It's possible that multiple employees may share the same second highest salary. 
In case of duplicate, display the salary only once.*/

-- Create employee table
CREATE TABLE employee (
    employee_id INT,
    name VARCHAR(100),
    salary INT,
    department_id INT,
    manager_id INT
);

-- Insert data into employee
INSERT INTO employee (employee_id, name, salary, department_id, manager_id) VALUES
(1, 'Emma Thompson', 3800, 1, 6),
(2, 'Daniel Rodriguez', 2230, 1, 7),
(3, 'Olivia Smith', 2000, 1, 8);

select max(salary) as second_highest_salary from employee
where salary < (select max(salary) from employee);

