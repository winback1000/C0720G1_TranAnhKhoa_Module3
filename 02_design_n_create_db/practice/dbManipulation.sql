create database 02practice;
use 02practice;
create table dbManipulation (
	id int auto_increment,
	firstName varchar(20),
	lastName varchar(10),
	birthDate date,
	constraint dbManipulation_pk primary key (id)
);
alter table dbManipulation
	add phoneNumer varchar(11)
	after lastName;
alter table dbManipulation
	modify lastName varchar(50)
    after firstName;
alter table dbManipulation
	change column lastName surName
		varchar(10),
	rename to ManipulateToDb;
-- drop table ManipulateToDb;
create table cart (
	id int auto_increment primary key,
    orderDate date,
    customerId int,
	Foreign key (customerId) references ManipulateToDb(id)
    )