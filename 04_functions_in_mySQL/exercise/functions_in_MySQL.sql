create database Function_in_MySQL;
use Function_in_MySQL;
create table students(
id int auto_increment primary key,
ten varchar(10) not null,
tuoi int not null,
khoa_hoc varchar(10) not null,
so_tien double
);
insert into students (ten, tuoi, khoa_hoc, so_tien) values 
('Hoang',21,'CNTT', 400000),
('Viet',19,'DTVT', 320000),
('Thanh',18,'KTDN', 400000),
('Nhan',19,'CK', 450000),
('Huong',20,'TCNH', 500000),
('Huong',20,'TCNH', 200000);
select * from students where ten = 'Huong';
select sum(so_tien) from students where ten = 'Huong';
select distinct ten as unique_name from students