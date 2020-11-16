<%--
  Created by IntelliJ IDEA.
  User: ttqld
  Date: 11/12/2020
  Time: 3:07 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <title>Edit customer</title>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">

    <!-- Bootstrap CSS -->
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css"
          integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T" crossorigin="anonymous">
    <style>
        body{
            background-image: url("bg.jpg");
            background-size: 100%;
        }
        #window-header {
            height: 200px;
            position: fixed;
            z-index: 9;
        }
        #window-header nav{
            position:relative;
            top: 20px;

        }
        #window-header img{
            display: inline-block;
            left: 20px;
        }
        #window-header #users {
            width: 300px;
            height: 60px;
            float: right;
            position: relative;
            top: 30px;
        }
        #username {
            background: none;
            border: none;
            font-weight: bold;
            font-size: 20px;
            text-align: center;
        }
        #content {
            position: fixed;
            top: 200px;
            left: 12px;
            width: 50%;
            height: 600px;
        }
        .carousel-inner img{
            height: 700px;
            width: 600px;
        }
    </style>
</head>
<body>
<div id="window-header" class="container-fluid">
    <a href="home.jsp"><img src="pics/logo.png" width="100px" height="120px"></a>
    <div id="users">
        <input type="text" id="username" value="Dark Knight" readonly>
    </div>
    <nav class="navbar navbar-expand-lg navbar-light bg-primary">
        <a class="navbar-brand" href="home.jsp">Home</a>
        <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
            <span class="navbar-toggler-icon"></span>
        </button>

        <div class="collapse navbar-collapse" id="navbarSupportedContent">
            <ul class="navbar-nav mr-auto">
                <li class="nav-item active">
                    <a class="nav-link" href="/homepage?action=employee">Employee<span class="sr-only">(current)</span></a>
                </li>
                <li class="nav-item active">
                    <a class="nav-link" href="/homepage?action=customer">Customer</a>
                </li>
                <li class="nav-item dropdown active">
                    <a class="nav-link dropdown-toggle" href="#" id="navbarDropdown" role="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                        Service
                    </a>
                    <div class="dropdown-menu" aria-labelledby="navbarDropdown">
                        <a class="dropdown-item" href="/homepage?action=villa">Villa</a>
                        <a class="dropdown-item" href="/homepage?action=house">House</a>
                        <a class="dropdown-item" href="/homepage?action=room">Room</a>
                        <div class="dropdown-divider"></div>
                        <a class="dropdown-item" href="/homepage?action=otherConvenience">Other Convenience</a>
                    </div>
                </li>
                <li class="nav-item active">
                    <a class="nav-link" href="/homepage?action=contract">Contract</a>
                </li>
            </ul>
<%--            <form class="form-inline my-2 my-lg-0">--%>
<%--                <input class="form-control mr-sm-2" type="search" placeholder="Search" aria-label="Search">--%>
<%--                <button class="btn btn-outline-warning my-2 my-sm-0" type="submit">Search</button>--%>
<%--            </form>--%>
        </div>
    </nav>
</div>
<div id="content" >
    <h2 style="color:#6f4ba9">Edit Customer</h2>
    <form method="post" action="/homepage">

        <input type="hidden" name="action" value="editCustomer">
        <input type="hidden" name="id" value="${currentCustomer.getId()}"/>
        <div class="input-group mb-3">
            <div class="input-group-prepend">
                <span class="input-group-text">Name</span>
            </div>
            <input type="text" class="form-control" aria-label="Default" aria-describedby="inputGroup-sizing-default" id="inputName" value="${currentCustomer.getName()}" name="inputCustomerName">
        </div>
        ${currentCustomer.getName().length() == 0 ? '<p style="color: red"> this name is ok</p>' : ''}
        <div class="input-group mb-3">
            <div class="input-group-prepend">
                <span class="input-group-text">Customer Type</span>
            </div>
            <select class="form-control" id="inputType" name="InputCustomerType">
                <c:forEach  var="type" items="${TypeOfCustomer}">
                    <option value="${type.getId()}" ${currentCustomer.getType() == type.getId() ? 'selected' : ''}>${type.getName()}</option>
                </c:forEach>
            </select>
        </div>
        <div class="input-group mb-3">
            <div class="input-group-prepend">
                <span class="input-group-text">Date Of Birth</span>
            </div>
            <input type="date" class="form-control" aria-label="Default" aria-describedby="inputGroup-sizing-default" id="inputDateOfBirth" value="${currentCustomer.getDateOfBirth()}" name="inputCustomerDateOfBirth">
        </div>
        ${validator.isValidDateOfBirth(currentCustomer.getDateOfBirth()) == true ? '' : '<h5 style="color: red">Date of birth must be in format dd-mm-yyyy and must older than 18 years old</h5>'}
        <div class="input-group mb-3">
            <div class="input-group-prepend">
                <span class="input-group-text">Gender</span>
            </div>
            <select class="form-control" id="inputGender" name="inputCustomerGender">
                <option value="Male" ${currentCustomer.getGender() == 'Male' ? 'selected' : ''}>Male</option>
                <option value="Female" ${currentCustomer.getGender() == 'Female' ? 'selected' : ''}>Female</option>
                <option value="Other" ${currentCustomer.getGender() == 'Other' ? 'selected' : ''}>Other</option>
            </select>
        </div>
        <div class="input-group mb-3">
            <div class="input-group-prepend">
                <span class="input-group-text">ID Card</span>
            </div>
            <input type="text" class="form-control" aria-label="Default" aria-describedby="inputGroup-sizing-default" value="${currentCustomer.getIdCard()}" name="inputCustomerIdCard">
        </div>
        ${validator.isValidIdCard(currentCustomer.getIdCard()) == true ? '' : '<h5 style="color: red">ID card must includes 9 digitals</h5>'}
        <div class="input-group mb-3">
            <div class="input-group-prepend">
                <span class="input-group-text">Phone Number</span>
            </div>
            <input type="text" class="form-control" aria-label="Default" aria-describedby="inputGroup-sizing-default" value="${currentCustomer.getPhoneNumber()}" name="inputCustomerPhoneNumber">
        </div>
        ${validator.isValidPhoneNumber(currentCustomer.getPhoneNumber()) == true ? '' : '<h5 style="color: red">Phone number must be starts with 090, 091, (84)+90, (84)+91 and 7 digitals</h5>'}
        <div class="input-group mb-3">
            <div class="input-group-prepend">
                <span class="input-group-text">Email</span>
            </div>
            <input type="text" class="form-control" aria-label="Default" aria-describedby="inputGroup-sizing-default" value="${currentCustomer.getEmail()}" name="inputCustomerEmail">
        </div>
        ${validator.isValidEmail(currentCustomer.getEmail()) == true ? '' : '<h5 style="color: red">The email must have at least one "." letter and only one @ letter</h5>'}
        <div class="input-group mb-3">
            <div class="input-group-prepend">
                <span class="input-group-text">Address</span>
            </div>
            <input type="text" class="form-control" aria-label="Default" aria-describedby="inputGroup-sizing-default" value="${currentCustomer.getAddress()}" name="inputCustomerAddress">
        </div>

        <button class="btn btn-outline-warning" type="submit">Save</button>
        <a type="button" href="/homepage?action=customer" class="btn btn-outline-danger">Cancel</a>
    </form>
</div>

<!-- Optional JavaScript -->
<!-- jQuery first, then Popper.js, then Bootstrap JS -->
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

