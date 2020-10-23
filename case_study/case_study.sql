create database CaseStudy;
use CaseStudy;
create table service_catalogue (
id int auto_increment primary key,
`name` varchar(20) not null unique,
`type` varchar(10) not null
);
create table service (
id int auto_increment primary key,
`name` varchar(20) not null unique,
area double not null,
rent_cost double not null check (rent_cost>0),
max_people int not null check (max_people>0),
rent_type varchar(10) check (rent_type in ('year','month', 'day','hour')),
room_standard varchar(10) not null,
descriptions_of_other_utilities text,
swimming_pool_area double not null,
number_of_floor int not null,
catalogue int not null,
free_utility_service int not null
);
create table other_utilities(
id int auto_increment primary key,
`name` varchar(20) not null,
unit int check (unit >0),
price double check (price >0),
`status` varchar(45),
catalogue int not null
);
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