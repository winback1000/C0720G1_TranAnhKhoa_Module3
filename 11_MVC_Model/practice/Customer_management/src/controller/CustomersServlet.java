package controller;

import models.Customer;
import service.CustomerService;
import service.CustomerServiceImpl;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.List;

@WebServlet(name = "CustomersServlet", urlPatterns = "/home")
public class CustomersServlet extends HttpServlet {
    private CustomerService customerService = new CustomerServiceImpl();
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String action = request.getParameter("action");
        switch (action) {
            case "save":
                save(request, response);
                break;
            case "cancel":
                showListCustomer(request, response);
                break;
        }

    }

    private void save(HttpServletRequest request, HttpServletResponse response) {
        int id = Integer.parseInt(request.getParameter("id"));
        String newName = request.getParameter("name");
        String newAddress = request.getParameter("address");
        String newEmail = request.getParameter("email");
        Customer updatedCustomer = new Customer(newName, newEmail,newAddress);
        customerService.update(id, updatedCustomer);
        showListCustomer(request,response);
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String action = request.getParameter("action");
        if (action == null) {
            action = " ";
        }
        switch (action) {
            case "create":
                createCustomer(request, response);
                break;
            case "edit":
                editCustomer(request,response);
                break;
            case "delete":
                deleteCustomer(request,response);
                break;
            default:
                showListCustomer(request, response);
        }

    }

    private void createCustomer(HttpServletRequest request, HttpServletResponse response) {
        Customer newCustomer = new Customer();
        CustomerServiceImpl.customers.add(newCustomer);
        request.setAttribute("customer", newCustomer);
        RequestDispatcher rd = request.getRequestDispatcher("/edit.jsp");
        try {
            rd.forward(request,response);
        } catch (ServletException e) {
            e.printStackTrace();
        } catch (IOException e) {
            e.printStackTrace();
        }
    }

    private void deleteCustomer(HttpServletRequest request, HttpServletResponse response) {
        int id = Integer.parseInt(request.getParameter("id"));
        customerService.remove(id);
        try {
            response.sendRedirect("/home");
        } catch (IOException e) {
            e.printStackTrace();
        }
    }

    private void editCustomer(HttpServletRequest request, HttpServletResponse response) {
        int id = Integer.parseInt(request.getParameter("id"));
        request.setAttribute("customer",customerService.findAll().get(id-1));
        RequestDispatcher rd = request.getRequestDispatcher("/edit.jsp");
        try {
            rd.forward(request,response);
        } catch (ServletException e) {
            e.printStackTrace();
        } catch (IOException e) {
            e.printStackTrace();
        }
    }

    private void showListCustomer(HttpServletRequest request, HttpServletResponse response) {
        List<Customer> customerList = customerService.findAll();
        request.setAttribute("customerList" , customerList);
        RequestDispatcher rd = request.getRequestDispatcher("/index.jsp");
        try {
            rd.forward(request,response);
        } catch (ServletException e) {
            e.printStackTrace();
        } catch (IOException e) {
            e.printStackTrace();
        }
    }
}
