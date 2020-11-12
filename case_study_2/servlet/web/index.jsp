<%--
  Created by IntelliJ IDEA.
  User: ttqld
  Date: 11/10/2020
  Time: 3:06 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<head>
  <title>Log in</title>
  <!-- Required meta tags -->
  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
  <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css"
        integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T" crossorigin="anonymous">
</head>
<style>
  #login {
    background-image: linear-gradient(white,blue,darkmagenta);
    position: absolute;
    left: 40%;
    width: 20%;
    height: 50%;
    border-radius: 6px;
  }
  #login input{
    width: 98%;
    margin: 4px;
  }
</style>
<body style="background-image: url('bg.jpg'); background-repeat: no-repeat; background-size: cover">
<div id="welcome">
  <div class="alert alert-success" role="alert">
    <h4 class="alert-heading">Welcome</h4>
    <p>This is the site for all staffs to manage the customers, contracts, services and the the team members</p>
    <hr>
    <p class="mb-0">You need to log in to continue!</p>
  </div>
</div>
<div id="login" class="form-signin">
  <form class="form-signin" action="/home" method="post">
    <input type="hidden" name="action" value="login">
    <div class="form-group">
      <label for="exampleInputEmail1">Username</label>
      <input type="text" class="form-control" id="exampleInputEmail1" aria-describedby="emailHelp" name="username" value="">
    </div>
    <div class="form-group">
      <label for="exampleInputPassword1">Password</label>
      <input type="password" class="form-control" id="exampleInputPassword1" name="password" value="">
    </div>
    <div class="form-group form-check">
      <input type="checkbox" class="form-check-input" id="exampleCheck1">
      <label class="form-check-label" for="exampleCheck1">Check me out</label>
    </div>
    <button type="submit" class="btn btn-primary">Submit</button>
  </form>
</div>




<script src="https://code.jquery.com/jquery-3.3.1.slim.min.js"
        integrity="sha384-q8i/X+965DzO0rT7abK41JStQIAqVgRVzpbzo5smXKp4YfRvH+8abtTE1Pi6jizo"
        crossorigin="anonymous"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js"
        integrity="sha384-UO2eT0CpHqdSJQ6hJty5KVphtPhzWj9WO1clHTMGa3JDZwrnQq4sF86dIHNDz0W1"
        crossorigin="anonymous"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js"
        integrity="sha384-JjSmVgyd0p3pXB1rRibZUAYoIIy6OrQ6VrjIEaFf/nJGzIxFDsf4x0xIM+B07jRM"
        crossorigin="anonymous"></script>
</body>
</html>
