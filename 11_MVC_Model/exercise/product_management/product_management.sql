create database product_manager;
use product_manager;
create table Product (
id int auto_increment primary key,
name varchar(100),
manufacturer varchar(50),
image varchar(500),
price double,
stock int
);
insert into product (name, manufacturer, image, price, stock) values 
("Galaxy S1", "Samsung"," ", 200, 20),
("Galaxy S2", "Samsung"," ", 300, 20),
("Galaxy S3", "Samsung"," ", 400, 20),
("Galaxy S4", "Samsung"," ", 500, 20),
("Galaxy S5", "Samsung"," ", 600, 20),
("Galaxy S6", "Samsung"," ", 700, 20),
("Galaxy S7", "Samsung"," ", 800, 20),
("Galaxy S8", "Samsung"," ", 900, 20),
("Galaxy S9", "Samsung"," ", 1000, 20),
("Galaxy S10", "Samsung"," ", 1100, 20);
