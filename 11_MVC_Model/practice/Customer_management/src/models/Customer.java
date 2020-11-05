package models;

public class Customer {
    private int id;
    private String name;
    private String address;
    private String email;
    static int cusNum = 0;

    public Customer(String name, String email, String address) {
        cusNum++;
        this.id = cusNum;
        this.name = name;
        this.address = address;
        this.email = email;
    }

    public Customer() {
        cusNum++;
        this.id = cusNum;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getAddress() {
        return address;
    }

    public void setAddress(String address) {
        this.address = address;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }
}
