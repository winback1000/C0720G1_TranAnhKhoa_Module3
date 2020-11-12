package models;

import DAO.CustomerDAO;
import DAO.GetCustomerTypeDAO;
import DAO.IGetTypeDAO;

import java.text.DecimalFormat;
import java.text.NumberFormat;

public class Customer extends Human {

    static int customerNumber = 0;
    private String id ;
    private int type;
    NumberFormat nf = new DecimalFormat("0000");

    public Customer(String name,int type,  String dateOfBirth, String gender, String idCard, String phoneNumber, String email, String address) {
        super(name, dateOfBirth, gender, idCard, phoneNumber, email, address);
        customerNumber++;
        this.id ="KH-" + nf.format(customerNumber);
        this.type = type;
    }

    public Customer(String id, String name,int type, String dateOfBirth, String gender, String idCard, String phoneNumber, String email, String address) {
        super(name, dateOfBirth, gender, idCard, phoneNumber, email, address);
        this.id = id;
        this.type = type;
        customerNumber++;
    }

    public String getId() {
        return id;
    }

    public void setId(String id) {
        this.id = id;
    }
    public int getType () {
        return this.type;
    }
    public String getTypeName() {
        IGetTypeDAO getTypeDAO= new GetCustomerTypeDAO();
        return getTypeDAO.getList().get(this.type);
    }

    public void setType(int type) {
        this.type = type;
    }

    @Override
    public String toString() {
        return "Customer{" +
                "id='" + id + '\'' +
                ", type=" + getType() +
                ", name='" + name + '\'' +
                ", dateOfBirth='" + dateOfBirth + '\'' +
                ", gender='" + gender + '\'' +
                ", IdCard='" + IdCard + '\'' +
                ", phoneNumber='" + phoneNumber + '\'' +
                ", email='" + email + '\'' +
                ", address='" + address + '\'' +
                '}';
    }

    public static void main(String[] args) {
        Customer test = new Customer("String name",1,  "2000-02-02","Male", "String idCard", "String phoneNumber", "String email", "String address");
        System.out.println(test);
        CustomerDAO customerDAO = new CustomerDAO();
        customerDAO.createCustomer(test);
        System.out.println(customerDAO.getAllCustomer());
    }
}
