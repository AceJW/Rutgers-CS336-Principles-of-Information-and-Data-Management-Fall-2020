
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

<b>BEST CUSTOMER (Completed Reservations)</b>
	
</form>
<% 	
    ApplicationDB5 db = new ApplicationDB5();	
	Connection con = db.getConnection();	
	String username = request.getParameter("username");
	String month = request.getParameter("month");
	Statement stmt = con.createStatement();
	ResultSet rs1;

	
	rs1 = stmt.executeQuery("SELECT username, count( * ) AS reserve ,sum(fare) AS count FROM ReservationSystem.Have_Reservation where state ='complete' GROUP BY username ORDER BY count DESC LIMIT 1");	
	
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
	out.print("<td>");
	out.print("</td>");
	//make a column

	out.print("</tr>");
	
		%>	<table border = "3" width="100%">
			<tr> 
				<td><b>Username </b></td>
				<td><b>Ticket Reserved</b></td>		
				<td><b>Total Paid</b></td>		
						
					
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
				out.print(rs1.getString("reserve"));
				out.print("</td>");
				out.print("<td>");
				//Print out current beer name:
				out.print(rs1.getString("count"));
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