<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1" import="com.cs336.pkg.*"%>
<%@ page import="java.io.*,java.util.*,java.sql.*"%>
<%@ page import="javax.servlet.http.*,javax.servlet.*"%>

<!DOCTYPE>
<html>
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
		<title>Browsing</title>
	</head>
	<body>
	<h1>Search result:</h1>
		<h2>Stop Detail:</h2>
		<% try {
	
			//Get the database connection
			ApplicationDB4 db = new ApplicationDB4();	
			Connection con = db.getConnection();		

			//Create a SQL statement
			Statement stmt = con.createStatement();
			//Get the selected radio button from the index.jsp
			//entity is from the index
			String lineName = request.getParameter("Line");
			//Make a SELECT query from the table specified by the 'command' parameter at the index.jsp
			//str will look like SELECT * FROM beers
			String str = "SELECT * FROM LineSystem.Line_has_station where line_name like '%"+lineName+"' ORDER BY station_index";
			//Run the query against the database.
			ResultSet rs = stmt.executeQuery(str);
				 
		%>
		<table border = "3" width="100%">
			<tr> 
				<td><b>Line Name </b></td>
				<td><b>Station Name</b></td>
				<td><b>Departure Time</b></td>
				<td><b>Arrive Time</b></td>
			</tr>	
			<% 
			while(rs.next()) {
				%>
				<tr>
				<td><%= rs.getString("line_name")%></td>
				<td><%= rs.getString("s_name")%></td>
				<td><%
				if(rs.getString("departure_from_station_time")!=null&& !(rs.getString("departure_from_station_time")).equals("00:00:00")){
					out.print(rs.getString("departure_from_station_time"));
				};
				%>
				</td>
				<td><%
				if(rs.getString("arrive_to_station_time")!=null&& !(rs.getString("arrive_to_station_time")).equals("00:00:00")){
					out.print(rs.getString("arrive_to_station_time"));
				};
				%>
				</td>
				</tr>
				<% 
			}%>
			
			<% //close the connection.
			db.closeConnection(con);
			%>
		</table>	
		<%} catch (Exception e) {
			out.print(e);
		}%>
		<form method="get" action="ViewCompleteReservations.jsp">
		<br>
		<input type="hidden" name="username" value = "<%=request.getParameter("username")%>" readonly>
		<input type="submit" value="Back To View Reservation Page">
		<br />
</form>

	</body>
</html>