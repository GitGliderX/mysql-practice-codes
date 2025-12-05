create database practice;

use practice;

CREATE TABLE employees (
    emp_id INT PRIMARY KEY,
    emp_name VARCHAR(50),
    department VARCHAR(30),
    salary INT,
    hire_date DATE
);

INSERT INTO employees (emp_id, emp_name, department, salary, hire_date) VALUES
(1, 'Ravi', 'IT', 80000, '2021-05-10'),
(2, 'Sneha', 'HR', 60000, '2020-03-15'),
(3, 'Amit', 'Sales', 50000, '2019-11-25'),
(4, 'Priya', 'IT', 75000, '2022-01-30'),
(5, 'John', 'Finance', 75000, '2023-07-12'),
(6, 'Meera', 'IT', 60000, '2021-09-22'),
(7, 'Suresh', 'HR', 50000, '2018-06-10'),
(8, 'Karan', 'Sales', 45000, '2023-04-18'),
(9, 'Tanvi', 'Finance', 80000, '2020-12-01'),
(10, 'Rahul', 'IT', 45000, '2022-08-15');

#Assign a unique row number to all employees ordered by salary (highest first).
select emp_id,emp_name,department,hire_date,salary, row_number() over(order by salary ) as result from employees;

#Display the top 5 highest-paid employees using ROW_NUMBER().
select * from (select emp_id,emp_name,department,hire_date,salary, row_number() over(order by salary desc)as result from employees) as da where result <=5;

#Give row numbers to employees in alphabetical order of their names.
select emp_id,emp_name,department,hire_date,salary,row_number() over(order by emp_name )as result from employees;

#Give row numbers to employees within each department based on salary (highest first).
select emp_id,emp_name,department,hire_date,salary,row_number() over(order by department,salary desc)as result from employees;

#Fetch the employee with the 3rd highest salary using ROW_NUMBER().
select * from (select emp_id,emp_name,department,hire_date,salary,row_number() over (order by salary desc) as result from employees) as da where result = 3;

#Display all employees with their salary rank (highest salary = rank 1).
select emp_id,emp_name,department,hire_date,salary, rank() over(order by salary desc) as result from employees;

#Rank employees within each department by salary.
select emp_id,emp_name,department,hire_date,salary,rank() over(partition by department order by salary ) as result from employees;

#Find employees who have rank 1 salary in their department.
select * from(select emp_id,emp_name,department,hire_date,salary,rank() over(partition by department order by salary)as result from employees) as da where result =1;

#Find the 2nd highest salary using RANK().
select * from(select emp_id,emp_name,department,hire_date,salary,rank() over(order by salary desc) as result from employees) as da where result=2;

#Show employees whose salary rank is greater than 3.

select * from(select emp_id,emp_name,department,hire_date,salary,rank() over(order by salary desc)as result from employees) as da where result > 3;

#Assign a dense rank to employees based on salary.
select emp_id,emp_name,department,hire_date,salary, dense_rank() over(order by salary)as result from employees;

#Compare RANK() vs DENSE_RANK() on employees having same salary.


#Find the top 3 salary groups using DENSE_RANK().


#Find employees who belong to the second salary group.


#Show the number of employees in each dense salary group.

drop table employees;
show tables;

CREATE TABLE employees (
    emp_id INT PRIMARY KEY,
    emp_name VARCHAR(50),
    department_id INT,
    salary INT,
    hire_date DATE
);

CREATE TABLE departments (
    department_id INT PRIMARY KEY,
    department_name VARCHAR(50),
    location VARCHAR(50)
);

INSERT INTO departments VALUES
(1, 'IT', 'Pune'),
(2, 'HR', 'Mumbai'),
(3, 'Sales', 'Delhi'),
(4, 'Finance', 'Bangalore');

