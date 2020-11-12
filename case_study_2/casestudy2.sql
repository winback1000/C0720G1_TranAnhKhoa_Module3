create database caseStudy2;
use caseStudy2;
create table customer_type (
customer_type_id int primary key auto_increment,
customer_type_name varchar(45)
);
create table customer (
customer_id varchar(8) primary key,
customer_type_id int,
customer_name varchar(45),
customer_birthday Date,
customer_gender varchar(10),
customer_id_card varchar(45),
customer_phone varchar(45),
customer_email varchar(45),
customer_address varchar(45)
);
create table position (
position_id int primary key auto_increment,
position_name varchar(45)
);
create table education_degree (
education_degree_id int primary key auto_increment,
education_degree_name varchar(45)
);
create table division (
division_id int primary key auto_increment,
division_name varchar(45)
);
create table `role` (
role_id int primary key auto_increment,
role_name varchar(45)
);
create table `user` (
username varchar(45) primary key,
`password` varchar(45)
);
create table employee (
employee_id int primary key auto_increment,
employee_name varchar(45),
employee_birthday Date,
employee_id_card varchar(45),
employee_salary double,
employee_phone varchar(45),
employee_address varchar(100),
position_id int,
education_degree_id int,
division_id int,
username varchar(45)
);
create table service_type (
service_type_id int primary key auto_increment,
service_type_name varchar(45)
);
create table rent_type (
rent_type_id int primary key auto_increment,
rent_type_name varchar(45),
rent_type_cost double
);
create table service (
service_id varchar(7) primary key,
service_name varchar(45),
service_area int,
service_cost double,
service_max_people int,
rent_type_id int,
service_type_id int,
standard_room varchar(45),
description_other_convenience varchar(45),
pool_area double,
number_of_floor int
);
create table contract (
contract_id int primary key auto_increment,
contract_start_date datetime,
contract_end_date datetime,
contract_deposit double,
contract_total_money double,
employee_id int,
customer_id int,
service_id int
);
create table contract_detail (
contract_detail_id int primary key auto_increment,
contract_id int,
attach_service_id int,
quantity int
);
create table attach_service (
attach_service_id int primary key auto_increment,
attach_service_name varchar(45),
attach_servcontractcontract_detailice_cost double,
attach_service_unit int,
attach_service_status varchar(45)
);