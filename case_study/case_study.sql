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
('HomeLander', '1980-10-11', '1235479834', '2343432351', 'hl@hotmail.com', '2', '1', '3', '1000');

INSERT INTO `casestudy`.`service` (`name`, `area`, `rent_cost`, `max_people`, `rent_type_id`, `room_standard`, `descriptions_of_other_utilities`, `swimming_pool_area`, `number_of_floor`, `catalogue`) VALUES 
('Summer', '90', '2000', '6', '2', 'Beautiful', 'Full services', '30', '2', '2'),
('Autumn', '100', '1000', '5', '1', 'Standard', 'room for small family', '0', '2', '3'),
('Winter', '70', '200', '7', '4', 'Elegant', 'House for hours', '40', '2', '2');

delimiter //
create procedure quest14()
begin
select
contract.id as `contract id`, service.name as `service name`, other_utilities.name as `used utility service`, sum(contract_detail.quantity) as `time of using` from other_utilities
join contract_detail on other_utilities.id = contract_detail.id_utilities
join contract on contract_detail.id_contract = contract.id
join service on contract.id_service = service.id
group by other_utilities.id
having sum(contract_detail.quantity) = 1;
end //
delimiter ;
