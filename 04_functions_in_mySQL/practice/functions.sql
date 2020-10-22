SELECT * FROM classicmodels.customers;
select avg(creditLimit) from customers;
select customerName, count(customerName) from customers where customerName like '%a%';
select max(creditLimit), min(creditLimit) from customers where customerName like '%z%';
select ucase(contactLastName),lcase(contactFirstName) from customers where country = 'USA';
select customerName, length(customerName) from customers;
SELECT NOW() FROM customers;
select customerName, contactLastName, contactFirstName , country
from customers 
where creditLimit > 1000 
group by country 
having customerName like '%a%'
order by country ;