<%--
  Created by IntelliJ IDEA.
  User: ttqld
  Date: 11/3/2020
  Time: 1:16 AM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
  <head>

    <title>Product Discount Calculator</title>
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/css/bootstrap.min.css" integrity="sha384-Vkoo8x4CGsO3+Hhxv8T/Q5PaXtkKtu6ug5TOeNV6gBiFeWPGFN9MuhOf23Q9Ifjh" crossorigin="anonymous">
    <script src="https://code.jquery.com/jquery-3.4.1.slim.min.js" integrity="sha384-J6qa4849blE2+poT4WnyKhv5vZF5SrPo0iEjwBvKU7imGFAV0wwj1yYfoRSJoZ+n" crossorigin="anonymous"></script>
    <script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.0/dist/umd/popper.min.js" integrity="sha384-Q6E9RHvbIyZFJoft+2mJbHaEWldlvI9IOYy5n3zV9zzTtmI3UksdQRVvoxMfooAo" crossorigin="anonymous"></script>
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/js/bootstrap.min.js" integrity="sha384-wfSDF2E50Y2D1uUdj0O3uMBJnjuUD4Ih7YwaYd1iqfktj0Uod8GCExl3Og8ifwB6" crossorigin="anonymous"></script>
  </head>

  <body>
  <form method="post" action ="/count">
    <table class="table table-striped table-inverse table-responsive" style="table-border-color-dark: blue">
      <thead class="thead-inverse">
      <tr>
        <th>Product Description</th>
        <th>List Price</th>
        <th>Discount Percent</th>
        <th>Discount Amount</th>
        <th>Discount Price</th>
      </tr>
      </thead>
      <tbody>
      <tr>
        <td scope="row"><input type="text" name="description"></td>
        <td><input type="text" name="price"></td>
        <td><input type="text" name="discountPercent"></td>
        <td><input type="text" name="discountAmount" readonly value=""></td>
        <td><input type="text" name="discountPrice" readonly value=""></td>
      </tr>
      </tbody>
    </table>
    <button type="submit" name="count" id="count" class="btn btn-primary btn-lg-col-1 btn-block" style="width: 100px; float: left"><h5>Count</h5></button>
  </form>
  </body>
</html>
