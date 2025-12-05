create database assignment;

use  assignment;

#1
create table Roles(r_id int primary key,
role_name varchar(50),
created_at timestamp);

insert into Roles(r_id,role_name,created_at)
values
(101,'Admin',now()),
(102,'Manager',now()),
(103,'Sales',now()),
(104,'Mechanic',now()),
(105,'Accountant',now()),
(106,'Receptionist',now()),
(107,'Supervisor',now());

select * from Roles;
#2
create table users(user_id int primary key,
username varchar(50),
password_hash varchar(255),
role_id int,
created_at timestamp,
 foreign key (role_id) references Roles(r_id));
 
 insert into users(user_id,username,password_hash,role_id,created_at) values
 (201,'Avinash','Pass1',101,now()),
 (202,'Devendra','Pass2',102,now()),
 (203,'Sushant','Pass3',103,now()),
 (204,'Rahul','Pass4',103,now()),
 (205,'Rushi','Pass5',104,now()),
 (206,'Prasad','Pass6',105,now()),
 (207,'Om','Pass7',106,now()),
 (208,'Ayush','Pass8',107,now()),
 (209,'Akshay','Pass9',104,now()),
 (210,'Aryan','Pass10',104,now());
 
 select * from users;
 #3
 create table fuel_types(fuel_id int primary key,
 fuelType_name varchar(50),
 created_at timestamp);
 
 insert into fuel_types(fuel_id,fuelType_name,created_at) values
 (301,'Petrol',now()),
 (302,'Diesel',now()),
 (303,'CNG',now()),
 (304,'Electric',now()),
 (305,'Pet+Cng',now());
 
 select * from fuel_types;
 #4
 create table vehicles(vehicle_id int primary key,
 model_name varchar(100),
 brand varchar(50),
 variant varchar(50),
 fuel_id int,
 price decimal(10,2),
 stock_quantity int,
 created_at timestamp,
 foreign key (fuel_id) references fuel_types (fuel_id));
 
 insert into vehicles(vehicle_id,model_name,brand,variant,fuel_id,price,stock_quantity,created_at) values
 (401,'Swift','Maruti','VXI',301,700000,10,now()),
(402,'Baleno','Maruti','Zeta',301,850000,5,now()),
(403,'Creta','Hyundai','SX',302,1500000,8,now()),
(404,'Verna','Hyundai','AS',301,1100000,7,now()),
(405,'Thar','Mahindra','AX5',302,1600000,4,now()),
(406,'XUV700','Mahindra','AX5',302,22000000,6,now()),
(407,'Nexon','Tata','XZ',305,1400000,9,now()),
(408,'Punch EV','Tata','Long Range',304,1200000,5,now()),
(409,'Fortuner','Toyota','Legender',302,4800000,2,now()),
(410,'i20','Hyundai','Sports',301,900000,11,now()),
(411,'Tiago EV','Tata','XZ',304,700000,10,now()),
(412,'Kia EV6','Kia','GT line',304,6000000,3,now()),
(413,'Ertiga','Maruti Suzuki','VXI CNG',303,1100000,10,now()),
(414,'Dzire','Maruti Suzuki','VXI CNG',303,9500000,12,now()),
(415,'Aura','Hyundai','s CNG',303,900000,9,now());

select * from vehicles;

 #5
  create table suppliers (supplier_id int primary key,
 supplier_name varchar(100),
 contact_person varchar(100),
 contact_number varchar(20),
 email varchar(100),
 address varchar(100),
 created_at timestamp);
 
 insert into suppliers(supplier_id,supplier_name,contact_person,contact_number,email,address,created_at) values
 (501,'Autosupply LTD','Yash','9876054321','yash123@gmail.com','Mumbai',now()),
 (502,'Partworld','Ramesh','1234567890','ramesh453@gmail.com','Pune',now()),
 (503,'Megamotars','Suresh','1400256578','suresh456@gmail.com','Delhi',now()),
 (504,'DriveIndia','Mahesh','9500457889','mahesh852@gmail.com','Chennai',now()),
 (505,'Superauto','Ravi','9745638974','ravi741@gmail.com','Hydrabad',now()),
 (506,'Autocare','Karan','7548621406','karan784@gmail.com','Nagpur',now()),
 (507,'Vehiclehub','Arjun','9645712305','arjun2345@gmail.com','Indore',now()),
 (508,'Engineparts','paresh','9325478901','paresh4578@gmail.com','Kolkata',now()),
 (509,'Mototech','Raju','9654781054','ravi741@gmail.com','Hydrabad',now()),
 (510,'Fuelmaster','Swapnil','9860124508','swapnil1256@gmail.com','Ahmedabad',now());
 
 select * from suppliers;
 #6
