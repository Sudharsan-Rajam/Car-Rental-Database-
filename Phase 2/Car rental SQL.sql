/* TASK 1 and TASK 2 */

Create database CarRental ;
use CarRental ;





/* CUSTOMER TABLE */

create table CUSTOMER(Cust_ID int NOT NULL auto_increment, Name varchar(20), Phone varchar(15), primary key (Cust_ID)); 

insert into CUSTOMER(Cust_ID, Name, Phone) values ('201','A. Parks','(214) 555-0127');
insert into CUSTOMER(Cust_ID, Name, Phone) values ('202','S. Patel','(849) 811-6298');
insert into CUSTOMER(Cust_ID, Name, Phone) values ('203','A. Hernandez','(355) 572-5385');
insert into CUSTOMER(Cust_ID, Name, Phone) values ('204','G. Carver','(753) 763-8656');
insert into CUSTOMER(Cust_ID, Name, Phone) values ('205','Sh. Byers','(912) 925-5332');
insert into CUSTOMER(Cust_ID, Name, Phone) values ('206','L. Lutz','(931) 966-1775');
insert into CUSTOMER(Cust_ID, Name, Phone) values ('207','L. Bernal','(884) 727-0591');
insert into CUSTOMER(Cust_ID, Name, Phone) values ('208','I. Whyte','(811) 979-7345');
insert into CUSTOMER(Cust_ID, Name, Phone) values ('209','L. Lott','(954) 706-2219');
insert into CUSTOMER(Cust_ID, Name, Phone) values ('210','G. Clarkson','(309) 625-1838');
insert into CUSTOMER(Cust_ID, Name, Phone) values ('211','Sh. Dunlap','(604) 581-6642');
insert into CUSTOMER(Cust_ID, Name, Phone) values ('212','H. Gallegos','(961) 265-8638');
insert into CUSTOMER(Cust_ID, Name, Phone) values ('213','L. Perkins','(317) 996-3104');
insert into CUSTOMER(Cust_ID, Name, Phone) values ('214','M. Beach','(481) 422-0282');
insert into CUSTOMER(Cust_ID, Name, Phone) values ('215','C. Pearce','(599) 881-5189');
insert into CUSTOMER(Cust_ID, Name, Phone) values ('216','A. Hess','(516) 570-6411');
insert into CUSTOMER(Cust_ID, Name, Phone) values ('217','M. Lee','(369) 898-6162');
insert into CUSTOMER(Cust_ID, Name, Phone) values ('218','R. Booker','(730) 784-6303');
insert into CUSTOMER(Cust_ID, Name, Phone) values ('219','A. Crowther','(325) 783-4081');
insert into CUSTOMER(Cust_ID, Name, Phone) values ('220','	H. Mahoney','(212) 262-8829');
insert into CUSTOMER(Cust_ID, Name, Phone) values ('221','J. Brown','(644) 756-0110');
insert into CUSTOMER(Cust_ID, Name, Phone) values ('222','H. Stokes','(931) 969-7317');
insert into CUSTOMER(Cust_ID, Name, Phone) values ('223','J. Reeves','(940) 981-5113');
insert into CUSTOMER(Cust_ID, Name, Phone) values ('224','A. Mcghee','(838) 610-5802');
insert into CUSTOMER(Cust_ID, Name, Phone) values ('225','L. Mullen','(798) 331-7777');
insert into CUSTOMER(Cust_ID, Name, Phone) values ('226','R. Armstrong','(325) 783-4081');
insert into CUSTOMER(Cust_ID, Name, Phone) values ('227','J. Greenaway','(212) 262-8829');
insert into CUSTOMER(Cust_ID, Name, Phone) values ('228','K. Kaiser Acosta','(228) 576-1557');
insert into CUSTOMER(Cust_ID, Name, Phone) values ('229','D. Kirkpatrick','(773) 696-8009');
insert into CUSTOMER(Cust_ID, Name, Phone) values ('230','A. Odonnell','(439) 536-8929');
insert into CUSTOMER(Cust_ID, Name, Phone) values ('231','K. Kay','(368)336-5403');

select * from CUSTOMER;


/* RATE Table */

create table RATE(Type int, Category boolean, Weekly decimal(5,2), Daily decimal(5,2),primary key(Type,Category));

/* Import the RATE CSV File */

select * FROM RATE;


/* VEHICLE table */

create table VEHICLE(Vehicle_ID varchar(20), Description varchar(30), Year int , Type int, Category boolean,primary key(Vehicle_ID),foreign key(Type,Category) references RATE(Type,Category));

/* Import the VEHICLE CSV File */

select * from VEHICLE;


/* RENTAL TABLE */

create table RENTAL(Cust_ID int NOT NULL, Vehicle_ID varchar(20), StartDate date, OrderDate date, RentalType int, Qty int, ReturnDate date, TotalAmount int, PaymentDate date,FOREIGN KEY(Cust_ID) REFERENCES CUSTOMER(Cust_ID),FOREIGN KEY(Vehicle_ID) REFERENCES VEHICLE(Vehicle_ID));

/* Import the RENTAL CSV File */

select * from RENTAL;


/* Total Number of Records per table */

SELECT COUNT(*) FROM CUSTOMER;

SELECT COUNT(*) FROM RENTAL;


SELECT COUNT(*) FROM RATE;



SELECT COUNT(*) FROM VEHICLE;



/* TASK 3 */

/* Q-1 */

insert into CUSTOMER(Name,Phone) values ('Sudharsan Rajam','(888) 922-1010'); 

/* Q-2 */

