package DAO;

import models.Customer;

import java.sql.*;
import java.util.ArrayList;
import java.util.List;

public class CustomerDAO implements ICustomerDAO {

    private static final String INSERT_CUSTOMER_SQL = "insert into customer (customer_type_id,customer_name,customer_birthday,customer_gender,customer_id_card,customer_phone,customer_email,customer_address) values " +
            " (?,?,?,?,?,?,?,?);";

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
                int id = rs.getInt("customer_id");
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
            preparedStatement.setInt(1, customer.getType());
            preparedStatement.setString(2, customer.getName());
            preparedStatement.setString(3, customer.getDateOfBirth());
            preparedStatement.setString(4, customer.getGender());
            preparedStatement.setString(5,customer.getIdCard());
            preparedStatement.setString(6,customer.getPhoneNumber());
            preparedStatement.setString(7,customer.getEmail());
            preparedStatement.setString(8, customer.getAddress());
            preparedStatement.executeUpdate();
        } catch (SQLException e) {
            System.out.println(e.getMessage());
        } finally {
            closeConnection();
        }
    }

    @Override
    public boolean updateCustomer(Customer customer) {
        boolean updated = false;
        try (Connection connection = getConnection();
        PreparedStatement preparedStatement = connection.prepareStatement(UPDATE_CUSTOMER_SQL))
        {
            preparedStatement.setInt(1, customer.getType());
            preparedStatement.setString(2, customer.getName());
            preparedStatement.setString(3, customer.getDateOfBirth());
            preparedStatement.setString(4, customer.getGender());
            preparedStatement.setString(5,customer.getIdCard());
            preparedStatement.setString(6,customer.getPhoneNumber());
            preparedStatement.setString(7,customer.getEmail());
            preparedStatement.setString(8, customer.getAddress());
            preparedStatement.setInt(9,customer.getId());
            updated = preparedStatement.executeUpdate() == 1;
        } catch (SQLException e) {
            e.printStackTrace();
        } finally {
            closeConnection();
        }
        return updated;
    }

    @Override
    public boolean deleteCustomer(int id) {
        boolean deleted = false;
        try (Connection connection = getConnection();
        PreparedStatement preparedStatement = connection.prepareStatement(DELETE_CUSTOMER_SQL))
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
    public Customer selectCustomer(int id) {
        Customer editCus = null;
        try (Connection connection = getConnection();
        PreparedStatement preparedStatement = connection.prepareStatement(SELECT_CUSTOMER_BY_ID))
        {
            preparedStatement.setInt(1,id);
            ResultSet rs = preparedStatement.executeQuery();
            while (rs.next()){
                int EditId = rs.getInt("customer_id");
                String name = rs.getString("customer_name");
                int type = rs.getInt("customer_type_id");
                String dateOfBirth = rs.getString("customer_birthday");
                String gender = rs.getString("customer_gender");
                String idCard = rs.getString("customer_id_card");
                String phone = rs.getString("customer_phone");
                String email = rs.getString("customer_email");
                String address = rs.getString("customer_address");
                editCus = new Customer(EditId,name,type,dateOfBirth,gender,idCard,phone,email,address);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        } finally {
            closeConnection();
        }
        return editCus;
    }

    @Override
    public List<Customer> searchCustomer(String name) {
        List<Customer> CustomerList = new ArrayList<>();
        try (Connection connection = getConnection();
             PreparedStatement preparedStatement = connection.prepareStatement(SEARCH_CUSTOMER_NAME))
        {
            preparedStatement.setString(1, "%"+name+"%");
            ResultSet rs = preparedStatement.executeQuery();
            while (rs.next()){
                int id = rs.getInt("customer_id");
                String nameCus = rs.getString("customer_name");
                int type = rs.getInt("customer_type_id");
                String dateOfBirth = rs.getString("customer_birthday");
                String gender = rs.getString("customer_gender");
                String idCard = rs.getString("customer_id_card");
                String phone = rs.getString("customer_phone");
                String email = rs.getString("customer_email");
                String address = rs.getString("customer_address");
                CustomerList.add(new Customer(id,nameCus,type,dateOfBirth,gender,idCard,phone,email,address));
            }
        } catch (SQLException e) {
            e.printStackTrace();
        } finally {
            closeConnection();
        }
        return CustomerList;
    }
}