create table spare_parts(part_id int primary key,
 part_name varchar(100),
 part_number varchar(50),
 stock_quantity int,
 recorder_level int,
 supplier_id int,
 created_at timestamp,
 foreign key (supplier_id) references suppliers (supplier_id));
 
 insert into spare_parts(part_id,part_name,part_number,stock_quantity,recorder_level,supplier_id,created_at) values
 (601,'Brake pad','BP1001',50,10,501,now()),
 (602,'Air Filter','AF2020',40,8,502,now()),
 (603,'Oil filter','OF2001',60,15,503,now()),
 (604,'Clutch Plate','CP4040',25,5,504,now()),
 (605,'Head light','HL3001',30,7,505,now()),
 (606,'Spark plug','SP4001',80,20,506,now()),
 (607,'Battery','BT3030',15,5,507,now()),
 (608,'Tyre','TY8008',40,12,508,now()),
 (609,'Radiator','RD9090',20,9,509,now()),
 (610,'Shock Absorber','SA1001',35,10,510,now());
 
 select * from spare_parts;
 #7
 create table customers(customer_id int primary key,
 name varchar(100),
 contact_number varchar(20),
 email varchar(100),
 adress varchar(100),
 created_at timestamp);
 
 insert into customers (customer_id,name,contact_number,email,adress,created_at) values
(701,'Sudarshan','9856321475','sudarshan458@gmail.com','Mumbai',now()),
(702,'Nehal','9745698525','nehal159@gmail.com','Pune',now()),
(703,'Naman','9456214789','naman875@gmail.com','Delhi',now()),
(705,'Ashitosh','9547812605','ashitosh493@gmail.com','Chennai',now()),
(706,'Abhishek','9632147850','abhishek489@gmail.com','Hydrabad',now()),
(707,'Shubhman','9450123567','shubhman753@gmail.com','Ahmedabad',now()),
(708,'Hardik','9015469740','hardik854@gmail.com','Mumbai',now()),
(709,'krunal','9234687049','krunal486@gmail.com','Banglore',now()),
(710,'Shubham','9145870236','shubham179@gmail.com','Kolkata',now());

 insert into customers (customer_id,name,contact_number,email,adress,created_at) value
(704,'Rishi','7589142605','rishi875@gmail.com','Nagpur',now());

select * from customers;

 #8
 create table spare_parts_sales(sale_id int primary key,
 customer_id int,
 part_id int,
 sale_data timestamp,
 quantity int,
 tool_price decimal(10,2),
 foreign key (part_id) references spare_parts(part_id),
 foreign key (customer_id) references customers (customer_id));
 
 insert into spare_parts_sales(sale_id,customer_id,part_id,sale_data,quantity,tool_price) values
(801,701,601,now(),2,2000),
(802,702,602,now(),1,800),
(803,703,603,now(),3,1200),
(804,704,604,now(),1,2500),
(805,705,605,now(),2,4000),
(806,706,606,now(),4,1600),
(807,707,607,now(),1,5000),
(808,708,608,now(),2,6000),
(809,709,609,now(),1,7000),
(810,710,610,now(),1,3500);

select * from spare_parts_sales;

 #9
 create table purchase_orders(order_id int primary key,
 supplier_id int,
 order_date timestamp,
 total_amount decimal(10,2),
 order_status varchar(20),
 foreign key (supplier_id) references suppliers(supplier_id));
 
 insert into purchase_orders(order_id,supplier_id,order_date,total_amount,order_status) values
(901,501,now(),50000,'completed'),
(902,502,now(),70000,'completed'),
(903,503,now(),90000,'Pending'),
(904,504,now(),120000,'completed'),
(905,505,now(),45000,'Pending'),
(906,506,now(),65000,'Pending'),
(907,507,now(),30000,'completed'),
(908,508,now(),80000,'Pending'),
(909,509,now(),95000,'completed'),
(910,510,now(),40000,'Pending');

select * from purchase_orders;

 #10
 create table stock_transactions(transaction_id int primary key,
 item_type varchar(50),
 item_id int,
 transaction_type varchar(50),
 quantity int,
 transaction_date timestamp);
 
insert into stock_transactions (transaction_id,item_type,item_id,transaction_type,quantity,transaction_date) values
(1001,'vehicle',1,'IN',5,now()),
(1002,'vehicle',2,'OUT',1,now()),
(1003,'part',3,'IN',20,now()),
(1004,'part',4,'OUT',5,now()),
(1005,'vehicle',5,'IN',3,now()),
(1006,'vehicle',6,'OUT',1,now()),
(1007,'Part',7,'IN',10,now()),
(1008,'part',8,'OUT',8,now()),
(1009,'vehicle',9,'IN',14,now()),
(1010,'part',10,'OUT',12,now());

select * from stock_transactions;

 #11
 create table payments(payment_id int primary key,
 payment_type varchar(50),
 created_at timestamp);
 
 insert into payments(payment_id,payment_type,created_at) values
(1101,'Cash',now()),
(1102,'Card',now()),
(1103,'UPI',now()),
(1104,'Bank Transfer',now()),
(1105,'Cheque',now()),
(1106,'Online Banking',now()),
(1107,'NEFT',now()),
(1108,'RTGS',now()),
(1109,'Cash',now()),
(1110,'Card',now());

select * from payments;

#14
create table salespersons (
    salesperson_id int primary key,
    salesperson_name varchar(100),
    phone varchar(20)
);

