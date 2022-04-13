
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"
    import="com.cs336.pkg.*"%>
<%@ page import="java.io.*,java.util.*,java.sql.*"%>
<%@ page import="javax.servlet.http.*,javax.servlet.*"%>
<%@ page import="java.util.ArrayList" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
	<head>
		<meta charset="UTF-8">
		<title>Sales Reports By Month</title>
		
	</head>
	<body>
		<h1>Sales Reports By Year/Month</h1>

	
	<form method="get" action="SaleReport2.jsp">
	<b>Year: </b>
		<input size="20" type="number" name="Year" min ="1900"max ="2200" placeholder="2021" maxlength='4'  required>
	<b>Month: </b>
	<select name="month" size=1>
				<option value="01">Jan</option>
				<option value="02">Feb</option>
				<option value="03">Mar</option>
				<option value="04">Apr</option>
				<option value="05">May</option>
				<option value="06">June</option>
				<option value="07">July</option>
				<option value="08">Aug</option>
				<option value="09">Sept</option>
				<option value="10">Oct</option>
				<option value="11">Nov</option>
				<option value="12">Dec</option>
	
	<form action="SaleReport.jsp">
	<input type="submit" value="Get Data">
	</form>	
</form>
		
		

	</body>
	
</html>