create database e_commerce;

use e_commerce;

create table product
(p_id int primary key,
p_nmae varchar(20) not null,
price double not null,
quantity int not null,
mfg_date date not null,
exp_date date,
stock_available int default 1,
supplier_city varchar(20));

alter table product change p_nmae p_name varchar(20);

insert into product(p_id,p_name,price,quantity,mfg_date,exp_date,supplier_city) 
values(1,"mobile",22000,10,'2025-04-20','2027-05-24',"Mumbai"),
(2,"laptop",50000,5,'2025-05-25','2028-05-24',"Pune"),
(3,"headphone",8000,15,'2024-06-20','2028-05-24',"Bangalore");

insert into product(p_id,p_name,price,quantity,mfg_date,exp_date,stock_available,supplier_city) 
values(4,"Smartwatch",10000,10,'2025-01-22','2026-06-24',0,"Hydrabad"),
(5,"Tablet",25000,7,'2024-05-25','2028-01-24',0,"Pune"),
(6,"Iphone",80000,5,'2025-03-20','2029-04-24',0,"Bangalore");

select price , price*1.10  u_price from product;

select* from product;

select p_name,price,quantity,price*quantity u_price from product;

select p_name,price,price*50/100 u_price from product;

select p_name,quantity,quantity+5 u_quantity from product;

select p_name,quantity,quantity-4 u_quantity from product;

select p_name ,quantity,quantity*2 u_quantity from product;

select * from product 
where quantity >5;

select * from product 
where quantity <10;

select * from product
where price >= 22000;

select *from product 
where price <= 60000;

select * from product
where mfg_date between 2024-05-25 and 2025-05-25;

select * from product order by price;

select * from product order by price desc;

select * from product where supplier_city in("Pune","Mumbai") order by price desc limit 3;

select * from product order by price desc limit 3 offset 3;

select * from product;

select min(price) as min_price from product ;

select max(price) as max_price from product;

select count(price) as total_products from product;

select count(*) as total_product from product;

select avg(price) as average_price from product;

select sum(price) as sum_price from product;

select supplier_city,count(*) from product group by supplier_city;

show tables;

create table employee(
emp_id int primary key,
emp_name varchar(50) not null,
salary double not null,
dapartment varchar(20),
work_experience int,
city varchar(20)
);

insert into employee(emp_id,emp_name,salary,dapartment,work_experience,city)
values(1,"Amit",50000,"HR",2,"Mumbai"),
(2,"Ankkit",25000,"IT",1,"Pune"),
(3,"Chinmay",26000,"HR",1 ,"chennai"),
(4,"Aakash",30000,"BA",3,"Hydrabad"),
(5,"Devendra",55000,"IT",4 ,"Bangalore"),
(6,"Amol",35000,"Sales",1,"Mumbai"),
(7,"Aditya",40000,"Sales",1,"Mumbai"),
(8,"Aniket",20000,"HR",1,"Pune"),
(9,"Om",60000,"Manager",2,"Hydrabad"),
(10,"Prasad",35000,"Sales",1,"Hydrabad");

insert into employee(emp_id,emp_name,salary,dapartment,work_experience,city)
value(11,"Ayush",15000,"IT",1,"Pune");
select *from employee;

select * from employee where salary > 25000 and city = "Hydrabad" order by salary desc limit 2;  
 
select * from employee order by salary desc;

select * from employee where dapartment="HR" order by salary desc limit 1 offset 1;

select min(salary) as min_salary from employee;

select max(salary) as max_salary from employee;

select count(salary) as total_emp from employee;

select count(*) as total_emp from employee;

select avg(salary) as avg_salary from employee;

select sum(salary) as sum_salary from employee;

#GROUP_BY

select city,count(salary) as min_salary from employee  group by city;