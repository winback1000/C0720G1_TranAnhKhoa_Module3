package BO;

import DAO.EmployeeDAO;
import common.Validator;
import models.Customer;
import models.Employee;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.util.List;

public class EmployeeBO {
    EmployeeDAO employeeDAO = new EmployeeDAO();

    public EmployeeBO() {
    }
    public List<Employee> getEmployeeList() {
        return employeeDAO.getAllEmployee();
    }
    public Employee getEmployee(int editId) {
        return employeeDAO.selectEmployee(editId);
    }
    public Employee createNewEmployee(HttpServletRequest request, HttpServletResponse response){
        String name = request.getParameter("inputEmployeeName");
        String dateOfBirth = request.getParameter("inputEmployeeDateOfBirth");
        String idCard = request.getParameter("inputEmployeeIdCard");
        double salary = Double.parseDouble(request.getParameter("inputEmployeeSalary"));
        String phoneNumber = request.getParameter("inputEmployeePhoneNumber");
        String address = request.getParameter("inputEmployeeAddress");
        int position = Integer.parseInt(request.getParameter("inputEmployeePositionId"));
        int educationDegree = Integer.parseInt(request.getParameter("inputEmployeeEducationDegreeId"));
        int division = Integer.parseInt(request.getParameter("inputEmployeeDivisionId"));
        String userType = request.getParameter("inputEmployeeUserType");
        Employee employee = new Employee(name,dateOfBirth,idCard,salary,phoneNumber,address,position,educationDegree,division,userType);
        if(validateEmployee(employee)) {
            employeeDAO.createEmployee(employee);
            return null;
        } else
            return employee;
    }
    public Employee editEmployee(HttpServletRequest request, HttpServletResponse response) {
        int id = Integer.parseInt(request.getParameter("id"));
        String name = request.getParameter("inputEmployeeName");
        String dateOfBirth = request.getParameter("inputEmployeeDateOfBirth");
        String idCard = request.getParameter("inputEmployeeIdCard");
        double salary = Double.parseDouble(request.getParameter("inputEmployeeSalary"));
        String phoneNumber = request.getParameter("inputEmployeePhoneNumber");
        String address = request.getParameter("inputEmployeeAddress");
        int position = Integer.parseInt(request.getParameter("inputEmployeePositionId"));
        int educationDegree = Integer.parseInt(request.getParameter("inputEmployeeEducationDegreeId"));
        int division = Integer.parseInt(request.getParameter("inputEmployeeDivisionId"));
        String userType = request.getParameter("inputEmployeeUserType");
        Employee employee = new Employee(id,name,dateOfBirth,idCard,salary,phoneNumber,address,position,educationDegree,division,userType);
        if(validateEmployee(employee)) {
            employeeDAO.createEmployee(employee);
            return null;
        } else
            return employee;
    }
    public boolean validateEmployee(Employee employee){
        Validator validator = new Validator();
        return  (validator.isValidDateOfBirth(employee.getDateOfBirth())&&validator.isValidIdCard(employee.getIdCard())&&validator.isValidPhoneNumber(employee.getPhoneNumber()));
    }
    public void delete(int id) {
        employeeDAO.deleteEmployee(id);
    }
    public List<Employee> searchName(String employeeNameSearch) {
        return employeeDAO.searchEmployee(employeeNameSearch);
    }
}
