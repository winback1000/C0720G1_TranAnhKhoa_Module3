create database Analysis_n_Design_DB;
use Analysis_n_Design_DB;
create table customers(
customerNumber int primary key,
customerName varchar(50) not null,
contactLastName varchar(10) not null,
contactFirstName varchar(200) not null,
phone varchar(50) not null,
addressLine1 varchar(50) not null,
addressLine2 varchar(50),
city varchar(50) not null,
state varchar(50) not null,
postalCode varchar(10) not null,
country varchar(50) not null,
creditLimit int,
orderNumber int,
salesRepEmployeeNumber int,
foreign key (salesRepEmployeeNumber) references employees(employeeNumber)
);
create table orders (
orderNumber int primary key,
orderDate date not null,
requiredDate date not null,
shippedDate date not null,
status varchar(10) not null,
comments text,
quantityOrdered int not null,
priceEach double not null,
customerNumber int not null,
foreign key (customerNumber) references customers(customerNumber)
);
create table orderDetails(
orderNumber int not null,
productCode varchar(15) not null,
primary key(orderNumber , productCode),
foreign key (orderNumber) references orders(orderNumber),
foreign key (productCode) references products(productCode)
);
create table payments(
customerNumber int not null,
checkNumber varchar(50) not null,
paymentDate date not null,
amount double not null,
foreign key (customerNumber) references customers(customerNumber)
);
create table products(
productCode varchar(15) primary key,
productName varchar(70) not null,
productScale varchar(10) not null,
productVender varchar(50) not null,
productDescription text not null,
quantityInStock int not null,
buyPrice double not null,
MSRP double not null,
productLine varchar(50),
constraint fk_products foreign key (productLine) references productlines(productLine)
);
create table productlines(
productLine varchar(50) primary key,
textDescription text not null,
image varchar(1000)
);
create table employees(
employeeNumber int primary key,
lastName varchar(50) not null,
firstName varchar(50) not null,
email varchar(100) not null,
jobTitle varchar(50) not null,
reportTo int not null,
constraint fk_employees foreign key (reportTo) references employees(employeeNumber),
officeCode varchar(10),
foreign key (officeCode) references offices(officeCode)
);
create table offices(
officeCode varchar(10) primary key,
phone varchar(50) not null,
addressLine1 varchar(50) not null,
addressLine2 varchar(50),
city varchar(50) not null,
state varchar(50) not null,
postalCode varchar(10) not null,
country varchar(50) not null
)