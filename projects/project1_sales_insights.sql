create database project1;

use project1;

create table customers(customer_id INT PRIMARY KEY,
    customer_name varchar(100),
    city varchar(100),
    state varchar(100)
);

insert into customers(customer_id,customer_name,city,state) values
(1,"Rohit Sharma","Mumbai","Maharashtra"),
(2,"Virat Kohli","Delhi","Delhi"),
(3,"Hardik Pandya","Surat","Gujarat"),
(4,"KL Rahul","Bengaluru","Karnataka"),
(5,"Shikhar Dhawan","Chandigarh","Chandigarh"),
(6,"Ruturaj Gaikwad","Pune","Maharashtra"),
(7,"Sanju Samson","Kochi","Kerala"),
(8,"Ravindra Jadeja","Jamnagar","Gujarat"),
(9,"Shreyas Iyer","Mumbai","Maharashtra"),
(10,"Prithvi Shaw","Delhi","Delhi");

select * from customers;

create table products (
    product_id int primary key,
    category varchar(100),
    price decimal(10,2)
);

insert into products(product_id,category,price) values
(101,"Electronics",15000),
(102,"Electronics",22000),
(103,"Clothing",2500),
(104,"Clothing",1800),
(105,"Furniture",12000),
(106,"Furniture",8500),
(107,"Grocery",150),
(108,"Grocery",90),
(109,"Sports",2500),
(110,"Sports",1800);

select * from products;

create table sales (
    order_id int primary key,
    customer_id int,
    product_id int,
    quantity int,
    sale_date date,
    foreign key (customer_id) references customers(customer_id),
    foreign key (product_id) references products(product_id)
);

insert into sales(order_id, customer_id, product_id, quantity, sale_date) values
(1001,1,101,1,'2023-01-15'),
(1002,2,103,2,'2023-01-18'),
(1003,3,105,1,'2023-01-20'),
(1004,4,107,10,'2023-02-02'),
(1005,5,102,1,'2023-02-10'),
(1006,6,109,1,'2023-02-16'),
(1007,7,108,5,'2023-03-01'),
(1008,8,104,2,'2023-03-05'),
(1009,9,110,1,'2023-03-12'),
(1010,10,106,1,'2023-03-18'),
(1011,1,107,7,'2023-04-01'),
(1012,4,101,1,'2023-04-10'),
(1013,2,105,1,'2023-04-15'),
(1014,6,103,3,'2023-05-01'),
(1015,5,107,4,'2023-05-09'),
(1016,7,109,2,'2023-05-20'),
(1017,8,108,6,'2023-05-28'),
(1018,9,110,2,'2023-06-01'),
(1019,10,101,1,'2023-06-10'),
(1020,3,102,1,'2023-06-18');

select * from sales;

#1 Top 10 cities by total sales

select c.city,sum(s.quantity * p.price) as total_sales 
from sales s
join products p on s.product_id = s.product_id
join customers c on s.customer_id = c.customer_id
group by c.city
order by total_sales desc 
limit 10;

#2 Revenue generated per product category

select p.category,sum(s.quantity * p.price) as total_revenue
from sales s
join products p on s.product_id = p.product_id
group by p.category;

#3Monthly sales trend

select date_format(s.sale_date, '%Y-%M') as month,
sum(s.quantity * p.price) as revenue
from sales s
join products p on s.product_id = p.product_id
group by month;

#4 Highest selling product (by quantity)

select p.category,sum(s.quantity) as total_units
from sales s
join products p on s.product_id = p.product_id
group by p.category
order by total_units desc;

#5 Customer who spent the most
 
 select c.customer_name, sum(p.price * s.quantity) as total_spent
 from sales s
 join products p on s.product_id = s.product_id
 join customers c on c.customer_id = s.customer_id
 group by c.customer_name
 order by total_spent desc
 limit 5;
 
 #6 Total orders per city
 
 select c.city, count(s.order_id) as total_orders
 from sales s 
 join customers c on s.customer_id = s.customer_id
 group by c.city;
 
 #7 Number of unique customers per month
 select date_format(s.sale_date, '%Y-%M') as month, count(distinct s.customer_id) as total_customers from sales s 
 join customers c on s.customer_id = c.customer_id
 group by date_format(s.sale_date, '%Y-%M');
 
 #8 state wise revenue
 
 select c.state,sum(s.quantity * p.price) as total_revenue
from sales s
join products p on s.product_id = p.product_id
join customers c on s.customer_id = c.customer_id
group by c.state
order by total_revenue desc;

#9 order count by category

select p.category, count(s.order_id) as total_orders from sales s 
join products p on s.product_id = s.product_id
group by p.category;

#10 Daily order count
select sale_date, count(order_id) as orders
from sales
group by sale_date
order by sale_date;

#11  Average selling price per order
select avg(p.price * s.quantity) as avg_order_value
from sales s
join products p on s.product_id = p.product_id;