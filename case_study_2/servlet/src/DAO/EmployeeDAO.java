package DAO;

import models.Customer;
import models.Employee;

import java.sql.*;
import java.util.ArrayList;
import java.util.List;

public class EmployeeDAO implements IEmployeeDAO {
    private static final String INSERT_EMPLOYEE_SQL = "insert into employee (employee_name,employee_birthday,employee_id_card,employee_salary,employee_phone,employee_address,position_id,education_degree_id,division_id,username) values " +
            " (?,?,?,?,?,?,?,?,?,?);";

    private static final String SELECT_EMPLOYEE_BY_ID = "select * from employee where employee_id =?";
    private static final String SELECT_ALL_EMPLOYEE = "SELECT * FROM employee;";
    private static final String DELETE_EMPLOYEE_SQL = "delete from employee where employee_id = ?;";
    private static final String UPDATE_EMPLOYEE_SQL = "update employee set employee_name = ?, employee_birthday = ?, employee_id_card=?,employee_salary=?,employee_phone=?,employee_address=?,position_id=?,education_degree_id=?,division_id=?,username=?  where employee_id = ?;";
    private static final String SEARCH_EMPLOYEE_NAME = "SELECT * FROM employee where employee_name like ?;";

    protected Connection getConnection() {
        Connection connection = null;
        try {
            Class.forName("com.mysql.cj.jdbc.Driver");
            connection = DriverManager.getConnection(jdbcURL, jdbcUsername, jdbcPassword);
        } catch (SQLException | ClassNotFoundException e) {
            e.printStackTrace();
        }
        return connection;
    }
    protected void closeConnection() {
        try {
            getConnection().close();
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }

    @Override
    public List<Employee> getAllEmployee() {
        List<Employee> employeeList = new ArrayList<>();
        try(Connection connection = getConnection();
            PreparedStatement preparedStatement = connection.prepareStatement(SELECT_ALL_EMPLOYEE))
        {
            ResultSet rs = preparedStatement.executeQuery();
            while (rs.next()){
                int id = rs.getInt("employee_id");
                String name = rs.getString("employee_name");
                String dateOfBirth = rs.getString("employee_birthday");
                String idCard = rs.getString("employee_id_card");
                double salary = rs.getDouble("employee_salary");
                String phone = rs.getString("employee_phone");
                String address = rs.getString("employee_address");
                int position = rs.getInt("position_id");
                int educationDegree = rs.getInt("education_degree_id");
                int division = rs.getInt("division_id");
                String userType = rs.getString("username");
                employeeList.add(new Employee(id,name,dateOfBirth,idCard,salary,phone,address,position,educationDegree,division,userType));
            }
        } catch (SQLException e) {
            e.printStackTrace();
        } finally {
            closeConnection();
        }
        return employeeList;
    }

    @Override
    public void createEmployee(Employee employee) {
        try (Connection connection = getConnection();
             PreparedStatement preparedStatement = connection.prepareStatement(INSERT_EMPLOYEE_SQL)) {
            preparedStatement.setString(1, employee.getName());
            preparedStatement.setString(2, employee.getDateOfBirth());
            preparedStatement.setString(3,employee.getIdCard());
            preparedStatement.setDouble(4,employee.getSalary());
            preparedStatement.setString(5,employee.getPhoneNumber());
            preparedStatement.setString(6, employee.getAddress());
            preparedStatement.setInt(7,employee.getPositionId());
            preparedStatement.setInt(8,employee.getEducationDegreeId());
            preparedStatement.setInt(9,employee.getDivisionId());
            preparedStatement.setString(10,employee.getUserType());
            preparedStatement.executeUpdate();
        } catch (SQLException e) {
            System.out.println(e.getMessage());
        } finally {
            closeConnection();
        }
    }

    @Override
    public boolean updateEmployee(Employee employee) {
        boolean updated = false;
        try (Connection connection = getConnection();
             PreparedStatement preparedStatement = connection.prepareStatement(UPDATE_EMPLOYEE_SQL))
        {
            preparedStatement.setString(1, employee.getName());
            preparedStatement.setString(2, employee.getDateOfBirth());
            preparedStatement.setString(3,employee.getIdCard());
            preparedStatement.setDouble(4,employee.getSalary());
            preparedStatement.setString(5,employee.getPhoneNumber());
            preparedStatement.setString(6, employee.getAddress());
            preparedStatement.setInt(7,employee.getPositionId());
            preparedStatement.setInt(8,employee.getEducationDegreeId());
            preparedStatement.setInt(9,employee.getDivisionId());
            preparedStatement.setString(10,employee.getUserType());
            preparedStatement.setInt(11,employee.getId());
            updated = preparedStatement.executeUpdate() == 1;
        } catch (SQLException e) {
            e.printStackTrace();
        } finally {
            closeConnection();
        }
        return updated;
    }

    @Override
    public boolean deleteEmployee(int id) {
        boolean deleted = false;
        try (Connection connection = getConnection();
             PreparedStatement preparedStatement = connection.prepareStatement(DELETE_EMPLOYEE_SQL))
        {
            preparedStatement.setInt(1,id);
            deleted = preparedStatement.executeUpdate() == 1;
        } catch (SQLException e) {
            e.printStackTrace();
        } finally {
            closeConnection();
        }
        return deleted;
    }

    @Override
    public Employee selectEmployee(int idSelected) {
        Employee editEmpl = null;
        try (Connection connection = getConnection();
             PreparedStatement preparedStatement = connection.prepareStatement(SELECT_EMPLOYEE_BY_ID))
        {
            preparedStatement.setInt(1,idSelected);
            ResultSet rs = preparedStatement.executeQuery();
            while (rs.next()){
                int id = rs.getInt("employee_id");
                String name = rs.getString("employee_name");
                String dateOfBirth = rs.getString("employee_birthday");
                String idCard = rs.getString("employee_id_card");
                double salary = rs.getDouble("employee_salary");
                String phone = rs.getString("employee_phone");
                String address = rs.getString("employee_address");
                int position = rs.getInt("position_id");
                int educationDegree = rs.getInt("education_degree_id");
                int division = rs.getInt("division_id");
                String userType = rs.getString("username");
                editEmpl = new Employee(id,name,dateOfBirth,idCard,salary,phone,address,position,educationDegree,division,userType);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        } finally {
            closeConnection();
        }
        return editEmpl;
    }

    @Override
    public List<Employee> searchEmployee(String nameSearch) {
        List<Employee> employeeList = new ArrayList<>();
        try (Connection connection = getConnection();
             PreparedStatement preparedStatement = connection.prepareStatement(SEARCH_EMPLOYEE_NAME))
        {
            preparedStatement.setString(1, "%"+nameSearch+"%");
            ResultSet rs = preparedStatement.executeQuery();
            while (rs.next()){
                int id = rs.getInt("employee_id");
                String name = rs.getString("employee_name");
                String dateOfBirth = rs.getString("employee_birthday");
                String idCard = rs.getString("employee_id_card");
                double salary = rs.getDouble("employee_salary");
                String phone = rs.getString("employee_phone");
                String address = rs.getString("employee_address");
                int position = rs.getInt("position_id");
                int educationDegree = rs.getInt("education_degree_id");
                int division = rs.getInt("division_id");
                String userType = rs.getString("username");
                employeeList.add(new Employee(id,name,dateOfBirth,idCard,salary,phone,address,position,educationDegree,division,userType));
            }
        } catch (SQLException e) {
            e.printStackTrace();
        } finally {
            closeConnection();
        }
        return employeeList;
    }
}