INSERT INTO employees VALUES
(101, 'Ravi', 1, 80000, '2021-05-10'),
(102, 'Sneha', 2, 60000, '2020-03-15'),
(103, 'Amit', 3, 50000, '2019-11-25'),
(104, 'Priya', 1, 75000, '2022-01-30'),
(105, 'John', 4, 90000, '2023-07-12'),
(106, 'Meera', 1, 60000, '2021-09-22'),
(107, 'Suresh', 2, 40000, '2018-06-10'),
(108, 'Karan', 3, 45000, '2023-04-18'),
(109, 'Tanvi', 4, 95000, '2020-12-01'),
(110, 'Rahul', 1, 45000, '2022-08-15');

#2 Find employees who earn more than the average salary of their own department.
select * from employees;
select * from departments;

select e.emp_name,e.department_id,e.salary from employees e where e.salary > (select avg(salary) from employees e2 where e2.department_id=e.department_id);

#3 Find employees who are the highest-paid in their department.
select e.emp_name,e.department_id,e.salary from employees e where e.salary =(select max(salary) from employees e2 where e2.department_id = e.department_id);

#4 Find employees whose salary is greater than the salary of at least one other employee in the same department.
select e.emp_name,e.department_id,e.salary from employees e where salary >(select min(salary) from employees e1 where e1.department_id = e.department_id);  

#1Find employees hired earlier than the average hire date of their department.

select e.emp_name,e.department_id,e.hire_date from employees e where e.hire_date < (select avg(e1.hire_date) from employees e1 where e1.department_id=e.department_id);

#5 List employees whose salary is greater than the salary of Ravi (compare row with another row).

select e.emp_name,e.salary from employees e where e.salary > (select e1.salary from employees e1 where e1.emp_name="Ravi");

#6 Show employees whose salary is greater than any employee in HR department.
select e.emp_name,e.salary from employees e where salary > any(select e1.salary from employees e1 where e1.department_id=2);
#OR
select e.emp_name,e.salary from employees e where salary >(select min(e1.salary) from employees e1 where e1.department_id=2);

#7 Show employees whose salary is less than all employees in Finance department.
select e.emp_name,e.salary from employees e where salary < (select min(e1.salary) from employees e1 where e1.department_id=4);

#8 Find employees whose salary is above the salary of someone hired after 2022.
select e.emp_name,e.salary from employees e where salary > (select min(e1.salary) from employees e1 where e1.hire_date >'2022-12-31');

#9 Find departments where the average salary is greater than 60,000 (using correlated subquery).

select d.department_name from departments d where ( 
select avg(e1.salary) from employees e1 where  e1.department_id=d.department_id)  >60000; 

#10 Display employees who earn more than the average salary of all employees hired before them.

select e.emp_name,e.salary from employees e where  e.salary >(
select avg(e1.salary) from employees e1 where e1.hire_date<e.hire_date );

#11 Find employees who are NOT the highest-paid in their department.

select e.emp_name,e.salary from employees e where e.salary <>(select max(e1.salary) from employees e1 where e1.department_id = e.department_id);

#12Count number of employees in each department using correlated subquery instead of GROUP BY.
select distinct e.department_id,(select count(e1.emp_id) from employees e1 where e1.department_id=e.department_id) as Counts from employees e ;

#13Find the second highest salary in each department using correlated subquery.

select e.department_id,e.salary from employees e where e.salary = (select e1.salary from employees e1 where e1.department_id=e.department_id order by salary desc limit 1 offset 1);
#or

select department_id,max(salary) from employees group by department_id;
SELECT 
    e.department_id,
    e.emp_name,
    e.salary
FROM employees e
WHERE 1 = (
    SELECT COUNT(DISTINCT e1.salary)
    FROM employees e1
    WHERE e1.department_id = e.department_id
    AND e1.salary > e.salary
);

#14Display employees whose salary is higher than the salary of at least 2 employees in their department.
select e.emp_name,e.department_id,e.salary from employees e where (select count(*) from employees e1 where e1.department_id = e.department_id and e1.salary < e.salary) >=2;

#Show employees whose salary is the lowest in their department.

select e.emp_name,e.department_id,e.salary from employees e where e.salary = (select min(e1.salary) from employees e1 where e1.department_id=e.department_id);