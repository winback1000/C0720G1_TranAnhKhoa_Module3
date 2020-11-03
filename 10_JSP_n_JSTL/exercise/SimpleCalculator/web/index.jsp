<%@ page import="models.Calculator" %><%--
  Created by IntelliJ IDEA.
  User: ttqld
  Date: 11/3/2020
  Time: 10:43 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
  <head>
    <title>Simple Calculator</title>
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css" integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">
  </head>
  <body>
<%--  <%--%>
<%--    Calculator calculator = new Calculator();--%>
<%--    float result = 0;--%>
<%--  %>--%>
  <form action="/Calculate" method="post">
    <table class="table table-striped table-inverse table-responsive">
      <thead class="thead-inverse">
      <tr>
        <th>First parameter</th>
        <th>Second parameter</th>
      </tr>
      </thead>
      <tbody>
      <tr>
        <td scope="row"><input type="text" name = "firstParameter"></td>
        <td><input type="text" name = "secondParameter"></td>
      </tr>
      </tbody>
    </table>
    <button type="submit" name="operand" value="+" class="btn btn-primary">+</button>
    <button type="submit" name="operand" value="-" class="btn btn-primary">-</button>
    <button type="submit" name="operand" value="*" class="btn btn-primary">*</button>
    <button type="submit" name="operand" value="/" class="btn btn-primary">/</button>
  </form>

<%--  <button type="button" onclick="<% result = calculator.plus(Float.parseFloat(request.getParameter("firstParameter")),Float.parseFloat(request.getParameter("secondParameter"))); %>" class="btn btn-primary">+</button>--%>
<%--  <button type="button" onclick="<% result = calculator.minus(Float.parseFloat(request.getParameter("firstParameter")),Float.parseFloat(request.getParameter("secondParameter"))); %>" class="btn btn-primary">-</button>--%>
<%--  <button type="button" onclick="<% result = calculator.multiple(Float.parseFloat(request.getParameter("firstParameter")),Float.parseFloat(request.getParameter("secondParameter"))); %>" class="btn btn-primary">*</button>--%>
<%--  <button type="button" onclick="<% result = calculator.division(Float.parseFloat(request.getParameter("firstParameter")),Float.parseFloat(request.getParameter("secondParameter"))); %>" class="btn btn-primary">/</button>--%>
<%--  <%request.setAttribute("result",result);  %>--%>
<%--  <h3>Result</h3>--%>
<%--  <input type="text" readonly value="${result}">--%>

  <script src="https://code.jquery.com/jquery-3.2.1.slim.min.js" integrity="sha384-KJ3o2DKtIkvYIK3UENzmM7KCkRr/rE9/Qpg6aAZGJwFDMVNA/GpGFF93hXpG5KkN" crossorigin="anonymous"></script>
  <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.9/umd/popper.min.js" integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q" crossorigin="anonymous"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js" integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl" crossorigin="anonymous"></script>
  </body>
</html>
