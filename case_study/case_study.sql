create database CaseStudy;
use CaseStudy;
create table service_catalogue (
id int auto_increment primary key,
`name` varchar(20) not null unique
);
create table service (
id int auto_increment primary key,
`name` varchar(20) not null unique,
area double not null,
rent_cost double not null check (rent_cost>0), 
max_people int not null check (max_people>0),
rent_type_id int,
room_standard varchar(10) not null,
descriptions_of_other_utilities text,
swimming_pool_area double not null,
number_of_floor int not null,
catalogue int not null,
free_utility_service int
);
create table rent_types (
id int auto_increment primary key,
`name` varchar(10) check (`name` in ('year','month', 'day','hour')),
price double check (price >0)
);
create table other_utilities(
id int auto_increment primary key,
`name` varchar(20) not null,
unit int check (unit >0),
price double check (price >0),
`status` varchar(45),
catalogue int not null
);
alter table other_utilities
drop check other_utilities_chk_1,
drop check other_utilities_chk_2;
create table employees(
id int auto_increment primary key,
`name` varchar(50) not null,
date_of_birth date not null,
identity_number varchar(10) not null unique,
phone_number varchar(10) not null unique,
email varchar(20) not null unique,
`level` int not null,
position int not null,
department int not null,
salary double check (salary>0)
);
create table employee_level(
id int auto_increment primary key,
`name` varchar(20) check (name in ('college', 'intermediate','bachelor','master'))
);
create table employee_position(
id int auto_increment primary key,
`name` varchar(20) check (name in ('receptionist', 'staff', 'expert', 'senior','supervisor','manager'))
);
create table employee_department(
id int auto_increment primary key,
`name` varchar(20) check (name in ('Sale-Marketing','Administrative','Service','Management'))
);
create table customers(
id int auto_increment primary key,
`name` varchar(50) not null,
date_of_birth date not null,
identity_number varchar(10) not null unique,
phone_number varchar(10) not null unique,
email varchar(20) not null unique,
customer_type int not null,
address varchar(200)
);
create table customer_type(
id int auto_increment primary key,
`name` varchar(10) check (name in ('Diamond','Plantium','Gold','Silver','Member'))
);
create table contract(
id int auto_increment primary key,
id_employee int not null,
id_customer int not null,
id_service int not null,
create_date date not null,
end_date date not null,
deposit double,
total_cost double check(total_cost >0) not null
);
create table contract_detail(
id int auto_increment primary key,
id_contract int not null,
id_utilities int,
quantity int);
alter table service
	add constraint fk_catalogue foreign key (catalogue) references service_catalogue (id),
    add constraint fk_rent_type foreign key (rent_type_id) references rent_types (id),
    add constraint fk_free_utilities foreign key(free_utility_service) references other_utilities(id);
alter table employees
	add constraint fk_position foreign key (position) references employee_position(id),
    add constraint fk_level foreign key (`level`) references employee_level(id),
    add constraint fk_department foreign key(department) references employee_department(id);
alter table customers
	add constraint fk_type foreign key(customer_type) references customer_type(id);
alter table contract
	add constraint fk_employee foreign key(id_employee) references employees(id),
    add constraint fk_customer foreign key(id_customer) references customers(id),
    add constraint fk_service foreign key(id_service) references service(id);
alter table contract_detail
	add constraint fk_contract foreign key(id_contract) references contract(id),
    add constraint fk_ultilities foreign key(id_utilities) references other_utilities(id);
