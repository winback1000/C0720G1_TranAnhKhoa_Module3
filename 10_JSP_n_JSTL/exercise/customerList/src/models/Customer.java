package models;

import java.util.ArrayList;
import java.util.List;

public class Customer {
    public static List<Customer> customerList = new ArrayList<>();
    private String name;
    private String dOB;
    private String address;
    private String image;
    static {
        new Customer("Facebook","22-02-2020", "USA", "/image/fbLogo.png");
        new Customer("Facebook1","22-03-2020", "USA", "/image/fblogo_revert.png");
        new Customer("Facebook2","22-01-2020", "USA", "/image/fbLogo.png");
        new Customer("Facebook3","22-04-2020", "USA", "/image/fblogo_revert.png");
    }

    public Customer(String name, String dOB, String address, String image) {
        this.name = name;
        this.dOB = dOB;
        this.address = address;
        this.image = image;
        customerList.add(this);
    }

    public static List<Customer> getCustomerList() {
        return customerList;
    }

    public static void setCustomerList(List<Customer> customerList) {
        Customer.customerList = customerList;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getdOB() {
        return dOB;
    }

    public void setdOB(String dOB) {
        this.dOB = dOB;
    }

    public String getAddress() {
        return address;
    }

    public void setAddress(String address) {
        this.address = address;
    }

    public String getImage() {
        return image;
    }

    public void setImage(String image) {
        this.image = image;
    }

    @Override
    public String toString() {
        return name + ',' + dOB + ',' + address + ',' + image + '\n';
    }

}
