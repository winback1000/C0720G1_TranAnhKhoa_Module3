package dao;

import models.Product;

import java.sql.*;
import java.util.ArrayList;
import java.util.List;

public class ProductDAO implements IProductDAO {
    private String jdbcURL = "jdbc:mysql://localhost:3306/product_manager?useSSL=false";
    private String jdbcUsername = "root";
    private String jdbcPassword = "Chewingum1";

    private static final String INSERT_PRODUCT_SQL = "insert into product(name, manufacturer, image, price, stock) values  " +
            " (?, ?, ?, ?, ?);";

    private static final String SELECT_PRODUCT_BY_ID = "select * from product where id =?";
    private static final String SELECT_ALL_PRODUCT = "SELECT * FROM product_manager.product;";
    private static final String DELETE_PRODUCT_SQL = "delete from product where id = ?;";
    private static final String UPDATE_PRODUCT_SQL = "update product_manager.product set `name` = ?,manufacturer= ?, image =? , price = ?, stock = ? where id = ?;";
    private static final String SEARCH_PRODUCT_NAME = "SELECT * FROM product where name like ?;";
    public ProductDAO() {
    }

    protected Connection getConnection() {
        Connection connection = null;
        try {
            Class.forName("com.mysql.jdbc.Driver");
            connection = DriverManager.getConnection(jdbcURL, jdbcUsername, jdbcPassword);
        } catch (SQLException | ClassNotFoundException e) {
            // TODO Auto-generated catch block
            e.printStackTrace();
        }
        return connection;
    }

    @Override
    public List<Product> getAllProduct() {
        List<Product> products = new ArrayList<>();
        try (Connection connection = getConnection();
             PreparedStatement preparedStatement = connection.prepareStatement(SELECT_ALL_PRODUCT))
        {
            ResultSet rs = preparedStatement.executeQuery();
            while (rs.next()) {
                int id = rs.getInt("id");
                String name = rs.getString("name");
                String manufacturer = rs.getString("manufacturer");
                String image = rs.getString("image");
                double price = rs.getDouble("price");
                int stock = rs.getInt("stock");
                products.add(new Product(id, name, manufacturer, image, price, stock));
            }
        } catch (SQLException ex) {
            ex.printStackTrace();
        } finally {
            try {
                getConnection().close();
            } catch (SQLException e) {
                e.printStackTrace();
            }
        }
        return products;
    }

    @Override
    public void insertProduct(Product prd) throws SQLException {
        System.out.println(INSERT_PRODUCT_SQL);
        // try-with-resource statement will auto close the connection.
        Savepoint sp = null;
        try (Connection connection = getConnection();
             PreparedStatement preparedStatement = connection.prepareStatement(INSERT_PRODUCT_SQL)) {
            connection.setAutoCommit(false);
            preparedStatement.setString(1, prd.getName());
            preparedStatement.setString(2, prd.getManufacturer());
            preparedStatement.setString(3, prd.getImage());
            preparedStatement.setDouble(4, prd.getPrice());
            preparedStatement.setInt(5, prd.getStock());
            sp = connection.setSavepoint();
            System.out.println(preparedStatement);
            connection.commit();
            preparedStatement.executeUpdate();
        } catch (SQLException e) {
            System.out.println(e.getMessage());
            getConnection().rollback(sp);
        } finally {
            getConnection().close();
        }
    }

    @Override
    public Product selectProduct(int id) {
        Product prd = null;
        try (
                Connection connection = getConnection();
                PreparedStatement preparedStatement = connection.prepareStatement(SELECT_PRODUCT_BY_ID)) {
            preparedStatement.setInt(1, id);
            ResultSet rs = preparedStatement.executeQuery();
            while (rs.next()) {
                String name = rs.getString("name");
                String manufacturer = rs.getString("manufacturer");
                String image = rs.getString("image");
                double price = rs.getDouble("price");
                int stock = rs.getInt("stock");
                prd = new Product(id, name, manufacturer, image, price, stock);
            }
        } catch (SQLException e) {
            System.out.println(e.getMessage());
        } finally {
            try {
                getConnection().close();
            } catch (SQLException e) {
                System.out.println(e.getMessage());
            }
        }
        return prd;
    }

    @Override
    public boolean deleteProduct(int id) throws SQLException {
        boolean rowDeleted;
        try (Connection connection = getConnection(); PreparedStatement statement = connection.prepareStatement(DELETE_PRODUCT_SQL)) {
            statement.setInt(1, id);
            rowDeleted = statement.executeUpdate() > 0;
        }
        return rowDeleted;
    }

    @Override
    public boolean updateProduct(Product prd) throws SQLException {
        boolean rowUpdated;
        try (Connection connection = getConnection();
             PreparedStatement preparedStatement = connection.prepareStatement(UPDATE_PRODUCT_SQL))
        {
            preparedStatement.setString(1, prd.getName());
            preparedStatement.setString(2, prd.getManufacturer());
            preparedStatement.setString(3, prd.getImage());
            preparedStatement.setDouble(4, prd.getPrice());
            preparedStatement.setInt(5, prd.getStock());
            preparedStatement.setInt(6, prd.getId());
            System.out.println(UPDATE_PRODUCT_SQL);
            rowUpdated = preparedStatement.executeUpdate() > 0;
        }
        return rowUpdated;
    }

    @Override
    public List<Product> searchProduct(String searchData) {
        List<Product> products = new ArrayList<>();
        try (Connection connection = getConnection();
             PreparedStatement preparedStatement = connection.prepareStatement(SEARCH_PRODUCT_NAME)) {
            preparedStatement.setString(1, "%"+ searchData +"%");
            ResultSet rs = preparedStatement.executeQuery();
            while (rs.next()) {
                int id = rs.getInt("id");
                String name = rs.getString("name");
                String manufacturer = rs.getString("manufacturer");
                String image = rs.getString("image");
                double price = rs.getDouble("price");
                int stock = rs.getInt("stock");
                products.add(new Product(id, name, manufacturer, image, price, stock));
                System.out.println(products);
            }
        } catch (SQLException e) {
            System.out.println(e.getMessage());
        } finally {
            try {
                getConnection().close();
            } catch (SQLException e) {
                e.printStackTrace();
            }
        }
        return products;
    }
}