INSERT INTO `casestudy`.`customers` (`name`, `date_of_birth`, `identity_number`, `phone_number`, `email`, `customer_type`, `address`) VALUES 
('Nguyen Van Binh', '2000-10-26', '1234567899', '0987654322', 'z.nguyen@gmail.com', '2', 'DaNang'),
('Nguyen Van Chien', '2001-10-11', '1234567898', '0987654323', 'b.nguyen@gmail.com', '3', 'QuangTri'),
('Nguyen Van Danh', '2002-10-22', '1234567897', '0987654324', 'c.nguyen@gmail.com', '4', 'HCM'),
('Nguyen Van Em', '2003-01-27', '1234567896', '0987654325', 'd.nguyen@gmail.com', '1', 'HaNoi'),
('Frankenstein', '2004-10-26', '1234567895', '0987654326', 'e.nguyen@gmail.com', '2', 'Germany'),
('Nguyen Van Garina', '2005-10-26', '1234567894', '0987654327', 'f.nguyen@gmail.com', '3', 'QuangTri'),
('Nguyen Van H nie', '2006-10-26', '1234567893', '0987654328', 'g.nguyen@gmail.com', '4', 'Daklak'),
('Do Van Kien', '2007-10-26', '1234567892', '0987654329', 'h.nguyen@gmail.com', '5', 'DaNang'),
('Nguyen Van Linh', '2008-10-26', '1234567891', '0987654310', 'i.nguyen@gmail.com', '1', 'QuangTri'),
('Tran Van Minh', '2009-10-26', '1234567880', '0987654311', 'k.nguyen@gmail.com', '2', 'DaNang'),
('Nicolas Cage', '2010-10-26', '1234567870', '0987654312', 'l.nguyen@gmail.com', '3', 'NYC'),
('Oliver Queen', '1998-10-26', '1234567860', '0987654313', 'm.nguyen@gmail.com', '4', 'USA'),
('Brad Pitt', '1980-10-26', '1234567850', '0987654314', 'n.nguyen@gmail.com', '5', 'England'),
('Quando Quando Quando', '1979-10-26', '1234567840', '0987654315', 'o.nguyen@gmail.com', '1', 'DaNang'),
('Richard Max', '1962-10-26', '1234567830', '0987654316', 'p.nguyen@gmail.com', '2', 'QuangTri');

INSERT INTO `casestudy`.`employee_department` (`name`) VALUES 
('Sale-Marketing'),('Administrative'),('Service'),('Management');

insert into `casestudy`.`employee_level` (`name`) values
('college'), ('intermediate'),('bachelor'),('master');

INSERT INTO `casestudy`.`employee_position` (`name`) VALUES 
('receptionist'),('staff'),('expert'),('senior'),('supervisor'),('manager');

INSERT INTO `casestudy`.`employees` (`name`, `date_of_birth`, `identity_number`, `phone_number`, `email`, `level`, `position`, `department`, `salary`) VALUES 
('Do Van Kien', '1999-01-05', '1234561234', '0987651234', 'dovakin@gmail.com', '1', '2', '3', '1000'),
('Bruce Wayne', '1980-01-01', '1111111111', '2222222222', 'batman@gmail.com', '1', '1', '1', '10000'),
('Clark Kent', '1970-03-11', '9871234560', '0981234567', 'superman@gmail.com', '2', '2', '2', '1000'),
('Barry Allen aka Flash', '1988-02-20', '9870651234', '2345123759', 'theflash@yahoo.com', '3', '3', '3', '500'),
('HomeLander', '1980-10-11', '1235479834', '2343432351', 'hl@hotmail.com', '2', '1', '3', '1000'),
('William Butcher', '1980-12-01', '1234354665', '3456812375', 'wb@theboys.com', '1', '1', '1', '400');

INSERT INTO `casestudy`.`service` (`name`, `area`, `rent_cost`, `max_people`, `rent_type_id`, `room_standard`, `descriptions_of_other_utilities`, `swimming_pool_area`, `number_of_floor`, `catalogue`) VALUES 
('Summer', '90', '2000', '6', '2', 'Beautiful', 'Full services', '30', '2', '2'),
('Autumn', '100', '1000', '5', '1', 'Standard', 'room for small family', '0', '2', '3'),
('Winter', '70', '200', '7', '4', 'Elegant', 'House for hours', '40', '2', '2');

-- quest 2
select * from employees where length(name)<=15 and (name like 'H%' or name like 'K%'or name like 'T%') ;

-- quest 3
select * from customers where year(now())- year(date_of_birth)>= 18 and year(now())- year(date_of_birth)<= 50 and address in('DaNang','QuangTri');

-- quest 4
select customers.id, customers.name, customer_type.name, count(customers.id) from customers
join contract on customers.id = contract.id_customer
join customer_type on customers.customer_type =  customer_type.id
where customer_type = 1
group by customers.id 
order by count(customers.id);

