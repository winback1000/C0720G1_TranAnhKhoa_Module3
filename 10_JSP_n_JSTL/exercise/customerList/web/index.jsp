<%@ page import="java.util.List" %>
<%@ page import="models.Customer" %><%--
  Created by IntelliJ IDEA.
  User: ttqld
  Date: 11/3/2020
  Time: 3:11 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
  <head>
    <title>models.Customer List</title>
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css" integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">
  </head>
  <body>
<h1>models.Customer List</h1>
<%
  List<Customer> customerList = Customer.getCustomerList();
  request.setAttribute("CustomerList", customerList);
%>
<table class="table table-striped">
  <thead>
  <tr>
    <th scope="col">Name</th>
    <th scope="col">Date Of Birth</th>
    <th scope="col">Address</th>
    <th scope="col">Image</th>
  </tr>
  </thead>
  <tbody>
<c:forEach var="customer" items="${CustomerList}">
  <tr>
      <th scope="row">${customer.getName()}</th>
      <td>${customer.getdOB()}</td>
      <td>${customer.getAddress()}</td>
      <td><img style="width: 100px; height: 100px" src=${customer.getImage()}></td>
  </tr>
</c:forEach>
  </tbody>
</table>
  <script src="https://code.jquery.com/jquery-3.2.1.slim.min.js" integrity="sha384-KJ3o2DKtIkvYIK3UENzmM7KCkRr/rE9/Qpg6aAZGJwFDMVNA/GpGFF93hXpG5KkN" crossorigin="anonymous"></script>
  <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.9/umd/popper.min.js" integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q" crossorigin="anonymous"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js" integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl" crossorigin="anonymous"></script>
  </body>
</html>
