package service;

import models.Customer;

import java.util.ArrayList;
import java.util.List;

public class CustomerServiceImpl implements CustomerService {
    public static List<Customer> customers = new ArrayList<>();
    static {
        customers.add(new Customer("John", "john@codegym.vn", "Hanoi"));
        customers.add(new Customer("Bill", "bill@codegym.vn", "Saigon"));
        customers.add(new Customer("Alex", "alex@codegym.vn", "Danang"));
        customers.add(new Customer("Adam", "adam@codegym.vn", "Beijin"));
        customers.add(new Customer("Sophia", "sophia@codegym.vn", "Miami"));
        customers.add(new Customer("Rose", "Rose@codegym.vn", "Newyork"));
    }
    @Override
    public List<Customer> findAll() {
        return customers;
    }

    @Override
    public void save(Customer customer) {
        customers.add(customer);
    }

    @Override
    public Customer findById(int id) {
        Customer result = null;
        for (Customer customer: customers) {
            if( customer.getId() == id) {
                result = customer;
            }
        }
        return result;
    }

    @Override
    public void update(int id, Customer customer) {
        for (Customer cus: customers) {
            if (cus.getId() == id) {
                cus.setName(customer.getName());
                cus.setEmail(customer.getEmail());
                cus.setAddress(customer.getAddress());
            }
        }
    }

    @Override
    public void remove(int id) {
        customers.removeIf(customer -> customer.getId() == id);
    }
}