-- quest 5 (not complete yet)
select customers.id, customers.name, customer_type.name as `customer type`, contract.id as `contract id`, contract.create_date, contract.end_date, sum(service.rent_cost + contract_detail.quantity*other_utilities.price) as total from customers
left join contract on customers.id = contract.id_customer
left join contract_detail on contract.id = contract_detail.id_contract
left join service on contract.id_service = service.id
left join other_utilities on contract_detail.id_utilities = other_utilities.id
left join customer_type on customers.customer_type = customer_type.id
group by customers.id;

-- quest 6
select
service.id, service.name, service.area, service.max_people,service.rent_cost, service.catalogue
from
service
join contract on service.id = contract.id_service
join service_catalogue on service.catalogue = service_catalogue.id
where service.id not in 
(select service.id from service
join contract on service.id = contract.id_service
where year(contract.create_date) = 2019 and (month(contract.create_date) in (1,2,3)))
group by service.id;

-- quest 7
select
service.id, service.name, service.area, service.max_people,service.rent_cost, service.catalogue
from
service
join contract on service.id = contract.id_service
join service_catalogue on service.catalogue = service_catalogue.id
where year(contract.create_date) = 2018 and service.id not in 
(select service.id from service
join contract on service.id = contract.id_service
where year(contract.create_date) = 2019)
group by service.id;

-- quest 8
select
customers.name from customers
union
select 
customers.name from customers;

select distinct name from customers;

select name from customers group by name;


-- quest 9
select month(contract.create_date) as `month`, year(contract.create_date) as `year`, count(month(contract.create_date)) as `total rent` from contract
where year(contract.create_date) = 2019
group by month(contract.create_date);

-- quest 10
select contract.id, contract.create_date, contract.end_date, contract.deposit, sum(contract_detail.quantity) as `amount of utilitites` from contract
left join contract_detail on contract.id = contract_detail.id_contract
group by contract.id;

-- quest 11
select other_utilities.id,other_utilities.name, other_utilities.unit, other_utilities.price, other_utilities.status, other_utilities.catalogue from other_utilities
join contract_detail on other_utilities.id = contract_detail.id_utilities
join contract on contract_detail.id_contract = contract.id
join customers on contract.id_customer = customers.id
where customers.customer_type = 1 and customers.address in ('Vinh','QuangNgai');

-- quest 12
select
contract.id, employees.name as `employee name`, customers.name as `customer name`, customers.phone_number, service.name as `service name`, sum(contract_detail.quantity) as `amount of utilitites`, contract.deposit
from contract
left join contract_detail on contract.id = contract_detail.id_contract
join employees on contract.id_employee =  employees.id
join customers on contract.id_customer = customers.id
join service on contract.id_service = service.id
where year(contract.create_date) = 2019 and month(contract.create_date) in (10,11,12) and contract.id not in
(select contract.id from contract
where year(contract.create_date) = 2019 and month(contract.create_date) in (1,2,3,4,5,6))
group by contract.id;

-- quest 13

select
other_utilities.name, sum(contract_detail.quantity) as `total using` from other_utilities
join contract_detail on other_utilities.id = contract_detail.id_utilities
group by other_utilities.id
having `total using` = (select sum(contract_detail.quantity) from contract_detail
group by contract_detail.id_utilities
order by sum(contract_detail.quantity) desc limit 1);

-- quest 14
select
contract.id as `contract id`, service.name as `service name`, other_utilities.name as `used utility service`, sum(contract_detail.quantity) as `time of using` from other_utilities
join contract_detail on other_utilities.id = contract_detail.id_utilities
join contract on contract_detail.id_contract = contract.id
join service on contract.id_service = service.id
group by other_utilities.id
having sum(contract_detail.quantity) = 1;

-- quest 15
select 
employees.id, employees.name, employee_department.name as department, employees.phone_number from employees
join contract on employees.id = contract.id_employee
join employee_department on employees.department = employee_department.id
where year(contract.create_date) in (2018,2019)
group by employees.id
having count(employees.id) <= 3;

-- quest 16
INSERT INTO `casestudy`.`employees` (`name`, `date_of_birth`, `identity_number`, `phone_number`, `email`, `level`, `position`, `department`, `salary`) VALUES 
('William Butcher', '1980-12-01', '1234354665', '3456812375', 'wb@theboys.com', '1', '1', '1', '400');
SET SQL_SAFE_UPDATES = 0;
delete from employees where employees.id not in
(select * from 
(select employees.id from employees
join contract on employees.id = contract.id_employee
where year(contract.create_date) in (2017,2018,2019)
group by employees.id
having count(employees.id) > 0)tblTmp);

