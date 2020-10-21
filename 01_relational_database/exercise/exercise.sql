create database exercise;
create table Products (
Id int,
Name nvarchar(50),
ImageUrl nvarchar(1000),
Price int,
Discount int,
Stock int,
CatagoryId int,
SupplierId int,
Description nvarchar(1000)
);
create table Orders(
Id int,
CreatedDate datetime,
ShippedDate datetime,
Status varchar(50),
Description nvarchar(1000),
ShippingAddress nvarchar(500),
ShippingCity nvarchar(50),
PaymentType varchar(20),
CustomerId varchar(50),
EmployeeId varchar(50)
);