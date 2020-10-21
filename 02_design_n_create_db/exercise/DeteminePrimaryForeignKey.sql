create database PrimaryAndForeignKey;
use PrimaryAndForeignKey;
create table Customer(
id int auto_increment primary key,
fullName varchar(50),
address varchar(1000),
phoneNum char(10) unique
);
create table email(
id int auto_increment primary key,
email varchar(50),
id_customer int,
constraint fk_email foreign key (id_customer)references Customer(id)
);
create table phone_number(
id int auto_increment primary key,
phoneNum char(10) unique,
id_customer int not null,
constraint fk_phone_number foreign key(id_customer) references Customer(id)
);
create table accounts(
account_number char(10) unique primary key,
account_type char(10),
create_date date,
balance double,
customer_id int,
foreign key (customer_id) references Customer(id)
);
create table transactions (
tran_num int auto_increment primary key,
account_number char(10) not null,
tran_date date not null,
amount int not null,
descriptions varchar(1000),
from_account_id char(10) not null,
to_account_id char(10) not null,
foreign key (from_account_id) references accounts(account_number),
foreign key (to_account_id) references accounts(account_number)
)