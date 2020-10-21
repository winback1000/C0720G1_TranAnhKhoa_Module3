create database library_management;
use library_management;
create table students(
id int primary key,
`name` varchar(30) not null,
date_of_birth date,
address varchar(100),
email varchar(30),
phone_num varchar(10),
image varchar(100)
);
create table books(
id int primary key,
`name` varchar(100),
catagory int
);
create table catagory(
id int primary key,
`name` varchar(15)
);
create table borrow_order(
student_id int not null,
book_id int not null,
borrow_date date,
return_date date
);
alter table books modify catagory int,
add foreign key (catagory) references catagory(id);
alter table borrow_order
add foreign key (student_id) references students(id),
add foreign key (book_id) references books(id),
add primary key(student_id, book_id);

