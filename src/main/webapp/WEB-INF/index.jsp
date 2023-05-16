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

<title>Login and Registration</title>
</head>
<body>

<h1 class="text-center purple">Dance Studio Starter</h1>

	<div class="container">
		<div class="row">
			<div class="col-md-6 col-md-offset-3">
				<form:form method="post" action="/register" modelAttribute="newUser">
					<h2>Register</h2>
					<div class="form-group">
						<label for="name">Studio Name:</label>
						<form:input type="text" path="name" id="name" class="form-control" />
						<form:errors path="name" cssClass="error" />
					</div>
					<div class="form-group">
						<label for="email">Email:</label>
						<form:input type="email" path="email" id="email" class="form-control" />
						<form:errors path="email" cssClass="error" />
					</div>
					<div class="form-group">
						<label for="password">Password:</label>
						<form:password path="password" id="password" class="form-control" />
						<form:errors path="password" cssClass="error" />
					</div>
					<div class="form-group">
						<label for="confirm_password">Confirm PW:</label>
						<form:password path="confirm" id="confirm" class="form-control" />
						<form:errors path="confirm" cssClass="error" />
					</div>
					<button type="submit" class="btn btn-primary purple-btn">Register</button>
				</form:form>
			</div>
		</div>
		<div class="row">
			<div class="col-md-6 col-md-offset-3">
				<form:form method="post" action="/login" modelAttribute="newLogin">
					<h2>Log In</h2>
					<div class="form-group">
						<label for="email">Email:</label>
						<form:input type="email" path="email" id="email" class="form-control" />
						<form:errors path="email" cssClass="error" />
					</div>
					<div class="form-group">
						<label for="password">Password:</label>
						<form:password path="password" id="password" class="form-control" />
						<form:errors path="password" cssClass="error" />
					</div>
					<button type="submit" class="btn btn-primary purple-btn">Log In</button>
				</form:form>
			</div>
		</div>
	</div>

</body>
</html>