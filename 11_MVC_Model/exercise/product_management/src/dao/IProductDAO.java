package dao;

import models.Product;

import java.sql.SQLException;
import java.util.List;

public interface IProductDAO {
    public List<Product> getAllProduct();
    public void insertProduct(Product prd) throws SQLException;
    public Product selectProduct(int id);
    public boolean deleteProduct(int id) throws SQLException;
    public boolean updateProduct(Product prd) throws SQLException;

}
