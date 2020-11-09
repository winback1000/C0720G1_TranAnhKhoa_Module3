package controller;

import dao.ProductDAO;
import models.Product;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.sql.SQLException;

@WebServlet(name = "AddProductServlet", urlPatterns = "/add")
public class AddProductServlet extends HttpServlet {
    private ProductDAO productDAO = new ProductDAO();
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String name = request.getParameter("name");
        String manufacturer = request.getParameter("manufacturer");
        String image = request.getParameter("image");
        double price = Double.parseDouble(request.getParameter("price"));
        int stock = Integer.parseInt(request.getParameter("stock"));
        Product newPrd = new Product(name, manufacturer, image, price, stock);
        try {
            productDAO.insertProduct(newPrd);
            response.sendRedirect("/home");
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }
}