-- quest 17
update customers set customer_type = 1 where customers.id in
(select * from
(select id_customer from contract
join customers on contract.id_customer = customers.id
where customers.customer_type =2 and year(contract.create_date) = 2019
group by id_customer
having sum(total_cost) >500)tblTmp);
update customers set customer_type = 2 where customers.id in (2,6);

-- quest 18
INSERT INTO `casestudy`.`customers` (`id`,`name`, `date_of_birth`, `identity_number`, `phone_number`, `email`, `customer_type`, `address`) VALUES 
(20,'Do Van Kien', '2007-10-26', '1234327892', '0987543329', 'af.nguyen@gmail.com', '5', 'DaNang');
INSERT INTO `casestudy`.`contract` (`id`,`id_employee`, `id_customer`, `id_service`, `create_date`, `end_date`, `deposit`, `total_cost`) VALUES 
(36,'4', '20', '4', '2015-11-11', '2016-01-01', '300', '1000');
insert into contract_detail (id_contract, id_utilities, quantity) values
(36,4,4);
SET SQL_SAFE_UPDATES = 0;
delete customers, contract, contract_detail 
from contract
join customers on contract.id_customer = customers.id
join contract_detail on contract.id = contract_detail.id_contract
where contract.id_customer in
(select * from (
select contract.id_customer from contract
where year(contract.create_date) <2016)tblTmp);

-- quest 19
update other_utilities set price = price*2 where id in
(select id_utilities from contract_detail
group by id_utilities
having sum(quantity)>=10);

update other_utilities set price = price/2 where id in
  (select id_utilities from contract_detail
group by id_utilities
having sum(quantity)>=10);

-- quest 20
select customers.id as id, customers.name as `name`, customers.email as email, customers.phone_number as `phone number`, customers.date_of_birth as `date of birth`, customers.address as address
from customers
union
select employees.id as id, employees.name as `name`, employees.email as email, employees.phone_number as `phone number`, employees.date_of_birth as `date of birth`, employees.address as address
from employees;

-- quest 21
INSERT INTO `casestudy`.`contract` (`id_employee`, `id_customer`, `id_service`, `create_date`, `end_date`, `deposit`, `total_cost`) 
VALUES ('1', '18', '4', '2019-12-12', '2020-01-02', '500', '500');

create or replace view V_EMPLOYEE as
select employees.id, employees.name, employees.date_of_birth, employees.identity_number, employees.phone_number, employees.email, employees.level, employees.position, employees.department, employees.salary, employees.address from employees 
join contract on employees.id = contract.id_employee
where contract.create_date = '2019-12-12' and employees.address = 'HaiChau';

-- quest 22
update casestudy.v_employee set address = 'LienChieu';
UPDATE `casestudy`.`employees` SET `address` = 'HaiChau' WHERE (`id` = '1');

-- quest 23
delimiter //
create procedure Sp_1 (in in_id int)
begin
SET FOREIGN_KEY_CHECKS=OFF;
delete customers, contract, contract_detail 
from contract
join customers on contract.id_customer = customers.id
join contract_detail on contract.id = contract_detail.id_contract
where contract.id_customer = in_id;
SET FOREIGN_KEY_CHECKS=ON;
end //
delimiter ;

-- quest 24
delimiter //
create procedure Sp_2 (in in_id_employee int,in_id_customer int, in_id_service int, in_create_date date, in_end_date date, in_deposit double, in_total_cost double )
begin
INSERT INTO `casestudy`.`contract` (`id_employee`, `id_customer`, `id_service`, `create_date`, `end_date`, `deposit`, `total_cost`) VALUES 
(in_id_employee, in_id_customer, in_id_service, in_create_date, in_end_date, in_deposit, in_total_cost);
end //
delimiter ;

-- quest 25
delimiter //
create trigger Tr_1 after delete on contract
FOR EACH ROW
begin
declare total_contract int;
select count(contract.id)
into total_contract
from contract ;
end //
delimiter ;