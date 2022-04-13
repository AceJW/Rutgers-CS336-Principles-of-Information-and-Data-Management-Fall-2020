
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

<b>List of Reservations By Customer</b>

<% 	
    ApplicationDB5 db = new ApplicationDB5();	
	Connection con = db.getConnection();	
	String username = request.getParameter("username");
	Statement stmt = con.createStatement();
	ResultSet rs1;
	
	rs1 = stmt.executeQuery("select count(distinct reserve_num) as total,username from ReservationSystem.Have_Reservation group by username order by count(*) desc");	
	
	out.print("<table>");

	//make a row
	out.print("<tr>");
	//make a column
	out.print("<td>");
	//print out column header
	out.print("</td>");
	//make a column
	out.print("<td>");
	out.print("</td>");
	//make a column

	out.print("</tr>");
	
		%>	<table border = "3" width="100%">
			<tr> 
				<td><b>Customer_username </b></td>
				<td><b>Total Reservation</b></td>									
			</tr>	
			<%
			//parse out the results
			while (rs1.next()) { 
				//make a row
				out.print("<tr>");
				//make a column
				out.print("<td>");
				//Print out current bar name:
				out.print(rs1.getString("username"));
				out.print("</td>");
				out.print("<td>");
				//Print out current beer name:
				out.print(rs1.getString("total"));
				out.print("</td>");
	
				out.print("</tr>");
	} 
	
			%>
	</table><br><br>
	<form method="get" action="homeAdmin.jsp">
		<input type="submit" value="Go Back to Admin Page">
	</form>
</body>
</html>