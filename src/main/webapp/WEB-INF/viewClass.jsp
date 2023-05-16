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
  
<title>View Class</title>
</head>
<body>

<div class="text-center purple">
  <h1>Welcome, <c:out value="${user.name}"/>!</h1>
  <a href="/classes">Back to Dashboard</a>
</div>

<div class="container">
    <div class="row">
        <div class="col-12 text-left purple">
            <h2 class="text-decoration-underline"><c:out value="${danceClass.title}"/></h2>
        </div>      
    </div>
    
    <div class="row">
        <div class="col-12">
            <h3>Age: <c:out value="${danceClass.age}"/></h3>
        </div>
    </div>
    
    <div class="row">
        <div class="col-12">
            <h3>Style: <c:out value="${danceClass.style}"/></h3>
        </div>
    </div>
    
    <div class="row">
        <div class="col-12">
            <h3>Teacher: <c:out value="${danceClass.teacher}"/></h3>
        </div>
    </div> 
    
    <div class="row">
        <div class="col-12">
            <h3>Day: <c:out value="${danceClass.day}"/></h3>
        </div>
    </div>       
    
    <div class="row">
        <div class="col-12">
            <h3>Class Description: <c:out value="${danceClass.description}"/></h3>
        </div>
    </div>
</div>

</body>
</html>