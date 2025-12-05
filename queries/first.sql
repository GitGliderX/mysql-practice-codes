create database DAB18;

use DAB18;

show databases;

create table student(rollNo int, name varchar(20), mobileNo bigint, dob date, address varchar(50));


create table employee(id int, name varchar(20), mobileNo bigint, dob date, address varchar(50), salary float, doj date);


CREATE TABLE Stock (
    StockID INT ,
    ProductID INT,
    WarehouseID INT,
    QuantityAvailable INT,
    ReorderLevel INT,
    LastUpdated DATE,
    Status VARCHAR(20));
    
    
    
    CREATE TABLE Company (
    CompanyID INT PRIMARY KEY,
    CompanyName VARCHAR(100),
    IndustryType VARCHAR(50),
    Address VARCHAR(200),
    City VARCHAR(50),
    State VARCHAR(50),
    Country VARCHAR(50)
);



create table AC_Opening(
AhName varchar(20),
ahmobile bigint,
emailid varchar(20),
city varchar(20),
pincode int,
address varchar(30),
branchname varchar(25),
bankname varchar(25),
bpincode int,
opbalance bigint,
closingbalance double
);

desc AC_Opening;

create table Product_Orders(
order_id int,
customer_name varchar(20),
mobile_no bigint,
emailid varchar(25),
order_date date,
delivery_date date,
product_id int,
product_name varchar(25),
quantity int,
price float,
total_price double,
payment_mode char,
discount float,
delivery_address varchar(25)
);

desc Product_Orders;



CREATE TABLE Product_Stock_Company (
    ProductID INT,
    ProductName VARCHAR(100),
    ProductCode VARCHAR(50),
    Category VARCHAR(50),
    SubCategory VARCHAR(50),
    Brand VARCHAR(50),
    Model VARCHAR(50),
    Description VARCHAR(200),
    Price DECIMAL(10,2),
    Discount DECIMAL(5,2),
    QuantityAvailable INT,
    ReorderLevel INT,
    ManufactureDate DATE,
    ExpiryDate DATE,
    WarrantyPeriod VARCHAR(50),
    Status VARCHAR(20),
    SupplierID INT,
    SupplierName VARCHAR(100),
    SupplierContact VARCHAR(15),
    SupplierEmail VARCHAR(100),
    CompanyID INT,
    CompanyName VARCHAR(100),
    IndustryType VARCHAR(50),
    CompanyAddress VARCHAR(200),
    City VARCHAR(50),
    State VARCHAR(50),
    Country VARCHAR(50),
    ContactNumber VARCHAR(15),
    Email VARCHAR(100),
    DateAdded DATE
);

desc Product_Stock_Company;

show tables;

create table student_details(s_id int not null,s_name varchar(20),grade varchar(10), city varchar(20));

insert into student_details(s_id,s_name,grade,city)
values(1,"Amit","A","Pune"),
(2,"Ankkit","B","Thane"),
(3,"Chinmay","B","Mumbai"),
(4,"Sushant","C","Satara"),
(5,"Devendra","C","Nanded"),
(6,"Shivam","A","Pune");

create table sub(sub_id int not null,sub_name varchar(20),marks int, s_id int);

insert into sub(sub_id,sub_name,marks,s_id)
values(1,"DA",82,1),
(2,"Python",85,2),
(3,"Math",80,3),
(4,"SQL",90,4),
(5,"JAVA",80,5),
(6,"DA",87,6),
(7,"CPP",75,1);

select s_name from student_details where s_id in(select s_id from sub where marks >80);

select s_name from student_details where s_id in(select s_id from sub where sub_name = "math");

select s_name from student_details where s_id in(select s_id from sub where marks <80);

select s_name from student_details where s_id in(select s_id from sub where sub_name = "math") and s_id not in(select s_id from sub where sub_name = "DA");

select * from sub;
select * from student_details;

#: Multi-Row Subqueries
#·       Find Employees in Departments with More Than 3 Employees:
#·       Find Employees with a Salary Greater Than Any in the Sales Department:
#·       Find Departments with Average Salary Greater Than 60000:
#·       Find Employees Who Earn More Than the Minimum Salary in Their Department:
#·       Find Employees Who Earn Less Than All Employees in the 'Engineering' Department:
#·       Find Departments with More Than Two Employees:
#·       Find Employees Who Work in a Department with a Higher Average Salary Than 60,000:

show tables;

CREATE TABLE employees (
    employee_id INT PRIMARY KEY,
    employee_name VARCHAR(100),
    salary DECIMAL(10, 2),
    department_id INT
);

insert into employees (employee_id, employee_name, salary, department_id) values
(101, 'Amit', 55000.00, 1),
(102, 'Priya', 82000.00, 2),
(103, 'Ravi', 90000.00, 3),
(104, 'Sneha', 75000.00, 4),
(105, 'Vikram', 65000.00, 5),
(106, 'Neha', 98000.00, 3);

insert into employees (employee_id, employee_name, salary, department_id) values
(111, 'Rahul', 70000.00, 1),
(112, 'Simran', 95000.00, 2),
(113, 'Arjun', 88000.00, 3),
(114, 'Meena', 76000.00, 4),
(115, 'Nikhil', 64000.00, 5),
(116, 'Pooja', 54000.00, 1),
(117, 'Deepak', 81000.00, 3),
(118, 'Tina', 69000.00, 4),
(119, 'Rakesh', 83000.00, 2),
(120, 'Komal', 61000.00, 5);


CREATE TABLE departments (
    department_id INT PRIMARY KEY,
    department_name VARCHAR(100)
);

select * from departments;
insert into departments (department_id, department_name) values
(1, 'HR'),
(2, 'Finance'),
(3, 'IT'),
(4, 'Sales'),
(5, 'Marketing');

