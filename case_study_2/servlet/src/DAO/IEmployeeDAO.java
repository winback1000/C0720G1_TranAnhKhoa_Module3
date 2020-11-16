package DAO;

import models.Customer;
import models.Employee;

import java.util.List;

public interface IEmployeeDAO {
    String jdbcURL = "jdbc:mysql://localhost:3306/casestudy2?useSSL=false";
    String jdbcUsername = "root";
    String jdbcPassword = "Chewingum1";

    List<Employee> getAllEmployee();
    void createEmployee(Employee employee);
    boolean updateEmployee(Employee employee);
    boolean deleteEmployee(int id);
    Employee selectEmployee(int id);
    List<Employee> searchEmployee(String name);
}
