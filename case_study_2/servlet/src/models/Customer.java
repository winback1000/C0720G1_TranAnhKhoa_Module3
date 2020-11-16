package models;

import DAO.CustomerDAO;
import DAO.GetCustomerTypeDAO;
import DAO.IGetTypeDAO;

import java.text.DecimalFormat;
import java.text.NumberFormat;

public class Customer extends Human {

    private int id ;
    private int type;
    NumberFormat nf = new DecimalFormat("0000");

    public Customer(String name,int type,  String dateOfBirth, String gender, String idCard, String phoneNumber, String email, String address) {
        super(name, dateOfBirth, gender, idCard, phoneNumber, email, address);
        this.type = type;
    }

    public Customer(int id, String name,int type, String dateOfBirth, String gender, String idCard, String phoneNumber, String email, String address) {
        super(name, dateOfBirth, gender, idCard, phoneNumber, email, address);
        this.id = id;
        this.type = type;
    }

    public Customer() {
    }

    public int getId() {
        return id;
    }
    public String getCustomerCode(){
        return "KH-" + nf.format(this.id);
    }

    public void setId(int id) {
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

}
