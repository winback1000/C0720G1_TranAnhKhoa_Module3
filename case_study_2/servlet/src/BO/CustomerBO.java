package BO;

import DAO.CustomerDAO;
import common.Validator;
import models.Customer;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.util.List;

public class CustomerBO {
    CustomerDAO customerDAO = new CustomerDAO();
    public CustomerBO() {
    }
    public List<Customer> getCustomerList() {
        return customerDAO.getAllCustomer();
    }

    public Customer createNewCustomer(HttpServletRequest request, HttpServletResponse response) {
        String name = request.getParameter("inputCustomerName");
        int type = Integer.parseInt(request.getParameter("InputCustomerType"));
        String dateOfBirth = request.getParameter("inputCustomerDateOfBirth");
        String gender = request.getParameter("inputCustomerGender");
        String idCard = request.getParameter("inputCustomerIdCard");
        String phoneNumber = request.getParameter("inputCustomerPhoneNumber");
        String email = request.getParameter("inputCustomerEmail");
        String address = request.getParameter("inputCustomerAddress");
        Customer customer = new Customer(name,type,dateOfBirth,gender,idCard,phoneNumber,email,address);
        if(validateCustomer(customer)) {
            customerDAO.createCustomer(customer);
            return null;
        } else
            return customer;
    }

    public Customer getCustomer(int editId) {
        return customerDAO.selectCustomer(editId);
    }

    public Customer editCustomer(HttpServletRequest request, HttpServletResponse response) {
        int id = Integer.parseInt(request.getParameter("id"));
        String name = request.getParameter("inputCustomerName");
        int type = Integer.parseInt(request.getParameter("InputCustomerType"));
        String dateOfBirth = request.getParameter("inputCustomerDateOfBirth");
        String gender = request.getParameter("inputCustomerGender");
        String idCard = request.getParameter("inputCustomerIdCard");
        String phoneNumber = request.getParameter("inputCustomerPhoneNumber");
        String email = request.getParameter("inputCustomerEmail");
        String address = request.getParameter("inputCustomerAddress");
        Customer customer = new Customer(id,name,type,dateOfBirth,gender,idCard,phoneNumber,email,address);
        if (validateCustomer(customer)) {
            customerDAO.updateCustomer(customer);
            return null;
        } else
            return customer;
    }

    public void delete(int id) {
        customerDAO.deleteCustomer(id);
    }
    public boolean validateCustomer(Customer customer){
        Validator validator = new Validator();
        return  (validator.isValidDateOfBirth(customer.getDateOfBirth())&&validator.isValidEmail(customer.getEmail())&&validator.isValidIdCard(customer.getIdCard())&&validator.isValidPhoneNumber(customer.getPhoneNumber()));
    }

    public List<Customer> searchName(String customerNameSearch) {
        return customerDAO.searchCustomer(customerNameSearch);
    }
}
