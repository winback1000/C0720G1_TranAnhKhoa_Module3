package models;

import DAO.GetEmployeeTypeDAO;

public class Employee {
    private int id;
    private String name;
    private String dateOfBirth;
    private String idCard;
    private double salary;
    private String phoneNumber;
    private String address;
    private int positionId;
    private int educationDegreeId;
    private int divisionId;
    private String userType;
    static GetEmployeeTypeDAO getEmployeeTypeDAO = new GetEmployeeTypeDAO();
    public Employee() {
    }

    public Employee(int id, String name, String dateOfBirth, String idCard, double salary, String phoneNumber, String address, int positionId, int educationDegreeId, int divisionId, String userType) {
        this.id = id;
        this.name = name;
        this.dateOfBirth = dateOfBirth;
        this.idCard = idCard;
        this.salary = salary;
        this.phoneNumber = phoneNumber;
        this.address = address;
        this.positionId = positionId;
        this.educationDegreeId = educationDegreeId;
        this.divisionId = divisionId;
        this.userType = userType;
    }

    public Employee(String name, String dateOfBirth, String idCard, double salary, String phoneNumber, String address, int positionId, int educationDegreeId, int divisionId, String userType) {
        this.name = name;
        this.dateOfBirth = dateOfBirth;
        this.idCard = idCard;
        this.salary = salary;
        this.phoneNumber = phoneNumber;
        this.address = address;
        this.positionId = positionId;
        this.educationDegreeId = educationDegreeId;
        this.divisionId = divisionId;
        this.userType = userType;
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

    public String getDateOfBirth() {
        return dateOfBirth;
    }

    public void setDateOfBirth(String dateOfBirth) {
        this.dateOfBirth = dateOfBirth;
    }

    public String getIdCard() {
        return idCard;
    }

    public void setIdCard(String idCard) {
        this.idCard = idCard;
    }

    public double getSalary() {
        return salary;
    }

    public void setSalary(double salary) {
        this.salary = salary;
    }

    public String getPhoneNumber() {
        return phoneNumber;
    }

    public void setPhoneNumber(String phoneNumber) {
        this.phoneNumber = phoneNumber;
    }

    public String getAddress() {
        return address;
    }

    public void setAddress(String address) {
        this.address = address;
    }

    public int getPositionId() {
        return positionId;
    }
    public String getPositionName() {
        for (Position position: getEmployeeTypeDAO.getPositionList()) {
            if(position.positionId == this.positionId) {
                return position.getPositionName();
            }
        } return null;
    }

    public void setPositionId(int positionId) {
        this.positionId = positionId;
    }

    public int getEducationDegreeId() {
        return educationDegreeId;
    }
    public String getEducationDegreeName() {
        for (EducationDegree educationDegree: getEmployeeTypeDAO.getEducationDegreeList()) {
            if(educationDegree.educationDegreeId == this.educationDegreeId) {
                return educationDegree.getEducationDegreeName();
            }
        } return null;
    }

    public void setEducationDegreeId(int educationDegreeId) {
        this.educationDegreeId = educationDegreeId;
    }

    public int getDivisionId() {
        return divisionId;
    }
    public String getDivisionName() {
        for (Division division: getEmployeeTypeDAO.getDivisionList()) {
            if(division.divisionId == this.divisionId) {
                return division.getDivisionName();
            }
        } return null;
    }
    public void setDivisionId(int divisionId) {
        this.divisionId = divisionId;
    }

    public String getUserType() {
        return userType;
    }

    public void setUserType(String userType) {
        this.userType = userType;
    }
}
