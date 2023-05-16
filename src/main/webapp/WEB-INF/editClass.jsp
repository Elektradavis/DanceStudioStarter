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

<title>Edit Classes</title>
</head>
<body>

<div class="text-center purple">
  <h1>Welcome, <c:out value="${user.name}"/>!</h1>
  <a href="/classes">Back to Dashboard</a>
</div>

<div class="container">
    <h3 class="text-decoration-underline purple">Edit <c:out value="${danceClass.title}"/></h3>
    
    <form:form method="POST" action="/edit" modelAttribute="danceClass">
        <div class="form-group row">
            <form:label path="title" class="col-sm-2 col-form-label">Class Title:</form:label>
            <div class="col-sm-10">
                <form:errors path="title" cssClass="text-danger"/>
                <form:input path="title" class="form-control"/>
            </div>
        </div>
        
        <div class="form-group row">
            <form:label path="age" class="col-sm-2 col-form-label">Age:</form:label>
            <div class="col-sm-10">
                <form:errors path="age" cssClass="text-danger"/>
                <form:input path="age" class="form-control"/>
            </div>
        </div>
        
        <div class="form-group row">
            <form:label path="style" class="col-sm-2 col-form-label">Style:</form:label>
            <div class="col-sm-10">
                <form:errors path="style" cssClass="text-danger"/>
                <form:input path="style" class="form-control"/>
            </div>
        </div>
        
        <div class="form-group row">
            <form:label path="teacher" class="col-sm-2 col-form-label">Teacher:</form:label>
            <div class="col-sm-10">
                <form:errors path="teacher" cssClass="text-danger"/>
                <form:input path="teacher" class="form-control"/>
            </div>
        </div>
        
        <div class="form-group row">
            <form:label path="description" class="col-sm-2 col-form-label">Description:</form:label>
            <div class="col-sm-10">
                <form:errors path="description" cssClass="text-danger"/>
                <form:textarea path="description" class="form-control" rows="5"></form:textarea>
            </div>
        </div>
        
        <div class="form-group row">
            <form:label path="day" class="col-sm-2 col-form-label">Day:</form:label>
            <div class="col-sm-10">
                <form:errors path="day" cssClass="text-danger"/>
                <form:input path="day" class="form-control"/>
            </div>
        </div>        
        
        <div class="form-group row">
            <form:errors path="user"/>
            <form:input type="hidden" path="user" value="${user.id}"/>
        </div>

        <div><input type="hidden" name="id" value="${danceClass.id}"/></div>		

        <div class="form-group row">
            <div class="col-sm-2"></div>
            <div class="col-sm-10">
                <button type="submit" class="btn btn-primary purple-btn">Update</button>
            </div>
        </div>
        
    </form:form>   
    <form:form id="delete" method="POST" action="/classes/${danceClass.id}/delete" modelAttribute="danceClass">
        <div class="form-group row">
            <div class="col-sm-2"></div>
            <div class="col-sm-10">
                <form:button class="btn btn-danger" onclick="if(!confirm('Are you sure you want to delete this class?')) {event.preventDefault();}">Delete Class</form:button>
            </div>
        </div>
    </form:form>     
</div>

</body>
</html>