<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1" import="com.cs336.pkg.*"%>
<%@ page import="java.io.*,java.util.*,java.sql.*"%>
<%@ page import="javax.servlet.http.*,javax.servlet.*"%>

<!DOCTYPE>
<html>
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
		<title>Shopping Cart</title>
	</head>
	<body>
	<h1>Your Shopping Cart</h1>
		<% try {
	
			//Get the database connection
			ApplicationDB5 db = new ApplicationDB5();	
			Connection con = db.getConnection();		

			//Create a SQL statement
			Statement stmt = con.createStatement();
			//Get the selected radio button from the index.jsp
			//entity is from the index
			String username = request.getParameter("username");
			
			//Make a SELECT query from the table specified by the 'command' parameter at the index.jsp
			//str will look like SELECT * FROM beers	
			String str = "SELECT * FROM Have_Reservation where username = ? AND state = ?";
			PreparedStatement ps = con.prepareStatement(str);
			ps.setString(1, username);
			ps.setString(2, "in_progress");
			//Run the query against the database.

			ResultSet rs = ps.executeQuery();
			
		%>
		<h2>One Way Trip</h2>
		<table border = "12" width="100%">
			<tr> 
				<td><b>Reservation Number </b></td>
				<td><b>Line Name</b></td>
				<td><b>Date</b></td>
				<td><b>Origin</b></td>
				<td><b>Departure Time</b></td>
				<td><b>Destination</b></td>
				<td><b>Arrive_time</b></td>	
				<td><b>Stops</b></td>
				<td><b>One_or_round_way</b></td>	
				<td><b>Fare</b></td>
				<td><b>Buy The Ticket</b></td>
				<td><b>Add Return Ticket</b></td>
			</tr>	
			<% 
			while(rs.next()) {
				%>
				<% 
				if((rs.getString("one_or_round_way")).equals("one_way"))
				{
					%>
					<tr>
					<form method="get" action="BuyTicket.jsp">
					<td><input type="text" name="reserve_num" value =<%=rs.getString("reserve_num")%> readonly></td>
					<input type="hidden" name="username" value = "<%=request.getParameter("username")%>" readonly>
					<td><input type="text" name="Line" value =<%=rs.getString("line_name")%> readonly></td>
					<td><input type="text" name="date" value =<%=rs.getString("date")%> readonly></td>
					<td><input type="text" name="origin" value =<%=rs.getString("origin")%> readonly></td>
					<td><input type="text" name="departure_time" value =<%=rs.getString("departure_time")%> readonly></td>
					<td><input type="text" name="dest" value =<%=rs.getString("dest")%> readonly></td>
					<td><input type="text" name="arrive_time" value =<%=rs.getString("arrive_time")%> readonly></td>
					<td><input type="text" name="stop_num" value =<%=rs.getString("stop_num")%> readonly></td>
					<td><input type="text" name="one_or_round_way" value =<%=rs.getString("one_or_round_way")%> readonly></td>
					<td><input type="text" name="fare" value =<%=rs.getString("fare")%> readonly></td>
					<td><input type="submit" value="Buy"></td>
					</form>	
					
					<form method="get" action="ViewRoundTicket.jsp">
					<input type="hidden" name="reserve_num" value =<%=rs.getString("reserve_num")%> readonly>
					<input type="hidden" name="username" value = "<%=request.getParameter("username")%>" readonly>
					<input type="hidden" name="Line" value =<%=rs.getString("line_name")%> readonly>
					<input type="hidden" name="date" value =<%=rs.getString("date")%> readonly>
					<input type="hidden" name="origin" value =<%=rs.getString("origin")%> readonly>
					<input type="hidden" name="departure_time" value =<%=rs.getString("departure_time")%> readonly>
					<input type="hidden" name="dest" value =<%=rs.getString("dest")%> readonly>
					<input type="hidden" name="arrive_time" value =<%=rs.getString("arrive_time")%> readonly>
					<input type="hidden" name="stop_num" value =<%=rs.getString("stop_num")%> readonly>
					<input type="hidden" name="one_or_round_way" value =<%=rs.getString("one_or_round_way")%> readonly>
					<input type="hidden" name="fare" value =<%=rs.getString("fare")%> readonly>
					<td><input type="submit" value="Add Return Ticket"></td>
					</form>
					</tr>
	
					<% 
				}
			}
			%>
			</table>
			<h2>Round Way Trip</h2>
			<table border = "11" width="100%">
			<tr> 
				<td><b>Reservation Number </b></td>
				<td><b>Line Name</b></td>
				<td><b>Date</b></td>
				<td><b>Origin</b></td>
				<td><b>Departure Time</b></td>
				<td><b>Destination</b></td>
				<td><b>Arrive_time</b></td>	
				<td><b>Stops</b></td>
				<td><b>One_or_round_way</b></td>	
				<td><b>Fare</b></td>
				<td><b>Buy The Ticket</b></td>
				
			</tr>
			<%
			str = "SELECT * FROM Have_Reservation where username = ? AND state = ? ";
			ps = con.prepareStatement(str);
			ps.setString(1, username);
			ps.setString(2, "in_progress");
			//Run the query against the database.

			rs = ps.executeQuery();
			int index = 1;
			while(rs.next()) {
				%>
				<% 
				if((rs.getString("one_or_round_way")).equals("round_way"))
				{
					%>
					<tr>
					<form method="get" action="BuyTicket.jsp">
					<td><input type="text" name="reserve_num" value =<%=rs.getString("reserve_num")%> readonly></td>
					<input type="hidden" name="username" value = "<%=request.getParameter("username")%>" readonly>
					<td><input type="text" name="Line" value =<%=rs.getString("line_name")%> readonly></td>
					<td><input type="text" name="date" value =<%=rs.getString("date")%> readonly></td>
					<td><input type="text" name="origin" value =<%=rs.getString("origin")%> readonly></td>
					<td><input type="text" name="departure_time" value =<%=rs.getString("departure_time")%> readonly></td>
					<td><input type="text" name="dest" value =<%=rs.getString("dest")%> readonly></td>
					<td><input type="text" name="arrive_time" value =<%=rs.getString("arrive_time")%> readonly></td>
					<td><input type="text" name="stop_num" value =<%=rs.getString("stop_num")%> readonly></td>
					<td><input type="text" name="one_or_round_way" value =<%=rs.getString("one_or_round_way")%> readonly></td>
					<td><input type="text" name="fare" value =<%=rs.getString("fare")%> readonly></td>
					<%
					if(index%2 == 0)
					{
					%>
						<td><input type="submit" value="Buy"></td>
					<%
					}
					else
					{
					%>
						<td></td>
					<%
					}
					%>
					
					</form>	
	
					<% 
				}
				index++;
			}
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