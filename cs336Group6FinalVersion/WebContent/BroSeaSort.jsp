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
		<% try {
	
			//Get the database connection
			ApplicationDB4 db = new ApplicationDB4();	
			Connection con = db.getConnection();		

			//Create a SQL statement
			Statement stmt = con.createStatement();
			//Get the selected radio button from the index.jsp
			//entity is from the index
			
			String sort = request.getParameter("Sort");
			//Make a SELECT query from the table specified by the 'command' parameter at the index.jsp
			//str will look like SELECT * FROM beers	
			String str = "SELECT * FROM LineSystem.Line_Train_Schedule ORDER BY "+sort;

			//Run the query against the database.

			ResultSet rs = stmt.executeQuery(str);
			
		%>
		<table border = "3" width="100%">
			<tr> 
				<td><b>LineName </b></td>
				<td><b>Date</b></td>
				<td><b>Your Origin</b></td>
				<td><b>Departure Time</b></td>
				<td><b>Your Destination</b></td>
				<td><b>Arrive Time</b></td>
				<td><b>Total Stops</b></td>	
				<td><b>Your Fare</b></td>	
				<td><b>Check Detail</b></td>	
			</tr>	
			<% 
			while(rs.next()) {
				%>
				<tr>
				<form method="post" action="BroSeaDetail.jsp">
				<input type="hidden" name="username" value = "<%=request.getParameter("username")%>" readonly>
				<td><input type="text" name="Line" value =<%=rs.getString("line_name")%> readonly></td>
				<td><%= rs.getString("date")%></td>
				<td><%= rs.getString("origin")%></td>
				<td><%= rs.getString("departure_time")%></td>
				<td><%= rs.getString("destination")%></td>	
				<td><%= rs.getString("arrive_time")%></td>	
				<td><%= rs.getString("stops")%></td>	
				<td><%="$"+ rs.getString("fare")%></td>
				<td><input type="submit" value="detail"></td>
				</form>	
				</tr>
					
				
				<% }
			str ="truncate table Line_Train_Schedule";
			stmt.execute(str);
			//close the connection.
			db.closeConnection(con);
			%>
		</table>	
		<%} catch (Exception e) {
			out.print(e);
		}%>
		<form method="get" action="home.jsp">
		<br>
		<input type="hidden" name="username" value = "<%=request.getParameter("username")%>" readonly>
		<input type="submit" value="Back to home Page">
		<br />
	</body>
</html>