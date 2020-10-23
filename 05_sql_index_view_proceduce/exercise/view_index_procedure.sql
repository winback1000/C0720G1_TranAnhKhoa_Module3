create database view_index_procedure;
use view_index_procedure;
create table products(
id int auto_increment primary key,
productCode varchar(8) not null,
productName varchar(20) not null,
productPrice double not null check(productPrice >0),
productAmount int,
productDescription text,
productStatus varchar(10)
);
insert into products (productCode, productName, productPrice, productAmount, productDescription, productStatus) values 
('GT-i9000', 'samsung galaxy S', 1500000, 10,'no one will buy this product','2nd hand'),
('SM-G990', 'samsung galaxy S10', 20000000, 10,'morden phone','new'),
('GT-i9100', 'samsung galaxy S1', 1500000, 10,'no one will buy this product','2nd hand'),
('GT-i9200', 'samsung galaxy S2', 1500000, 10,'no one will buy this product','2nd hand'),
('GT-i9300', 'samsung galaxy S3', 1500000, 10,'no one will buy this product','2nd hand'),
('GT-i9505', 'samsung galaxy S5', 1500000, 10,'no one will buy this product','2nd hand'),
('GT-i9600', 'samsung galaxy S6', 1500000, 10,'no one will buy this product','2nd hand'),
('GT-i9700', 'samsung galaxy S7', 1500000, 10,'no one will buy this product','2nd hand'),
('GT-i9800', 'samsung galaxy S8', 1500000, 10,'no one will buy this product','2nd hand'),
('SM-G900', 'samsung galaxy S1', 1500000, 10,'no one will buy this product','2nd hand'),
('SM-G910', 'samsung galaxy S1', 1500000, 10,'no one will buy this product','2nd hand'),
('SM-G920', 'samsung galaxy S1', 1500000, 10,'no one will buy this product','2nd hand'),
('SM-G930', 'samsung galaxy S1', 1500000, 10,'no one will buy this product','2nd hand'),
('SM-G940', 'samsung galaxy S1', 1500000, 10,'no one will buy this product','2nd hand'),
('SM-G950', 'samsung galaxy S1', 1500000, 10,'no one will buy this product','2nd hand'),
('SM-G960', 'samsung galaxy S1', 1500000, 10,'no one will buy this product','2nd hand'),
('SM-G970', 'samsung galaxy S1', 1500000, 10,'no one will buy this product','2nd hand'),
('SM-G980', 'samsung galaxy S1', 1500000, 10,'no one will buy this product','2nd hand'),
('SM-G9100', 'samsung galaxy S1', 1500000, 10,'no one will buy this product','2nd hand');
create index product_list on products(id);
create index product_name_n_price on products(productName, productPrice);
explain select * from products;
create view products_info as
select productCode, productName, productPrice, productStatus from products;
alter view products_info as
select id, productCode, productName, productPrice, productStatus from products;
drop view product_info;
DELIMITER //
create procedure getAllInfo()
begin
select * from products;
end 
//
DELIMITER ;
delimiter //
create procedure addProduct (code varchar(8), name varchar(20), price double, amount int, description text,  status varchar(10))
begin
insert into products (productCode, productName, productPrice, productAmount, productDescription, productStatus) values
(code, name, price, amount,description, status);
end //
delimiter ;
call addProduct ('SM-G920', 'Galaxy S7', 8000000, 5, 'semi god phone', 'new');

delimiter //
create procedure editProduct (id_to_update int,code varchar(8), name varchar(20), price double, amount int, description text,  status varchar(10))
begin
update products
set productCode = code, productName = name, productPrice = price, productAmount = amount, productDescription = description, productStatus = status
where products.id = id_to_update;
end //
delimiter ;

delimiter //
create procedure deleteProduct(id_to_delete int)
begin
delete from products where id = id_to_delete;
end //
delimiter ; 

call deleteProduct(9);