insert into salespersons(salesperson_id,salesperson_name,phone) values
(1401,'Prabhas',9568741203),
(1402,'Rishab',9741257801),
(1403,'Balaji',9025410130),
(1404,'Yogesh',9457103256),
(1405,'Shivam',9630125478);


 #12
 create table sales(sale_id int primary key,
 customer_id int,
 vehicle_id int,
 sale_date timestamp,
 quantity int,
 total_price decimal(10,2),
 payment_id int,
 salesperson_id int,
 foreign key (customer_id) references customers (customer_id),
 foreign key (payment_id) references payments (payment_id),
 foreign key (vehicle_id) references vehicles (vehicle_id),
  foreign key (salesperson_id) references salespersons (salesperson_id));
 
 
 
 insert into sales(sale_id,customer_id,vehicle_id,sale_date,quantity,total_price,payment_id,salesperson_id) values
(1201,701,402,now(),1,850000,1101,1403),
(1202,702,404,now(),1,1100000,1102,1403),
(1203,703,405,now(),1,1600000,1103,1403),
(1204,704,407,now(),1,1400000,1104,1401),
(1205,705,408,now(),1,1200000,1105,1402),
(1206,706,409,now(),1,4800000,1106,1403),
(1207,707,406,now(),1,22000000,1107,1403),
(1208,708,410,now(),1,900000,1108,1402),
(1209,709,412,now(),1,6000000,1109,1401),
(1210,710,415,now(),1,900000,1110,1405);


select * from sales;
 
  #13
 create table invoices(invoice_id int primary key,
 order_id int,
 sale_id int,
 issue_date timestamp,
 amount decimal(10,2),
 payment_status varchar(50),
 foreign key (order_id) references purchase_orders (order_id),
 foreign key (sale_id) references sales (sale_id));
 
 insert into invoices(invoice_id,order_id,sale_id,issue_date,amount,payment_status) values
(1301,901,1201,now(),850000,'Paid'),
(1302,902,1202,now(),1100000,'Paid'),
(1303,903,1203,now(),1600000,'Paid'),
(1304,904,1204,now(),1400000,'Pending'),
(1305,905,1205,now(),1200000,'Pending'),
(1306,906,1206,now(),4800000,'Paid'),
(1307,907,1207,now(),22000000,'Pending'),
(1308,908,1208,now(),900000,'Paid'),
(1309,909,1209,now(),6000000,'Pending'),
(1310,910,1210,now(),900000,'Paid');

select * from invoices;

#1.	Generate Monthly Sales Report (Find the best-selling months for vehicles.)

select date_format(sale_date,'%y-%M') as month, sum(total_price) as tsalae_rev 
from sales group by month order by tsalae_rev desc limit 1;

#2.	Top Selling Vehicles Report (Find the most popular vehicle models.) 
 
select model_name from vehicles where vehicle_id in(select vehicle_id 
from (select vehicle_id,count(vehicle_id) as total, rank() over(order by count(vehicle_id) desc) as result from sales group by vehicle_id) as da where result = 1);

#3.	Low Stock Alert for Spare Parts (Avoid outofstocks and ensure timely reorders.)



#4.	Sales Trends Over Time (For Growth Analysis for Track daily sales trends).

select sale_date as sale_day,count(vehicle_id) as total_sale,sum(total_price) as total_revenue from sales group by sale_date order by sale_date;

#5.	Vehicle Stock Overview (Current Inventory  for Quick dashboard to see how many vehicles are in stock.)

select vehicle_id,model_name,brand,variant,stock_quantity from vehicles;

#6.	Spare Parts Sales Analysis.

select sale_data as sale_day,part_name,quantity as total_quantity_sales from spare_parts_sales sps join spare_parts sp on sps.part_id=sp.part_id;

#7.	Revenue by Salesperson (Recognize top-performing sales ) here salespersons data is not avilable 

select s.salesperson_id,sp.salesperson_name,count(s.salesperson_id) as total_sales from sales s join salespersons sp on s.salesperson_id=sp.salesperson_id group by s.salesperson_id,sp.salesperson_name order by total_sales desc ;

#8.	Update Vehicle Stock After Sale.

update vehicles v set v.stock_quantity = 
case
when v.vehicle_id =(select s.vehicle_id from sales s where v.vehicle_id=s.vehicle_id) then v.stock_quantity -(select s.quantity from sales s where v.vehicle_id=s.vehicle_id)
else stock_quantity
end;

#9.	Update Spare Parts Stock After Sale.

update spare_parts sp set sp.stock_quantity = 
case
when sp.part_id =(select sps.part_id from spare_parts_sales sps where sp.part_id=sps.part_id) then sp.stock_quantity -(select sps.quantity from spare_parts_sales sps where sp.part_id=sps.part_id)
else stock_quantity
end;


#10.	Generate Invoices for Completed Sales.
select * from invoices where payment_status = 'Paid';

#11.Mark Overdue Invoices for Follow-Up.

update invoices set payment_status ='overdue' where payment_status = 'Pending';

