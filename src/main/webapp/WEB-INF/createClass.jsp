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

<title>Create a Class</title>
</head>
<body>

<div class="text-center purple">
  <h1>Welcome, <c:out value="${user.name}"/>!</h1>
  <a href="/classes">Back to Dashboard</a>
</div>

<div class="container">
	<h2 class="text-left mb-5 purple">Create a New Class!</h2>

	<form:form method="POST" action="/newclass" modelAttribute="danceClass">
		<div class="row mb-3">
			<div class="col-md-2">
				<form:label path="title">Class Title:</form:label>
			</div>
			<div class="col-md-10">
				<form:errors path="title"/>
				<form:input path="title" class="form-control"/>
			</div>
		</div>
		<div class="row mb-3">
			<div class="col-md-2">
				<form:label path="age">Age:</form:label>
			</div>
			<div class="col-md-10">
				<form:errors path="age"/>
				<form:input path="age" class="form-control"/>
			</div>
		</div>
		<div class="row mb-3">
			<div class="col-md-2">
				<form:label path="style">Style:</form:label>
			</div>
			<div class="col-md-10">
				<form:errors path="style"/>
				<form:input path="style" class="form-control"/>
			</div>
		</div>
		<div class="row mb-3">
			<div class="col-md-2">
				<form:label path="teacher">Teacher:</form:label>
			</div>
			<div class="col-md-10">
				<form:errors path="teacher"/>
				<form:input path="teacher" class="form-control"/>
			</div>
		</div>				
		<div class="row mb-3">
			<div class="col-md-2">
				<form:label path="description">Class Description:</form:label>
			</div>
			<div class="col-md-10">
				<form:errors path="description"/>
				<form:textarea path="description" class="form-control"/>
			</div>
		</div>
		<div class="row mb-3">
			<div class="col-md-2">
				<form:label path="day">Day:</form:label>
			</div>
			<div class="col-md-10">
				<form:errors path="day"/>
				<form:input path="day" class="form-control"/>
			</div>
		</div>		
		<div class="row mb-3">
			<div class="col-md-10 offset-md-2">
				<form:errors path="user"/>
				<form:input type="hidden" path="user" value="${user.id}"/>
			</div>
		</div>		
		<button type="submit" class="btn btn-primary purple-btn">Create A Class</button>
	</form:form>
</div>
</body>
</html>