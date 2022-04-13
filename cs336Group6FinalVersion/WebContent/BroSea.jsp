<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1" import="com.cs336.pkg.*"%>
<%@ page import="java.io.*,java.util.*,java.sql.*"%>
<%@ page import="javax.servlet.http.*,javax.servlet.*"%>

<!DOCTYPE>
<html>
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
		<title>Browse and Search</title>
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
			String origin = request.getParameter("Origin");
			String dest = request.getParameter("Destination");
			String dot = request.getParameter("DOT");
			//Make a SELECT query from the table specified by the 'command' parameter at the index.jsp
			//str will look like SELECT * FROM beers
			String str = "SELECT * FROM LineSystem.Train_Schedule where origin_s_name like '%"+origin+"' and dest_s_name like '%"+dest+"' and date like '%"+dot+"'";
			//Run the query against the database.
			
			ResultSet rs = stmt.executeQuery(str);
				 
		%>
		<table border = "8" width="100%">
			<tr> 
				<td><b>LineName </b></td>
				<td><b>Date</b></td>
				<td><b>Origin</b></td>
				<td><b>Destination</b></td>
				<td><b>Departure Time</b></td>
				<td><b>Arrive Time</b></td>
				<td><b>Total Fare</b></td>	
				<td><b>Stops Detail</b></td>	
			</tr>	
			<% 
			while(rs.next()) {
				%>
				<tr>
				<form method="post" action="BroSeaDetail.jsp">
				<input type="hidden" name="username" value = "<%=request.getParameter("username")%>" readonly>
				<td><input type="text" name="Line" value =<%=rs.getString("line_name")%> readonly></td>
				<td><%= rs.getString("date")%></td>
				<td><%= rs.getString("origin_s_name")%></td>
				<td><%= rs.getString("dest_s_name")%></td>
				<td><%
				if(rs.getString("departure_time")!=null&& !(rs.getString("departure_time")).equals("00:00:00")){
					out.print(rs.getString("departure_time"));
				};
				%>
				</td>
				<td><%
				if(rs.getString("arrive_time")!=null&& !(rs.getString("arrive_time")).equals("00:00:00")){
					out.print(rs.getString("arrive_time"));
				};
				%>
				</td>
				<td><%= rs.getString("total_fare")+"$"%></td>
				<td><input type="submit" value="detail">
				</form>	
				</td>
				</tr>
					
				
				<% }
			//close the connection.
			db.closeConnection(con);
			%>
		</table>
		<br>
		<b>Sort by:</b>
		<br>
		<form method="get" action="BroSeaSort.jsp">
			<select name="Sort" size=1>
				<option value="arrive_time">Arrival time</option>
				<option value="departure_time">Departure time</option>
				<option value="total_fare">Fare</option>
			</select>&nbsp;<input type="submit" value="submit">
			<input type="hidden" name="username" value = "<%=request.getParameter("username")%>" readonly>
			<input type="hidden" name="Origin" value =<%=origin%>>
			<input type="hidden" name="Destination" value =<%=dest%>>
			<input type="hidden" name="DOT" value =<%=dot%>>
		</form>
		<br>
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