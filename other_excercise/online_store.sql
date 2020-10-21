create database online_store;
use online_store;
create table Catagories(
Id int auto_increment primary key,
`Name` nvarchar(50) unique not null,
`Description` nvarchar(500)
 );
 create table Suppliers(
 Id int auto_increment primary key,
 `Name` nvarchar(100) not null,
 Email varchar(50) not null unique,
 PhoneNumber varchar(50),
 Address nvarchar(50) not null
 );
 create table Customers(
 Id varchar(50) primary key,
 FirstName nvarchar(50) not null,
 LastName nvarchar(50) not null,
 PhoneNumber varchar(50),
 Address nvarchar(500) not null,
 Email varchar(50) not null unique,
 Birthday date
 );
 create table Employees(
 Id varchar(50) primary key,
 FirstName nvarchar(50) not null,
 LastName nvarchar(50) not null,
 PhoneNumber varchar(50),
 Address nvarchar(500) not null,
 Email varchar(50) not null unique,
 Birthday date
 );
 create table Products(
 Id int auto_increment primary key,
 `Name` nvarchar(50) not null,
 ImageUrl nvarchar(1000) not null,
 Price int check (price >= 0) default 0,
 Discount int check (discount>=0 and discount <=100) default 0,
 Stock int default 0,
 CategoryId int not null,
 SupplierId int not null,
 `Description` nvarchar(2000) not null
 );
 create table Orders(
 Id int auto_increment primary key,
 CreatedDate datetime default current_timestamp,
 ShippedDate datetime not null,
 `Status` varchar(50) not null check (`Status` in ('Waiting', 'Completed', 'Canceled')),
 `Description` nvarchar(2000),
 ShippingAddress nvarchar(500) not null,
 ShippingCity nvarchar(50) not null,
 PaymentType varchar(50) default 'Cash' check (PaymentType in ('Credit Card', 'Cash')),
 CustomerId varchar(50) not null,
 EmployeeId varchar(50) not null
 );
 create table OrderDetails(
 Id int auto_increment primary key,
 OrderId int not null,
 ProductId int not null,
 Quantity int not null
 );
 alter table Products
	add constraint fk_Product1 foreign key (CategoryId) references Catagories(Id),
    add constraint fk_Product2 foreign key (SupplierId) references Suppliers(Id);
alter table Orders
	add constraint fk_Orders1 foreign key (CustomerId) references Customers(Id),
    add constraint fk_Orders2 foreign key (EmployeeId) references Employees(Id),
    add constraint check (ShippedDate >= CreatedDate);
alter table orderdetails
	add constraint fk_OrderDetails1 foreign key (OrderId) references Orders(Id),
    add constraint fk_OrderDetails2 foreign key (ProductId) references Products(Id);
    