<%--
  Created by IntelliJ IDEA.
  User: ttqld
  Date: 11/16/2020
  Time: 12:38 AM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <title>Employee Page</title>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">

    <link rel="stylesheet" href="bootstrap413/css/bootstrap.min.css">
    <link rel="stylesheet" href="datatables/css/dataTables.bootstrap4.min.css">

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
            left: 13px;
            width: 98.5%;
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
                <li class="nav-item">
                    <a class="nav-link" href="/homepage?action=customer">Customer</a>
                </li>
                <li class="nav-item dropdown">
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
                <li class="nav-item">
                    <a class="nav-link" href="/homepage?action=contract">Contract</a>
                </li>
                <li class="nav-item">
                    <a class="nav-link" href="/homepage?action=createNewEmployee">Create New Employee</a>
                </li>
            </ul>
            <form class="form-inline my-2 my-lg-0" action="/homepage" method="get">
                <input type="hidden" name="action" value="employeeNameSearch">
                <input class="form-control mr-sm-2" type="search" placeholder="Search" aria-label="Search" name = "nameSearch">
                <button class="btn btn-outline-warning my-2 my-sm-0" type="submit">Search</button>
            </form>
        </div>
    </nav>
</div>
<div id="content">
    <h2 style="color:darkorange">Create New Employee</h2>
    <table class="table table-striped" id="tableEmployee">
        <thead class="thead-dark">
        <tr>
            <th scope="col">Id</th>
            <th scope="col">Name</th>
            <th scope="col">Date Of Birth</th>
            <th scope="col">ID card</th>
            <th scope="col">Salary</th>
            <th scope="col">Phone Number</th>
            <th scope="col">Address</th>
            <th scope="col">Position</th>
            <th scope="col">Education Degree</th>
            <th scope="col">Division</th>
            <th scope="col">User Type</th>
            <th scope="col">Modify</th>
        </tr>
        </thead>
        <tbody>
        <c:forEach var="employee" items="${employeeList}">
            <tr>
                <th scope="row">${employee.getId()}</th>
                <td>${employee.getName()}</td>
                <td>${employee.getDateOfBirth()}</td>
                <td>${employee.getIdCard()}</td>
                <td>${employee.getSalary()}</td>
                <td>${employee.getPhoneNumber()}</td>
                <td>${employee.getAddress()}</td>
                <td>${employee.getPositionName()}</td>
                <td>${employee.getEducationDegreeName()}</td>
                <td>${employee.getDivisionName()}</td>
                <td>${employee.getUserType()}</td>
                <td>

                    <a type="button" href="/homepage?action=editEmployee&id=${employee.getId()}" class="btn btn-outline-primary">Edit</a>
                    <button type="button" onclick="getId(${employee.getId()})" class="btn btn-outline-danger" data-toggle="modal" data-target="#modelDelete">Delete</button>
                </td>
            </tr>
        </c:forEach>
        </tbody>
    </table>
</div>
<div class="modal fade" id="modelDelete" tabindex="-1" role="dialog" aria-labelledby="modelTitleId" aria-hidden="true">
    <div class="modal-dialog" role="document">
        <div class="modal-content">
            <div class="modal-header">
                <h5 class="modal-title">Modal title</h5>
                <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                    <span aria-hidden="true">&times;</span>
                </button>
            </div>
            <form action="homepage" method="get">
                <div class="modal-body">

                    <h2>Are you sure about deleting this employee?</h2>
                    <input type="hidden" name="action" value="deleteEmployee">
                    <input type="hidden" id="modalId" name="id" value="">

                </div>
                <div class="modal-footer">
                    <button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
                    <button type="submit" class="btn btn-primary">Confirm</button>
                </div>
            </form>
        </div>
    </div>
</div>


<script src="jquery/jquery-3.5.1.min.js"></script>
<script src="popper/popper.min.js"></script>
<script src="datatables/js/jquery.dataTables.min.js"></script>
<script src="datatables/js/dataTables.bootstrap4.min.js"></script>
<script src="bootstrap413/js/bootstrap.min.js"></script>



<script>
    function getId(id) {
        $("#modalId").val(id);
    }
    $(document).ready(function () {
        $('#tableEmployee').dataTable ({
            "dom": 'lrtip',
            "lengthChange": false,
            "pageLength": 3
        })
    })
</script>
</body>
</html>

