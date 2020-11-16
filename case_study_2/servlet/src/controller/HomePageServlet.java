package controller;

import BO.CustomerBO;
import BO.EmployeeBO;
import DAO.GetCustomerTypeDAO;
import DAO.GetEmployeeTypeDAO;
import DAO.IGetEmployeeTypeDAO;
import common.Validator;
import models.Customer;
import models.Employee;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

@WebServlet(name = "HomePageServlet", urlPatterns = "/homepage")
public class HomePageServlet extends HttpServlet {

   CustomerBO customerBO = new CustomerBO();
   EmployeeBO employeeBO = new EmployeeBO();
   IGetEmployeeTypeDAO getEmployeeTypeDAO = new GetEmployeeTypeDAO();

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String action = request.getParameter("action");
        if (action==null) {
            action = " ";
        }
        switch (action) {
            case "createCustomer":
                addNewCustomer(request,response);
                break;
            case "createEmployee":
                addNewEmployee(request,response);
                break;
            case "editCustomer":
                editCustomer(request,response);
                break;
        }
    }

    private void editCustomer(HttpServletRequest request, HttpServletResponse response) {
        if (customerBO.editCustomer(request,response) != null) {
            showEditCustomerPageAfterValidate(request,response,customerBO.editCustomer(request,response));
        } else
            showAllCustomer(request,response);
    }

    private void addNewCustomer(HttpServletRequest request, HttpServletResponse response) {
        if (customerBO.createNewCustomer(request, response) != null) {
            showCreateCustomerPageAfterValidate(request,response, customerBO.createNewCustomer(request, response));
        } else showAllCustomer(request,response);
    }

    private void addNewEmployee(HttpServletRequest request, HttpServletResponse response) {
        if (employeeBO.createNewEmployee(request, response) != null) {
            showCreateEmployeePageAfterValidate(request,response, employeeBO.createNewEmployee(request, response));
        } else showAllEmployee(request,response);
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String action = request.getParameter("action");
        if (action==null) {
            action = " ";
        }
        switch (action) {
            case "customer":
                showAllCustomer(request,response);
                break;
            case "employee" :
                showAllEmployee(request,response);
                break;
            case "createNewCustomer":
                showCreateCustomerPage(request,response);
                break;
            case "createNewEmployee":
                showCreateEmployeePage(request,response);
                break;
            case "editCustomer":
                showEditCustomerPage(request,response);
                break;
            case "deleteCustomer":
                deleteCustomer(request,response);
                showAllCustomer(request,response);
                break;
            case "customerNameSearch":
                searchCustomerByName(request,response);
                break;
        }
    }




    private void deleteCustomer(HttpServletRequest request, HttpServletResponse response) {
        int id = Integer.parseInt(request.getParameter("id"));
        customerBO.delete(id);
    }

    private void showEditCustomerPage(HttpServletRequest request, HttpServletResponse response) {
        int editId = Integer.parseInt(request.getParameter("id"));
        GetCustomerTypeDAO getTypeDAO= new GetCustomerTypeDAO();
        Validator validator = new Validator();
        request.setAttribute("validator" , validator);
        request.setAttribute("TypeOfCustomer", getTypeDAO.getArrayList());
        request.setAttribute("currentCustomer",customerBO.getCustomer(editId));
        RequestDispatcher rd = request.getRequestDispatcher("/editCustomer.jsp");
        try {
            rd.forward(request,response);
        } catch (ServletException | IOException e) {
            e.printStackTrace();
        }
    }
    private void showEditCustomerPageAfterValidate(HttpServletRequest request, HttpServletResponse response, Customer wrongCustomer) {
        int editId = Integer.parseInt(request.getParameter("id"));
        GetCustomerTypeDAO getTypeDAO= new GetCustomerTypeDAO();
        Validator validator = new Validator();
        request.setAttribute("validator" , validator);
        request.setAttribute("TypeOfCustomer", getTypeDAO.getArrayList());
        request.setAttribute("currentCustomer",wrongCustomer);
        RequestDispatcher rd = request.getRequestDispatcher("/editCustomer.jsp");
        try {
            rd.forward(request,response);
        } catch (ServletException | IOException e) {
            e.printStackTrace();
        }
    }


    private void showCreateCustomerPage(HttpServletRequest request, HttpServletResponse response) {
        Customer customer = new Customer();
        GetCustomerTypeDAO getTypeDAO= new GetCustomerTypeDAO();
        request.setAttribute("TypeOfCustomer", getTypeDAO.getArrayList());
        request.setAttribute("currentCustomer", customer);
        RequestDispatcher rd = request.getRequestDispatcher("/createCustomer.jsp");
        try {
            rd.forward(request,response);
        } catch (IOException | ServletException e) {
            e.printStackTrace();
        }
    }
    private void showCreateEmployeePage(HttpServletRequest request, HttpServletResponse response) {
        Employee employee = new Employee();
        request.setAttribute("positionList" , getEmployeeTypeDAO.getPositionList());
        request.setAttribute("divisionList" , getEmployeeTypeDAO.getDivisionList());
        request.setAttribute("educationDegreeList" , getEmployeeTypeDAO.getEducationDegreeList());
        request.setAttribute("userTypeList", getEmployeeTypeDAO.getUserTypeList());
        request.setAttribute("currentEmployee" , employee);
        RequestDispatcher rd = request.getRequestDispatcher("/createEmployee.jsp");
        try {
            rd.forward(request,response);
        } catch (IOException | ServletException e) {
            e.printStackTrace();
        }
    }
    private void showCreateEmployeePageAfterValidate(HttpServletRequest request, HttpServletResponse response, Employee wrongEmployee) {
        request.setAttribute("positionList" , getEmployeeTypeDAO.getPositionList());
        request.setAttribute("divisionList" , getEmployeeTypeDAO.getDivisionList());
        request.setAttribute("educationDegreeList" , getEmployeeTypeDAO.getEducationDegreeList());
        request.setAttribute("userTypeList", getEmployeeTypeDAO.getUserTypeList());
        request.setAttribute("currentEmployee" , wrongEmployee);
        RequestDispatcher rd = request.getRequestDispatcher("/createEmployee.jsp");
        try {
            rd.forward(request,response);
        } catch (IOException | ServletException e) {
            e.printStackTrace();
        }
    }
    private void showCreateCustomerPageAfterValidate(HttpServletRequest request, HttpServletResponse response, Customer wrongCustomer) {
        GetCustomerTypeDAO getTypeDAO= new GetCustomerTypeDAO();
        request.setAttribute("TypeOfCustomer", getTypeDAO.getArrayList());
        request.setAttribute("currentCustomer", wrongCustomer);
        request.setAttribute("validator" , new Validator());
        RequestDispatcher rd = request.getRequestDispatcher("/createCustomer.jsp");
        try {
            rd.forward(request,response);
        } catch (IOException | ServletException e) {
            e.printStackTrace();
        }
    }

    private void searchCustomerByName(HttpServletRequest request, HttpServletResponse response) {
        request.setAttribute("customerList",customerBO.searchName(request.getParameter("nameSearch")));
        RequestDispatcher rd = request.getRequestDispatcher("/customer_page.jsp");
        try {
            rd.forward(request,response);
        } catch (ServletException | IOException e) {
            e.printStackTrace();
        }
    }

    private void showAllCustomer(HttpServletRequest request, HttpServletResponse response) {
        request.setAttribute("customerList", customerBO.getCustomerList());
        RequestDispatcher rd = request.getRequestDispatcher("/customer_page.jsp");
        try {
            rd.forward(request,response);
        } catch (ServletException | IOException e) {
            e.printStackTrace();
        }
    }
    private void showAllEmployee(HttpServletRequest request, HttpServletResponse response) {
        request.setAttribute("employeeList" , employeeBO.getEmployeeList());
        RequestDispatcher rd = request.getRequestDispatcher("/employee_page.jsp");
        try {
            rd.forward(request,response);
        } catch (ServletException | IOException e) {
            e.printStackTrace();
        }
    }
}
