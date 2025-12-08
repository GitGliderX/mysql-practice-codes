CREATE DATABASE project2;

USE project2;

CREATE TABLE employees(emp_id INT PRIMARY KEY ,
emp_name VARCHAR(100),
age INT,
gender VARCHAR(10),
department VARCHAR(50),
role VARCHAR(100),
salary DECIMAL(10,2),
join_date DATE);

INSERT INTO employees(emp_id,emp_name,age,gender,department,role,salary,join_date)VALUES
(1,"Rahul Verma",29,"Male","Sales","SalesExecutive",35000,'2020-03-10'),
(2,"Anita Shetty",34,"Female","HR","HR Manager",55000,'2018-06-15'),
(3,"Siddharth Rao",26,"Male","IT","Software Engineer",45000,'2021-01-05'),
(4,"Neha Kapoor",31,"Female","Finance","Accountant",40000,'2019-09-20'),
(5,"Amit Joshi",45,"Male","Sales","Senior Sales Manager",70000,'2015-11-01'),
(6,"Kiran Patil",28,"Female","IT","Data Analyst",50000,'2020-08-12'),
(7,"Vivek Shah",39,"Male","Finance","Financial Analyst",60000,'2017-04-18'),
(8,"Sneha Gupta",25,"Female","IT","Junior Developer",30000,'2022-02-10'),
(9,"Rohan Kulkarni",33,"Male","Operations","Operations Executive",38000,'2019-07-22'),
(10,"Pooja Desai",30,"Female","HR","HR Executive",32000,'2021-10-15');

CREATE TABLE performance (
    perf_id INT PRIMARY KEY,
    emp_id INT,
    year INT,
    rating INT,   -- rating from 1 to 5
    FOREIGN KEY(emp_id) REFERENCES employees(emp_id)
);
 
 INSERT INTO performance(perf_id,emp_id,year,rating) VALUES
(101,1,2022,4),
(102,2,2022,5),
(103,3,2022,3),
(104,4,2022,4),
(105,5,2022,5),
(106,6,2022,4),
(107,7,2022,3),
(108,8,2022,2),
(109,9,2022,4),
(110,10,2022,3),
(111,1,2023,5),
(112,2,2023,4),
(113,3,2023,4),
(114,4,2023,5),
(115,5,2023,4),
(116,6,2023,5),
(117,7,2023,3),
(118,8,2023,3),
(119,9,2023,4),
(120,10,2023,4);

CREATE TABLE attrition (
    attr_id INT PRIMARY KEY,
    emp_id INT,
    attrition_status VARCHAR(10), -- Yes / No
    exit_date DATE,
    FOREIGN KEY(emp_id) REFERENCES employees(emp_id)
);

INSERT INTO attrition(attr_id,emp_id,attrition_status,exit_date) VALUES
(1, 3, 'Yes', '2023-04-10'),
(2, 8, 'Yes', '2023-06-18'),
(3, 10, 'No', NULL),
(4, 1, 'No', NULL),
(5, 2, 'No', NULL),
(6, 4, 'No', NULL),
(7, 5, 'No', NULL),
(8, 6, 'No', NULL),
(9, 7, 'No', NULL),
(10, 9, 'No', NULL);

SELECT * FROM attrition;

#1 Total number of employees

SELECT COUNT(*) AS total_employees FROM employees;

#2. Total employees who left

select count(*) as total_employees_left from attrition where attrition_status = "Yes";

#3 Department-wise attrition

SELECT e.department, COUNT(a.emp_id) AS employee_left FROM employees e 
JOIN attrition a ON
e.emp_id = a.emp_id WHERE a.attrition_status="Yes"
GROUP BY e.department;

#4. Average salary by job role

SELECT role,AVG(salary) AS average_salary FROM employees GROUP BY role;

#5. Age group with highest attrition

SELECT e.department, AVG(e.age) AS age_group FROM employees e 
JOIN attrition a ON
e.emp_id = a.emp_id WHERE a.attrition_status="Yes"
GROUP BY e.department;

#6. Average tenure before attrition
 select 
    ROUND(avg(DATEDIFF(a.exit_date, e.join_date) / 365), 2) as avg_tenure_years
from attrition a
join employees e 
    on a.emp_id = e.emp_id
where a.attrition_status = 'Yes';


#7. Gender distribution
select gender,count(*) as total_employees from employees group by gender;

#8. Top 5 highest-paid roles
select * from employees;

select role,max(salary) as highest_paid  from employees group by role order by highest_paid desc limit 5;

#9. Hiring trend per year
select year(join_date) as hiring_year,count(*) as total_hire from employees group by year(join_date) order by hiring_year;

#10. Average age of employees per department
select department,
       avg(age) as avg_age
from employees
group by department;
