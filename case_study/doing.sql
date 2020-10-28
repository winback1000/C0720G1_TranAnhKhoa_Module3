SELECT * FROM casestudy.customers;
-- select customers.id, customers.name, customer_type.name, contract.id as contract_id, service.name as service_name, contract.create_date, contract.end_date,sum(contract.total_cost + (contract_detail.quantity*other_utilities.price)) as total  from customers
-- join contract on customers.id = contract.id_customer
-- join service on contract.id_service = service.id
-- join contract_detail on contract.id = contract_detail.id_contract
-- join other_utilities on contract_detail.id_utilities = other_utilities.id
-- join customer_type on customers.customer_type = customer_type.id
-- group by customers.id;
select * from service;
-- select
-- service.id, service.name, service.area, service.max_people,service.rent_cost, service.catalogue
-- from
-- service
-- join contract on service.id = contract.id_service
-- join service_catalogue on service.catalogue = service_catalogue.id
-- where year(contract.create_date) = 2018 and service.id not in 
-- (select service.id from service
-- join contract on service.id = contract.id_service
-- where year(contract.create_date) = 2019)
-- group by service.id;
-- select customers.name, count(customers.name) from customers
-- group by customers.name;
select
contract.id as `contract id`, service.name as `service name`, other_utilities.name as `used utility service`, sum(contract_detail.quantity) as `time of using` from other_utilities
join contract_detail on other_utilities.id = contract_detail.id_utilities
join contract on contract_detail.id_contract = contract.id
join service on contract.id_service = service.id
group by other_utilities.id
having sum(contract_detail.quantity) = 1;