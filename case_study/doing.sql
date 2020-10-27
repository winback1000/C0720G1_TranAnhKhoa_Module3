SELECT * FROM casestudy.customers;
select customers.id, customers.name, customer_type.name, contract.id as contract_id, service.name as service_name, contract.create_date, contract.end_date,contract.total_cost + (contract_detail.quantity*other_utilities.price) as total  from customers
left join contract on customers.id = contract.id_customer
left join service on contract.id_service = service.id
left join contract_detail on contract.id = contract_detail.id_contract
left join other_utilities on contract_detail.id_utilities = other_utilities.id
left join customer_type on customers.customer_type = customer_type.id