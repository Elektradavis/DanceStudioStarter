<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>    
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"  %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ page isErrorPage="true" %>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" href="/webjars/bootstrap/css/bootstrap.min.css">

<style>
  .purple {
    color: purple;
  }
  .purple-btn {
    background-color: purple;
    color: white;
  }
</style>

<title>Dance Studio Starter</title>
</head>
<body>

<div class="text-center purple">
  <h1>Welcome, <c:out value="${user.name}"/>!</h1>
  <a href="/logout">Logout</a>
</div>

<h3>All Classes</h3>

<table class="table table-bordered table-striped">
<tr>
<th scope="col">Class Title</th>
<th scope="col">Age</th>
<th scope="col">Style</th>
<th scope="col">Teacher</th>
<th scope="col">Edit</th>
</tr>
<tr>
<c:forEach items="${danceClassList}" var="danceClass">
    <tr>
        <td><a href="classes/view/${danceClass.id}"><c:out value="${danceClass.title}"/></a></td>
        <td><c:out value="${danceClass.age}"/></td>
        <td><c:out value="${danceClass.style}"/></td>
        <td><c:out value="${danceClass.teacher}"/></td>
        <td><a href="edit/${danceClass.id}">Edit</a></td>
    </tr>
</c:forEach>

</tr>

</table>

<div class="text-center">
  <a href="/classes/create" class="btn btn-primary purple-btn">Create a Class</a>
</div>


</body>
</html>