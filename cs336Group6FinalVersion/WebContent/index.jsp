<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ page import="java.io.*,java.util.*,java.sql.*"%>
<%@ page import="javax.servlet.http.*,javax.servlet.*" %>

<!DOCTYPE>
<html>
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
		<title>Railway Booking</title>
	</head>
<body>

<h1>Railway Booking</h1>									  

Login:
<form  method="post" action="login.jsp">
	<br>
		<b>Username</b>
		<input type="text" name="username" required>
	<br />	
	<br>
		<b>Password</b>
		<input type="password" name="password" required>
	<br />
	<br>
		<input type="submit" value="Customer Login">
	<br />
</form>


<form method="post" action="createAccount.jsp">
		<input type="submit" value="Create New Account">
</form>
<br> 
<br />
Employee Login:
<form  method="post" action="loginAdmin.jsp">
	<br>
		<b>Username</b>
		<input type="text" name="username" required>
	<br />	
	<br>
		<b>Password</b>
		<input type="password" name="password" required>
	<br />
	<br>
		<input type="submit" value="Employee Login">
	<br />
</form>


</body>
</html>