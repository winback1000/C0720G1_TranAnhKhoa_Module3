<%--
  Created by IntelliJ IDEA.
  User: ttqld
  Date: 11/11/2020
  Time: 9:37 AM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html lang="en">
<head>
    <title>Furama Home</title>
    <!-- Required meta tags -->
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
            background-color: whitesmoke;
            position: fixed;
            top: 200px;
            left: 12px;
            width: 98.5%;
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
    <div id="carouselExampleIndicators" class="carousel slide" data-ride="carousel">
        <ol class="carousel-indicators">
            <li data-target="#carouselExampleIndicators" data-slide-to="0" class="active"></li>
            <li data-target="#carouselExampleIndicators" data-slide-to="1"></li>
            <li data-target="#carouselExampleIndicators" data-slide-to="2"></li>
            <li data-target="#carouselExampleIndicators" data-slide-to="3"></li>
            <li data-target="#carouselExampleIndicators" data-slide-to="4"></li>
        </ol>
        <div class="carousel-inner">
            <div class="carousel-item active">
                <a href="/homepage?action=employee"><img class="d-block w-100" src="pics/employee.jpg" alt="First slide"></a>
                <div class="carousel-caption d-none d-md-block">
                    <h5 style="color: black">Our wonderful members</h5>
                    <p style="color: black">Click here to go to our members page</p>
                </div>
            </div>
            <div class="carousel-item">
                <a href="/homepage?action=villa"><img class="d-block w-100" src="pics/villa.jpg" alt="Second slide"></a>
                <div class="carousel-caption d-none d-md-block">
                    <h5>Our wonderful Villa</h5>
                    <p>Click here to go to our villas page</p>
                </div>
            </div>
            <div class="carousel-item">
                <a href="/homepage?action=customer"><img class="d-block w-100" src="pics/customer2.jpg" alt="Third slide"></a>
                <div class="carousel-caption d-none d-md-block">
                    <h5>Our wonderful customers</h5>
                    <p>Click here to go to our customers page</p>
                </div>
            </div>
            <div class="carousel-item">
                <a href="/homepage?action=house"><img class="d-block w-100" src="pics/house.jpg" alt="Third slide"></a>
                <div class="carousel-caption d-none d-md-block">
                    <h5>Our wonderful houses</h5>
                    <p>Click here to go to our houses page</p>
                </div>
            </div>
            <div class="carousel-item">
                <a href="/homepage?action=room"><img class="d-block w-100" src="pics/room.jpg" alt="Third slide"></a>
                <div class="carousel-caption d-none d-md-block">
                    <h5>Our wonderful rooms</h5>
                    <p>Click here to go to our rooms page</p>
                </div>
            </div>
        </div>
        <a class="carousel-control-prev" href="#carouselExampleIndicators" role="button" data-slide="prev">
            <span class="carousel-control-prev-icon" aria-hidden="true"></span>
            <span class="sr-only">Previous</span>
        </a>
        <a class="carousel-control-next" href="#carouselExampleIndicators" role="button" data-slide="next">
            <span class="carousel-control-next-icon" aria-hidden="true"></span>
            <span class="sr-only">Next</span>
        </a>
    </div>
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
