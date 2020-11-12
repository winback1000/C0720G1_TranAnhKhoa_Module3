package DAO;

import java.sql.*;
import java.util.Map;
import java.util.TreeMap;

public class GetCustomerTypeDAO implements IGetTypeDAO {
    private String jdbcURL = "jdbc:mysql://localhost:3306/casestudy2?useSSL=false";
    private String jdbcUsername = "root";
    private String jdbcPassword = "Chewingum1";

    private static final String INSERT_CUSTOMER_TYPE_SQL = "insert into customer_type (customer_type_name) values " +
            " (?);";

    private static final String SELECT_CUSTOMER_TYPE_BY_ID = "select * from customer_type where customer_type_id =?";
    private static final String SELECT_ALL_CUSTOMER_TYPE = "SELECT * FROM customer_type;";
    private static final String DELETE_CUSTOMER_TYPE_SQL = "delete from customer_type where customer_type_id = ?;";
    private static final String UPDATE_CUSTOMER_TYPE_SQL = "update customer_type set customer_type_name = ? where customer_type_id = ?;";
    private static final String SEARCH_PRODUCT_NAME = "SELECT * FROM customer_type where customer_type_name like ?;";

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
    public TreeMap<Integer, String> getList() {
        TreeMap<Integer,String> customerTypeList = new TreeMap<>();
            try (Connection connection = getConnection();
                 PreparedStatement preparedStatement = connection.prepareStatement(SELECT_ALL_CUSTOMER_TYPE))
            {
                ResultSet rs = preparedStatement.executeQuery();
                while (rs.next()) {
                    int key = rs.getInt("customer_type_id");
                    String name = rs.getString("customer_type_name");
                    customerTypeList.put(key,name);
                }
            } catch (SQLException ex) {
                ex.printStackTrace();
            } finally {
            closeConnection();
        }
        return customerTypeList;
    }

    @Override
    public void insertType(String name) {

    }

    @Override
    public String selectType(int key) {
        return null;
    }

    @Override
    public void deleteType(int key) {

    }

    @Override
    public boolean updateType(int key, String name) {
        return false;
    }

    @Override
    public TreeMap<Integer, String> searchType(String name) {
        return null;
    }
}
