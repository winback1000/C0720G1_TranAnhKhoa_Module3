SELECT * FROM classicmodels.customers;
create view view_table as
select customers.customerNumber, customers.customerName, creditLimit, products.productName as 'Product Name' from customers
join orders on customers.customerNumber = orders.customerNumber
join orderdetails on orders.orderNumber = orderdetails.orderNumber
join products on orderdetails.productCode = products.productCode
join productlines on products.productLine = productLines.productLine;
create or replace view view_table as 
select customers.customerNumber, customers.customerName, creditLimit, products.productName as 'Product Name', orderdetails.quantityOrdered, orderdetails.priceEach from customers
join orders on customers.customerNumber = orders.customerNumber
join orderdetails on orders.orderNumber = orderdetails.orderNumber
join products on orderdetails.productCode = products.productCode
join productlines on products.productLine = productLines.productLine
where customers.country = 'USA';
EXPLAIN SELECT * FROM employees WHERE lastname LIKE '%T%';
SELECT * FROM employees WHERE lastname LIKE '%T%' ;
DELIMITER //
CREATE PROCEDURE searchTotalPurchaseingById(IN customerId int, out total int)
BEGIN
set total = (
select sum(orderdetails.priceEach*orderdetails.quantityOrdered)from customers
join orders on customers.customerNumber = orders.customerNumber
join orderdetails on orders.orderNumber = orderdetails.orderNumber
join products on orderdetails.productCode = products.productCode
join productlines on products.productLine = productLines.productLine
where customers.customerNumber = customerId);
END
//
DELIMITER ;
call searchCustomerById(146,@total_purchasing);
drop procedure searchCustomerById;