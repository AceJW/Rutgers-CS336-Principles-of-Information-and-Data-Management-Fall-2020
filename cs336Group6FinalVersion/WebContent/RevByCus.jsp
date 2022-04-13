
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"
    import="com.cs336.pkg.*"%>
<%@ page import="java.io.*,java.util.*,java.sql.*"%>
<%@ page import="javax.servlet.http.*,javax.servlet.*"%>
<%@ page import="java.util.ArrayList" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
</head>
<body>

<form action="RevByCus.jsp" method="POST">
	<b>Enter username,<br> 
	Sales Revenue By Customer(if reservation completed):  </b><br> 
	<br><input type="text" name="username" value="a" > 
	
	<form action="RevByCus.jsp.jsp">
	<input type="submit" name="username" value="Get Data">
	</form>	
<% 	
    ApplicationDB5 db = new ApplicationDB5();	
	Connection con = db.getConnection();	
	String username = request.getParameter("username"); 

	Statement stmt = con.createStatement();
	ResultSet rs1;

	
	rs1 = stmt.executeQuery("SELECT ifnull(sum(fare),0) as total, ifnull(username,'No data') as username from ReservationSystem.Have_Reservation where username = "+"'"+ username+"'" + " AND state='complete' ");	
	
	
	
		%>	<table border = "3" width="100%">
			<tr> 
				<td><b>Username </b></td>
				<td><b>Total Revenue</b></td>
								
				</tr>	
			<%
			//parse out the results
			while (rs1.next()) { %>
				<tr>
				<td><%= rs1.getString("username") %></td>
				<td>$<%= rs1.getString("total")%></td>
			
				</tr>
	<br></table>
	<%}
	
	
	%><br><br>
	<form method="get" action="homeAdmin.jsp">
		<input type="submit" value="Go Back to Admin Page">
	</form>
</body>
</html>