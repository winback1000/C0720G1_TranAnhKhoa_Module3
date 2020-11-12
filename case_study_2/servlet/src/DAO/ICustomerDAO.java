package DAO;

import models.Customer;

import java.util.List;

public interface ICustomerDAO {
    List<Customer> getAllCustomer();
    void createCustomer(Customer customer);
    boolean updateCustomer(Customer customer);
    boolean deleteCustomer(String id);
    Customer selectCustomer(String id);
    List<Customer> searchCustomer(String name);
}
