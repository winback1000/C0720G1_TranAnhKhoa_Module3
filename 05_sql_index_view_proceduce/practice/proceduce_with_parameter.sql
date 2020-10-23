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