create database temp1;

use  temp1;

CREATE TABLE subject (
  S_id INT PRIMARY KEY,
  S_name VARCHAR(20)
);

INSERT INTO subject (S_id, S_name)
VALUES
  (1, 'Python'),
  (2, 'CPP'),
  (3, 'JAVA'),
  (4, 'SQL');
  
  create table StudentDetails(stu_id int primary key,stu_name varchar(20),scity varchar(20) ,Sid int,
  foreign key (Sid) references subject(S_id));
  
  
  desc studentDetails;
  
  insert into studentDetails(stu_id,stu_name,scity,Sid)
  values(1,"Avinash","Pune",4),
  (2,"Amit","Mumbai",2),
  (3,"Aakash","Satara",1),
  (4,"Ankkit","Thane",2);

select * from studentDetails;

#joins:-

create table dept(dept_id int primary key auto_increment,dept_name varchar(20));

insert  into dept(dept_name)
values("IT"),("Sales"),("DA"),("BA");

select * from dept;

show tables;

select * from employee2;

create table emp(id int, name varchar(20),city varchar(20),did int);

insert into emp(id,name,city,did)
values(1,"Amit","Mumbai",2),
(2,"Ankkit","Pune",1),
(3,"Chinmay","Pune",5),
(4,"Aakash","Thane",3),
(5,"Devendra","Satara",4),
(6,"Sushant","Latur",6);

select * from emp;

#INNER JOIN
select * from dept d inner join emp e on
d.dept_id = e.did;

select name,dept_name from emp e inner join dept d on e.did = d.dept_id;

#LEFT JOIN
select * from dept d left join emp e on
d.dept_id = e.did;

#RIGHT JOIN
select * from dept d right join emp e on
d.dept_id = e.did;

#FULL JOIN
select * from dept d left join emp e on
d.dept_id = e.did union
select * from dept d right join emp e on
d.dept_id = e.did;

#CROSS JOIN
select * from dept join emp;


#SELF JOIN
select * from emp;
select * from emp e1 join emp e2 on 
e1.city = e2.city and e1.name<>e2.name;

create table country(c_id int,c_name varchar(20));

insert into country(c_id ,c_name)
values(1,"India"),
(2,"USA");

create table state(s_id int,s_name varchar(20),c_id int);

insert into state(s_id ,s_name,c_id)
values(1,"Maharashtra",1),
(2,"Gujrat",1),
(3,"California",2),
(4,"Texas",2),
(5,"France",3);

create table state(s_id int,s_name varchar(20),c_id int); 



select * from employee_data1;

desc employee_data1;

alter table employee_data1 
modify department varchar(30);

create view getempdept as
select * from employee_data1
where department = "IT";

select * from getempdept;

create view getempdeptcity as
select * from employee_data1
where department = "Marketing" and city = "Rampur";

select * from getempdeptcity;


show full tables where table_type="VIEW";

create index empdata on
employee_data1(department);

select * from employee_data1;

