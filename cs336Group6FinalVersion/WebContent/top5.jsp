<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1" import="com.cs336.pkg.*"%>
<%@ page import="java.io.*,java.util.*,java.sql.*"%>
<%@ page import="javax.servlet.http.*,javax.servlet.*"%>

<!DOCTYPE>
<html>
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
		<title>Best 5 Most Active Transit Lines:</title>
	</head>
	<body>
	<h1>Best 5 Most Active Transit Lines: </h1>

		<% try {
	
			//Get the database connection
			ApplicationDB5 db = new ApplicationDB5();	
			Connection con = db.getConnection();		
			
			//Create a SQL statement
			Statement stmt = con.createStatement();
			//Get the selected radio button from the index.jsp
			//entity is from the index
			String year = request.getParameter("Year");
			String month = request.getParameter("Month");
			%><h2><%=year%>/<%=month%></h2><%
			
			//Make a SELECT query from the table specified by the 'command' parameter at the index.jsp
			//str will look like SELECT * FROM beers
			
			String str = "SELECT line_name, count(*) AS temp FROM Have_Reservation where year(date)='"+year+"' and month(date)='"+month+"' and state = 'complete' GROUP BY line_name ORDER by temp desc";
			//Run the query against the database.
			ResultSet rs = stmt.executeQuery(str);
			%>
			<table border = "8" width="100%">
			<tr> 
				<td><b>Line Name</b></td>
				<td><b>Amount of Reservation</b></td>
			</tr>	
				<%
				int index=0;
				while(rs.next() && index<=4){%>
				<tr> 
				<td><b><%= rs.getString("line_name")%> </b></td>
				<td><b><%= rs.getString("temp")%></b></td>
				</tr>
				<%
				index++;
				}%>	
			</table>

			<% //close the connection.
			db.closeConnection(con);
			%>

		<%} catch (Exception e) {
			out.print(e);
		}%>
		<form method="get" action="homeAdmin.jsp">
		<input type="submit" value="Back to admin home Page">
		<br />
</form>

	</body>
</html>