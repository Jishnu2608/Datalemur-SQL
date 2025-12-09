/*As part of an ongoing analysis of salary distribution within the company, your manager has requested a 
report identifying high earners in each department. A 'high earner' within a department is defined as 
an employee with a salary ranking among the top three salaries within that department.

You're tasked with identifying these high earners across all departments. Write a query to display 
the employee's name along with their department name and salary. In case of duplicates, 
sort the results of department name in ascending order, then by salary in descending order. 
If multiple employees have the same salary, then order them alphabetically.

Note: Ensure to utilize the appropriate ranking window function to handle duplicate salaries effectively.*/

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
(1,  'Emma Thompson',     3800, 1, 6),
(2,  'Daniel Rodriguez',  2230, 1, 7),
(3,  'Olivia Smith',      2000, 1, 8),
(4,  'Noah Johnson',      6800, 2, 9),
(5,  'Sophia Martinez',   1750, 1, 11),
(6,  'Liam Brown',       13000, 3, NULL),
(7,  'Ava Garcia',       12500, 3, NULL),
(8,  'William Davis',     6800, 2, NULL),
(9,  'Isabella Wilson',  11000, 3, NULL),
(10, 'James Anderson',    4000, 1, 11);


-- Create department table
CREATE TABLE department (
    department_id INT,
    department_name VARCHAR(100)
);

-- Insert data into department
INSERT INTO department (department_id, department_name) VALUES
(1, 'Data Analytics'),
(2, 'Data Science');


with cte as (
  select d.department_name, e.name, e.salary
  ,dense_rank() over(partition by d.department_id order by e.salary desc) rn from employee e join department d on e.department_id = d.department_id
)

select department_name, name, salary from cte where rn <= 3 order by 1 asc, 3 desc, 2
