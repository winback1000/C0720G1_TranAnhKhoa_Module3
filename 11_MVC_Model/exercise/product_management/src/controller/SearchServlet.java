package controller;

import dao.ProductDAO;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

@WebServlet(name = "SearchServlet", urlPatterns = "/search")
public class SearchServlet extends HttpServlet {
    ProductDAO productDAO = new ProductDAO();
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String searchData = request.getParameter("searchData");
        request.setAttribute("productList", productDAO.searchProduct(searchData));
        RequestDispatcher rd = request.getRequestDispatcher("/index.jsp");
        try {
            rd.forward(request,response);
        } catch (ServletException | IOException e) {
            System.out.println(e.getMessage());
        }
    }
}
