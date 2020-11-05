package service;

import models.Customer;

import java.util.ArrayList;
import java.util.List;

public class CustomerServiceImpl implements CustomerService {
    private static List<Customer> customers = new ArrayList<>();
    static {
        customers.add(new Customer(1, "John", "john@codegym.vn", "Hanoi"));
        customers.add(new Customer(2, "Bill", "bill@codegym.vn", "Saigon"));
        customers.add(new Customer(3, "Alex", "alex@codegym.vn", "Danang"));
        customers.add(new Customer(4, "Adam", "adam@codegym.vn", "Beijin"));
        customers.add(new Customer(5, "Sophia", "sophia@codegym.vn", "Miami"));
        customers.add(new Customer(6, "Rose", "Rose@codegym.vn", "Newyork"));
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
                cus = customer;
            }
        }
    }

    @Override
    public void remove(int id) {
        for (Customer customer : customers) {
            if (customer.getId() == id) {
                customers.remove(customer);
            }
        }
    }
}
