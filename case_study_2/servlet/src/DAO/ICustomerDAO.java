package DAO;

import models.Customer;

import java.util.List;

public interface ICustomerDAO {
    String jdbcURL = "jdbc:mysql://localhost:3306/casestudy2?useSSL=false";
    String jdbcUsername = "root";
    String jdbcPassword = "Chewingum1";

    List<Customer> getAllCustomer();
    void createCustomer(Customer customer);
    boolean updateCustomer(Customer customer);
    boolean deleteCustomer(int id);
    Customer selectCustomer(int id);
    List<Customer> searchCustomer(String name);
}
