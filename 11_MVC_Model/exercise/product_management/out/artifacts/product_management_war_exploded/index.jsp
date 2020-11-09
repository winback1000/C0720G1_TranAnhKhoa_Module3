<%--
  Created by IntelliJ IDEA.
  User: ttqld
  Date: 11/5/2020
  Time: 11:14 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
  <head>
    <title>Home Page</title>
      <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css"
            integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T" crossorigin="anonymous">
  </head>
  <body>
  <nav class="navbar navbar-expand-lg navbar-light bg-light">
      <a class="navbar-brand" href="/home?action= ">WB</a>
      <button class="navbar-toggler d-lg-none" type="button" data-toggle="collapse" data-target="#collapsibleNavId"
              aria-controls="collapsibleNavId"
              aria-expanded="false" aria-label="Toggle navigation">
          <span class="navbar-toggler-icon"></span>
      </button>
      <div class="collapse navbar-collapse" id="collapsibleNavId">
          <ul class="navbar-nav mr-auto mt-2 mt-lg-0">
              <li class="nav-item active">
                  <a class="nav-link" href="/home?action= ">List All Product<span class="sr-only">(current)</span></a>
              </li>
              <li class="nav-item">
                  <a class="nav-link" href="/home?action=create">Add new Product</a>
              </li>
          </ul>
          <form class="form-inline my-2 my-lg-0" method="get" action="/search">
              <input class="form-control mr-sm-2" type="text" placeholder="Search" name="searchData">
              <button class="btn btn-outline-success my-2 my-sm-0" type="submit">Search</button>
          </form>
      </div>
  </nav>

  <table class="table table-striped">
      <thead class="thead-dark">
      <tr>
          <th scope="col">Id</th>
          <th scope="col">Name</th>
          <th scope="col">Manufacturer</th>
          <th scope="col">Image</th>
          <th scope="col">Price</th>
          <th scope="col">In Stock</th>
          <th scope="col">Modify</th>
      </tr>
      </thead>
      <tbody>
      <c:forEach var="prd" items="${productList}">
          <tr>
              <th scope="row">${prd.getId()}</th>
              <td>${prd.getName()}</td>
              <td>${prd.getManufacturer()}</td>
              <td><img src="${prd.getImage()}" style="height: 80px; width: 80px" class="rounded mx-auto d-block"></td>
              <td>${prd.getPrice()}</td>
              <td>${prd.getStock()}</td>
              <td>
<%--                  <a type="button" href="home?action=edit&id=${prd.id}" class="btn btn-outline-warning">Edit</a>--%>
    <button type="button" class="btn btn-outline-primary" onclick="getData(${prd.getId()},'${prd.getName()}','${prd.getManufacturer()}','${prd.getImage()}',${prd.getPrice()},${prd.getStock()})" data-toggle="modal" data-target="#modal_edit">Edit</button>
    <a type="button" href="home?action=delete&id=${prd.id}" class="btn btn-outline-danger">Delete</a>
              </td>
          </tr>
      </c:forEach>
      </tbody>
  </table>

  <!-- Modal -->
  <div class="modal fade" id="modal_edit" tabindex="-1" role="dialog" aria-labelledby="modelTitleId" aria-hidden="true">
      <div class="modal-dialog" role="document">
          <div class="modal-content">
              <div class="modal-header">
                  <h5 class="modal-title">Edit Product</h5>
                  <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                      <span aria-hidden="true">&times;</span>
                  </button>
              </div>
              <form action="/home" method="post">
              <div class="modal-body">
                  <input type="hidden" name="action" value="edit_modal">
                  <div class="input-group mb-3">
                      <div class="input-group-prepend">
                          <span class="input-group-text" id="basic-addon3">ID</span>
                      </div>
                      <input type="text" class="form-control" id="basic-url" aria-describedby="basic-addon3">
                  </div>
                  <input type="text" style="margin: 5px" class="form-control" name = "id" value="" id="modalId" readonly>
                  <input type="text" style="margin: 5px" class="form-control" name = "name" id="modalName" value="" placeholder="Input Name">
                  <input type="text" style="margin: 5px" class="form-control" name = "manufacturer" id="modalManufacturer" value="" placeholder="Input Manufacturer">
                  <input type="text" style="margin: 5px" class="form-control" name = "image" id = "modalImage" value="" placeholder="Input Image Location">
                  <input type="text" style="margin: 5px" class="form-control" name = "price" id = "modalPrice" value="" placeholder="Input price">
                  <input type="text" style="margin: 5px" class="form-control" name = "stock" id = "modalStock" value="" placeholder="Input quantity available in stock">
              </div>
              <div class="modal-footer">
                  <button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
                  <button type="submit" class="btn btn-primary">Save</button>
              </div>
              </form>
          </div>
      </div>
  </div>
<%--  <c: if="${saveStatus}==true">--%>
<%--      <script>--%>
<%--          alert("Save successful")--%>
<%--      </script>--%>
<%--  </c:>--%>
  <script src="https://code.jquery.com/jquery-3.3.1.slim.min.js"
          integrity="sha384-q8i/X+965DzO0rT7abK41JStQIAqVgRVzpbzo5smXKp4YfRvH+8abtTE1Pi6jizo"
          crossorigin="anonymous"></script>
  <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js"
          integrity="sha384-UO2eT0CpHqdSJQ6hJty5KVphtPhzWj9WO1clHTMGa3JDZwrnQq4sF86dIHNDz0W1"
          crossorigin="anonymous"></script>
  <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js"
          integrity="sha384-JjSmVgyd0p3pXB1rRibZUAYoIIy6OrQ6VrjIEaFf/nJGzIxFDsf4x0xIM+B07jRM"
          crossorigin="anonymous"></script>

  <script>
      function getData(id, name_product, manufacturer, image, price, stock) {
        $("#modalId").val(id);
        $("#modalName").val(name_product);
        $("#modalManufacturer").val(manufacturer);
        $("#modalImage").val(image);
        $("#modalPrice").val(price);
        $("#modalStock").val(stock);
      }
  </script>

  </body>
</html>
