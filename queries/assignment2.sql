create database test1;

use test1;

CREATE TABLE EmployeeDetail (
    EmployeeID INT PRIMARY KEY,
    FirstName VARCHAR(50),
    LastName VARCHAR(50),
    Salary DECIMAL(10,2),
    JoiningDate DATETIME,
    Department VARCHAR(50),
    Gender VARCHAR(10)
);

INSERT INTO EmployeeDetail (EmployeeID, FirstName, LastName, Salary, JoiningDate, Department, Gender)
VALUES
(1, 'Vikas', 'Ahlawat', 600000.00, '2013-02-15 11:16:28.290', 'IT', 'Male'),
(2, 'Nikita', 'Jain', 530000.00, '2014-01-09 17:31:07.793', 'HR', 'Female'),
(3, 'Ashish', 'Kumar', 1000000.00, '2014-01-09 10:05:07.793', 'IT', 'Male'),
(4, 'Nikhil', 'Sharma', 480000.00, '2014-01-09 09:31:07.793', 'HR', 'Male'),
(5, 'Anish', 'Kadian', 500000.00, '2014-01-09 09:31:07.793', 'Payroll', 'Male');

#1. Write a query to get all employee detail from "EmployeeDetail" table  

select * from EmployeeDetail;

#2. Write a query to get only "FirstName" column from "EmployeeDetail" table  

select FirstName from EmployeeDetail;

#3. Write a query to get FirstName in upper case as "First Name".  

select upper(Firstname) as First_Name from employeeDetail;

#4. Write a query to get FirstName in lower case as "First Name".  

select lower(FirstName) from employeeDetail;

#5. Write a query for combine FirstName and LastName and display it as "Name" (also 
#include white space between first name & last name) 

select concat(Firstname,' ',Lastname) as Name from employeeDetail;

#6. Select employee detail whose name is "Vikas"  

select * from employeeDetail where Firstname = 'Vikas';

#7. Get all employee detail from EmployeeDetail table whose "FirstName" start with latter 'a'. 

select * from employeeDetail where Firstname like 'a%';

#8. Get all employee details from EmployeeDetail table whose "FirstName" contains 'k' 

select * from employeeDetail where Firstname like '%k%';

#9. Get all employee details from EmployeeDetail table whose "FirstName" end with 'h' 

select * from employeeDetail where Firstname like '%h';

#10. Get all employee detail from EmployeeDetail table whose "FirstName" start with any single character between 'a-p'

SELECT * FROM EmployeeDetail WHERE FirstName like '[a-p]%';

#set2

#11). Get all employee detail from EmployeeDetail table whose "FirstName" not start with any single character between 'a-p'  
SELECT * FROM employeeDetail WHERE FirstName like "[^a-p]%";

#12). Get all employee detail from EmployeeDetail table whose "Gender" end with 'le' and contain 4 letters. The Underscore(_) Wildcard Character represents any single character. 
select * from employeeDetail where Gender like '__le';

#13). Get all employee detail from EmployeeDetail table whose "FirstName" start with 'A' and contain 5 letters. 
select * from employeeDetail where FirstName like 'A____';

#14). Get all employee detail from EmployeeDetail table whose "FirstName" containing '%'. ex:-"Vik%as". 
 SELECT * FROM EmployeeDetail WHERE FirstName like '%[%]%';
 
 #15). Get all unique "Department" from EmployeeDetail table. 
select distinct Department from EmployeeDetail;

#16). Get the highest "Salary" from EmployeeDetail table. 
select max(salary) as highest_salary from employeeDetail;

#17). Get the lowest "Salary" from EmployeeDetail table. 
select min(salary) as lowest_salary from employeeDetail;

##18). Show "JoiningDate" in "dd mmm yyyy" format, ex- "15 Feb 2013" 
SELECT DATE_FORMAT(JoiningDate, '%d %b %Y') AS JoiningDateFormatted
FROM EmployeeDetail;

#19). Show "JoiningDate" in "yyyy/mm/dd" format, ex- "2013/02/15" 
SELECT DATE_FORMAT(JoiningDate, '%Y/%m/%d') AS Formatted_JoiningDate
FROM EmployeeDetail;


#20). Show only time part of the "JoiningDate". 
select date_format(joiningDate,'%h:%i:%s') as formatted_joiningDate from EmployeeDetail;

#21). Get only Year part of "JoiningDate". 

 SELECT DATE_FORMAT(JoiningDate, '%Y') AS Formatted_JoiningDate
FROM EmployeeDetail;

#2). Get only Month part of "JoiningDate". 
select date_format(joiningDate,'%b') as Formatted_JoiningDate from employeeDetail;


