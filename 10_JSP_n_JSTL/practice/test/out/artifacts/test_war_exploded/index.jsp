<%--
  Created by IntelliJ IDEA.
  User: ttqld
  Date: 11/3/2020
  Time: 11:04 AM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
  <head>
    <title>$Title$</title>
  </head>
  <body>
  <h2>c:remove example</h2>
  <c:set scope="request" var="greeting" value="Hello every body" />
  Greeting: <c:out value="${greeting}"/>
  <br/><br/>
  <c:remove scope="request" var="greeting" />
  After remove:
  <br/>
  Greeting: <c:out value="${greeting}"/>
  </body>
</html>
