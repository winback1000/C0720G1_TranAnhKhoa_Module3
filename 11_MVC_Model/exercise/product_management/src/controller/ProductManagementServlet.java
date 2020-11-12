package controller;

import dao.ProductDAO;
import models.Product;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.SQLException;
import java.util.List;

@WebServlet(name = "ProductManagementServlet", urlPatterns = "/home")
public class ProductManagementServlet extends HttpServlet {
    private ProductDAO productDAO = new ProductDAO();
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
//        int id = Integer.parseInt(request.getParameter("id"));
//        String name = request.getParameter("name");
//        String manufacturer = request.getParameter("manufacturer");
//        String image = request.getParameter("image");
//        double price = Double.parseDouble(request.getParameter("price"));
//        int stock = Integer.parseInt(request.getParameter("stock"));
//        Product editedProduct = new Product(id, name, manufacturer,image,price,stock);
//        try {
//            System.out.println(productDAO.updateProduct(editedProduct));
//        } catch (SQLException e) {
//            e.printStackTrace();
//        }
//        showAllProduct(request,response);
//    }
        String action = request.getParameter("action");
        switch (action){
            case("edit_modal"):
                editProductFromModal(request,response);
                showAllProduct(request,response);
                break;
        }
    }
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String action = request.getParameter("action");
        if (action == null) {
            action = " ";
        }
        switch (action){
            case ("create"):
                response.sendRedirect("/addProduct.jsp");
                break;
            case ("edit"):
                editProduct(request,response);
                break;
            case ("delete"):
                deleteProduct(request,response);
                showAllProduct(request,response);
                break;
            default:
                showAllProduct(request, response);
                break;
        }
    }

    private void editProductFromModal(HttpServletRequest request, HttpServletResponse response) {
        boolean edited = true;
        int id = Integer.parseInt(request.getParameter("id"));
        String name = request.getParameter("name");
        String manufacturer = request.getParameter("manufacturer");
        String image = request.getParameter("image");
        double price = Double.parseDouble(request.getParameter("price"));
        int stock = Integer.parseInt(request.getParameter("stock"));
        Product editedProduct = new Product(id, name, manufacturer,image,price,stock);
        System.out.println(productDAO.updateProduct(editedProduct));
    }

    private void editProduct(HttpServletRequest request, HttpServletResponse response) {
        int id = Integer.parseInt(request.getParameter("id"));
        Product tempPrd = productDAO.selectProduct(id);
        request.setAttribute("tempPrd", tempPrd);
        RequestDispatcher rd = request.getRequestDispatcher("/edit.jsp");
        try {
            rd.forward(request,response);
        } catch (ServletException | IOException e) {
            System.out.println(e.getMessage());
        }
    }

    private void deleteProduct(HttpServletRequest request, HttpServletResponse response) {
        int id = Integer.parseInt(request.getParameter("id"));
        try {
            System.out.println(productDAO.deleteProduct(id));
        } catch (SQLException e) {
            System.out.println(e.getMessage());
        }
    }

    private void showAllProduct(HttpServletRequest request, HttpServletResponse response) {
        List<Product> productList = productDAO.getAllProduct();
        request.setAttribute("productList", productList);
        RequestDispatcher rd = request.getRequestDispatcher("/index.jsp");
        try {
            rd.forward(request,response);
        } catch (ServletException | IOException e) {
            System.out.println(e.getMessage());
        }
    }
}