#Find Employees in Departments with More Than 1 Employees:

select employee_name,department_id from employees where department_id in(
select department_id from employees group by department_id having count(employee_id)>3);

#Find Employees with a Salary Greater Than Any in the Sales Department:

select employee_name,salary from employees where salary > any(select salary from employees where department_id =(
select department_id from departments where department_name = "Sales"));

#Find Departments with Average Salary Greater Than 60000:

select department_name from departments where department_id in (
select department_id from employees group by department_id having avg(salary)> 60000);

#Find Employees Who Earn More Than the Minimum Salary in Their Department:

select min(salary),department_id from employees group by department_id;


select employee_name,salary,department_id from employees where salary >(
select min(salary) from employees where department_id = employees.department_id); 

#Find Employees Who Earn Less Than All Employees in the 'Engineering' Department:

select salary ,department_id from employees where department_id  =(
select department_id from departments where department_name = "IT");

select employee_name,salary from employees where salary < all(
select salary from employees where department_id = 
(select department_id from departments where department_name = "IT"));

#Find Departments with More Than Two Employees:
select * from departments where department_id in(
select department_id from employees group by department_id having count(department_id)>2); 

#Find Employees Who Work in a Department with a Higher Average Salary Than 60,000:
select employee_name from employees where department_id in(
select department_id from employees group by department_id having avg(salary)> 60000);

#Scalar subqueries:
#find employee with salary greater than department average:
select employee_name from employees where salary >(
select avg(salary) from employee);

# find employee with lowest salary in IT department:
select employee_name from employees where salary =(
select min(salary) from employees where department_id in (select department_id from departments where department_name = "IT"));


show tables;

CREATE TABLE students (
    student_id INT PRIMARY KEY,
    student_name VARCHAR(100),
    age INT,
    grade_level INT
);
insert into students (student_id, student_name, age, grade_level) values
(1, 'Amit', 17, 12),
(2, 'Rahul', 16, 11),
(3, 'Rohit', 18, 12),
(4, 'Rohan', 15, 10),
(5, 'Ritesh', 17, 12),
(6, 'Sagar', 16, 11),
(7, 'Om', 15, 10);

CREATE TABLE courses (
    course_id INT PRIMARY KEY,
    course_name VARCHAR(100),
    department VARCHAR(100)
);

insert into courses (course_id, course_name, department) values
(1, 'Mathematics', 'Science'),
(2, 'Physics', 'Science'),
(3, 'English Literature', 'Arts'),
(4, 'Economics', 'Commerce'),
(5, 'Computer Science', 'Technology');


create table enrollments (
    enrollment_id INT PRIMARY KEY,
    student_id INT,
    course_id INT,
    grade VARCHAR(2),
    FOREIGN KEY (student_id) REFERENCES students(student_id),
    FOREIGN KEY (course_id) REFERENCES courses(course_id)
);

insert into enrollments (enrollment_id, student_id, course_id, grade) values
(1, 1, 1, 'A'),
(2, 2, 3, 'B'),
(3, 3, 5, 'A'),
(4, 4, 2, 'C'),
(5, 5, 4, 'B'),
(6, 6, 1, 'B'),
(7, 7, 2, 'A'),
(8, 5, 5, 'C'),
(9, 2, 3, 'A'),
(10, 3, 4, 'B');

update enrollments set student_id = 7 where enrollment_id = 9;
select * from students;
select * from enrollments;
#Find Students Enrolled in More Than One Course:

select student_name from students where student_id in(
select student_id from enrollments group by student_id having count(course_id)>1);

# 2.Find Students Who Are Enrolled in Either 'Mathematics' or 'English Literature':
select student_name,student_id from students where student_id in(
select student_id from enrollments where course_id in(
select course_id from courses where course_name = "English Literature" or course_name = "Mathematics"));

#3.Find Students Enrolled in All Courses in the 'Arts' Department:
select student_name,student_id from students where student_id in(
select student_id from enrollments where course_id in(
select course_id from courses where department= "Arts"));

#4.Find Students Who Are Not Enrolled in 'Computer Science':
select student_name,student_id from students where student_id   in(
select student_id from enrollments where course_id  in(
select course_id from courses where course_name != "Computer Science"));

show tables;

select * from courses;

select * from students;

select *,
case
when grade_level =10 then "good"
when grade_level = 11 then "better"
when grade_level = 12 then "best"
else "bad"
end as result
from students;

update students set grade_level =
case
when grade_level = 10 then 13
when grade_level = 11 then 14
when grade_level = 12 then 15
else 0
end
where student_id in (1,2,3,4,5,6,7);

select * from students;

show tables;

create table employee_data (
    emp_id INT primary key,
    emp_name varchar(50),
    job_title varchar(50),
    salary bigint,
    dept_id int
);

insert into employee_data (emp_id, emp_name, job_title, salary, dept_id) values
(101, 'Rajesh', 'Manager', 80000, 1),
(102, 'Amit', 'HR Executive', 45000, 1),
(103, 'Kartik', 'Developer', 60000, 2),
(104, 'Devendra', 'Tester', 50000, 2),
(105, 'Ankit', 'Accountant', 55000, 3),
(106, 'Aakash', 'Analyst', 65000, 3),
(107, 'Rohan', 'Sales Executive', 40000, 4),
(108, 'Rahul', 'Marketing Lead', 70000, 4);

create table department_data (
    dept_id int primary key,
    dept_name varchar(50),
    location varchar(20)
);

insert into department_data (dept_id, dept_name, location) 
values
(1, 'HR', 'Pune'),
(2, 'IT', 'Mumbai'),
(3, 'Finance', 'Delhi'),
(4, 'Marketing',"Banglore");