UPDATE CUSTOMER
SET Phone='(837) 721-8965'
WHERE (Cust_ID ='232');

/* Q-3 */

update RATE
set Daily  = Daily + (Daily * 5.0 / 100.0)
where Category = '1' AND Type >0 ;

/* Q-4 */

/* 4(a) */

insert into VEHICLE(Vehicle_ID,Description,Year,Type,Category) values ('5FNRL6H58KB133711',
'Honda Odyssey','2019','6','1');

/*  Record already exsists */

/* 4(b) */

insert into RATE(Type,Category,Weekly,Daily) values('5','1','900.00','150.00');
insert into RATE(Type,Category,Weekly,Daily) values('5','1','800.00','135.00');

/*  Record already exsists */

/* Q-5 */

SELECT Vehicle.Vehicle_ID as VIN,Description,Year,StartDate,ReturnDate,datediff(ReturnDate,StartDate) as TotalDays
FROM Vehicle
INNER JOIN RENTAL on  VEHICLE.Vehicle_ID = RENTAL.Vehicle_ID 
WHERE Type = '1' and Category = '1'
AND StartDate NOT BETWEEN '2019-06-01' and '2019-06-20'
AND ReturnDate  NOT BETWEEN '2019-06-01' and '2019-06-20';

Create table AVAILABILITY(Vehicle_Id varchar(20)  not null,Description varchar(30),Year int,StartDate date,ReturnDate date,TotalDays int,foreign key (Vehicle_Id) references VEHICLE (Vehicle_ID));

SELECT VEHICLE.Vehicle_ID,VEHICLE.Description,VEHICLE.Year,Sum(TotalDays) as TotalDays
FROM VEHICLE,AVAILABILITY
WHERE VEHICLE.Vehicle_ID = AVAILABILITY.Vehicle_Id
GROUP BY VEHICLE.Vehicle_ID;

/* Q-6 */

SELECT Name,Sum(TotalAmount) As Remaining_Balance
From CUSTOMER
INNER JOIN RENTAL on CUSTOMER.Cust_ID = RENTAL.Cust_ID
WHERE CUSTOMER.Cust_ID = '221' and PaymentDate is NULL;

/* Q-7 */

SELECT VEHICLE.Vehicle_ID as VIN, Description,Year, Weekly,Daily,
CASE
WHEN RATE.Category = '0' THEN 'BASIC'
ELSE 'Luxury'
END AS 'Category' ,
CASE
WHEN RATE.Type = '1' THEN 'Compact'
WHEN RATE.Type = '2' THEN 'Medium'
WHEN RATE.Type = '3' THEN 'Large'
WHEN RATE.Type = '4' THEN 'SUV'
WHEN RATE.Type = '5' THEN 'Truck'
ELSE 'VAN'
END AS Type
FROM VEHICLE
inner join RATE on VEHICLE.Type = RATE.Type and Vehicle.CATEGORY = RATE.Category
ORDER BY RATE.Category = 'BASIC', Vehicle.Type ;

/* Q-8 */

SELECT Sum(TotalAmount) As TotalAmt_Customers
FROM RENTAL
WHERE PaymentDate is not null;

/* Q-9 */

/* 9(A) */

SELECT Description,Year,datediff(ReturnDate,StartDate) as TotalDays,TotalAmount,
CASE
WHEN PaymentDate is not null then 'Paid'
ELSE 'Not Paid'
END AS 'Payment' ,
CASE 
WHEN VEHICLE.Type = '1' THEN 'Compact'
ELSE 'null'  
END AS 'Type' ,
CASE 
WHEN VEHICLE.Category = '1' THEN 'Luxury'
END AS Category
FROM RENTAl
INNER JOIN VEHICLE on RENTAL.Vehicle_ID = VEHICLE.Vehicle_ID
INNER JOIN CUSTOMER on RENTAL.Cust_ID = CUSTOMER.Cust_ID
WHERE CUSTOMER.Name = 'J. Brown'
ORDER BY StartDate;

SELECT Description, AVG(TotalAmount) as Unit_Price FROM RENTAL
INNER JOIN VEHICLE on RENTAL.Vehicle_ID = VEHICLE.Vehicle_ID 
WHERE Cust_ID = '221'
GROUP BY RENTAL.Vehicle_ID;

/* 9(B) */

SELECT Name,sum(TotalAmount) as Current_Balance
FROM CUSTOMER
INNER JOIN RENTAL on CUSTOMER.Cust_ID = RENTAL.Cust_ID
WHERE CUSTOMER.Cust_ID = '221' AND PaymentDate is null;

/* Q-10 */

SELECT Name,StartDate,ReturnDate,TotalAmount
FROM CUSTOMER
INNER JOIN RENTAL on CUSTOMER.Cust_ID = RENTAL.Cust_ID
WHERE RENTAL.Vehicle_ID = '19VDE1F3XEE414842' AND RENTAL.RentalType = '7' AND RENTAL.PaymentDate is null;

/* Q-11 */

SELECT CUSTOMER.Cust_ID,Name
FROM CUSTOMER
LEFT JOIN RENTAL on CUSTOMER.Cust_ID = RENTAL.Cust_ID
WHERE RENTAL.Cust_ID is null;

/* Q-12 */

SELECT Name,Description,StartDate,ReturnDate,TotalAmount
FROM CUSTOMER
JOIN RENTAL on CUSTOMER.Cust_ID = RENTAL.Cust_ID
JOIN VEHICLE on RENTAL.Vehicle_ID = VEHICLE.Vehicle_ID
WHERE RENTAL.StartDate = RENTAL.PaymentDate
ORDER BY NAME;






 


