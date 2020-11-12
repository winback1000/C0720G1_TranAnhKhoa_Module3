package DAO;

import models.Customer;

import java.sql.*;
import java.util.ArrayList;
import java.util.List;

public class CustomerDAO implements ICustomerDAO {
    private String jdbcURL = "jdbc:mysql://localhost:3306/casestudy2?useSSL=false";
    private String jdbcUsername = "root";
    private String jdbcPassword = "Chewingum1";

    private static final String INSERT_CUSTOMER_SQL = "insert into customer (customer_id,customer_type_id,customer_name,customer_birthday,customer_gender,customer_id_card,customer_phone,customer_email,customer_address) values " +
            " (?,?,?,?,?,?,?,?,?);";

    private static final String SELECT_CUSTOMER_BY_ID = "select * from customer where customer_id =?";
    private static final String SELECT_ALL_CUSTOMER = "SELECT * FROM customer;";
    private static final String DELETE_CUSTOMER_SQL = "delete from customer where customer_id = ?;";
    private static final String UPDATE_CUSTOMER_SQL = "update customer set customer_type_id = ?, customer_name = ?, customer_birthday=?,customer_gender=?,customer_id_card=?,customer_phone=?,customer_email=?,customer_address=?  where customer_id = ?;";
    private static final String SEARCH_CUSTOMER_NAME = "SELECT * FROM customer where customer_name like ?;";

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
    public List<Customer> getAllCustomer() {
        List<Customer> CustomerList = new ArrayList<>();
        try (Connection connection = getConnection();
             PreparedStatement preparedStatement = connection.prepareStatement(SELECT_ALL_CUSTOMER))
        {
            ResultSet rs = preparedStatement.executeQuery();
            while (rs.next()){
                String id = rs.getString("customer_id");
                String name = rs.getString("customer_name");
                int type = rs.getInt("customer_type_id");
                String dateOfBirth = rs.getString("customer_birthday");
                String gender = rs.getString("customer_gender");
                String idCard = rs.getString("customer_id_card");
                String phone = rs.getString("customer_phone");
                String email = rs.getString("customer_email");
                String address = rs.getString("customer_address");
            CustomerList.add(new Customer(id,name,type,dateOfBirth,gender,idCard,phone,email,address));
            }
        } catch (SQLException e) {
            e.printStackTrace();
        } finally {
            closeConnection();
        }
        return CustomerList;
    }

    @Override
    public void createCustomer(Customer customer) {
        try (Connection connection = getConnection();
             PreparedStatement preparedStatement = connection.prepareStatement(INSERT_CUSTOMER_SQL)) {
            preparedStatement.setString(1, customer.getId());
            preparedStatement.setInt(2, customer.getType());
            preparedStatement.setString(3, customer.getName());
            preparedStatement.setString(4, customer.getDateOfBirth());
            preparedStatement.setString(5, customer.getGender());
            preparedStatement.setString(6,customer.getIdCard());
            preparedStatement.setString(7,customer.getPhoneNumber());
            preparedStatement.setString(8,customer.getEmail());
            preparedStatement.setString(9, customer.getAddress());
            preparedStatement.executeUpdate();
        } catch (SQLException e) {
            System.out.println(e.getMessage());
        } finally {
            closeConnection();
        }
    }

    @Override
    public boolean updateCustomer(Customer customer) {
        return false;
    }

    @Override
    public boolean deleteCustomer(String id) {
        return false;
    }

    @Override
    public Customer selectCustomer(String id) {
        return null;
    }

    @Override
    public List<Customer> searchCustomer(String name) {
        return null;
    }
}
