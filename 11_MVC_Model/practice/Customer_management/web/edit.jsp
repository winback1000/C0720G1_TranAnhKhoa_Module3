<%--
  Created by IntelliJ IDEA.
  User: ttqld
  Date: 11/5/2020
  Time: 9:05 AM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <title>Edit Customer</title>
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css" integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">
</head>
<body>
<form action="/home" method="post">
    <div class="form-group col-md-6">
        <label for="inputId">Id</label>
        <input type="text" class="form-control" id="inputId" value = "${customer.id}" readonly name ="id" >
    </div>
    <div class="form-group col-md-6">
        <label for="inputName">Name</label>
        <input type="text" class="form-control" id="inputName" placeholder="${customer.name}" name ="name" required>
    </div>
    <div class="form-group col-md-6">
        <label for="inputAddress">Address </label>
        <input type="text" class="form-control" id="inputAddress" placeholder="${customer.address}" name ="address" required>
    </div>
    <div class="form-group col-md-6">
        <label for="email">Email</label>
        <input type="email" class="form-control" id="email" placeholder="${customer.email}" name="email" required>
    </div>
    <button type="submit" name ="action" class="btn btn-primary" value="save">Save</button>
    <button type="submit" name ="action" class="btn btn-primary" value="cancel">Cancel</button>
</form>


<script src="https://code.jquery.com/jquery-3.2.1.slim.min.js" integrity="sha384-KJ3o2DKtIkvYIK3UENzmM7KCkRr/rE9/Qpg6aAZGJwFDMVNA/GpGFF93hXpG5KkN" crossorigin="anonymous"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.9/umd/popper.min.js" integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q" crossorigin="anonymous"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js" integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl" crossorigin="anonymous"></script>
</body>
</html>
