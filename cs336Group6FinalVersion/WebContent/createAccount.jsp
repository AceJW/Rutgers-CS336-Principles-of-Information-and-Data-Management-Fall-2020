<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ page import="java.io.*,java.util.*,java.sql.*"%>
<%@ page import="javax.servlet.http.*,javax.servlet.*" %>

<!DOCTYPE>
<html>
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
		<title>Railway Booking System Login Page</title>
	</head>
<body>

<h1>Create Account</h1>


<form method="post" action="createAccount2.jsp">
	<br>
		<b>Username</b>
		<input type="text" name="username" required>
		<b>Password</b>
		<input type="password" name="password" required>
	<br />
	<br>
		<b>First Name</b>
		<input type="text" name="firstName" required>
		<b>Last Name</b>
		<input type="text" name="lastName" required>
	<br />
	<br>
		<b>Email Address</b>
		<input type="email" name="emailAddress" required>
	<br />
	<br>
		<b>Age</b>
		<input type="text" name="age" required>
	<br />
	
	<br>
		<b>Are You A Disabled Person</b>
		<input type="radio" name="command" value="yes"/>Yes.
 
 		<input type="radio" name="command" value="no"/>No.
	<br />
	<br>
		<input type="submit" value="Create New Account">
	<br />
</form>

<form method="get" action="index.jsp">
	<br>
		<input type="submit" value="Back to Login Page">
	<br />
</form>


</body>
</html>