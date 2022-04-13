<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1" import="com.cs336.pkg.*"%>
<!--Import some libraries that have classes that we need -->
<%@ page import="java.io.*,java.util.*,java.sql.*"%>
<%@ page import="javax.servlet.http.*,javax.servlet.*"%>
<!DOCTYPE>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>View Completed Reservations</title>
</head>
<body>
	<h1>Your Completed Reservation</h1>
	<%
		try {

			//Get the database connection
			ApplicationDB5 db = new ApplicationDB5();	
			Connection con = db.getConnection();

			//Create a SQL statement
			Statement stmt = con.createStatement();

			//Get parameters from the HTML form
			String username = request.getParameter("username");

			//Make an insert statement for the login in blanks:
			String query = "SELECT * FROM Have_Reservation WHERE username = ? AND state = ? And date >= CURDATE()";
			
			//Create a Prepared SQL statement allowing you to introduce the parameters of the query
			PreparedStatement ps = con.prepareStatement(query);

			//Add parameters of the query. Start with 1, the 0-parameter is the INSERT statement itself
			ps.setString(1, username);
			ps.setString(2, "complete");
			//Run the query against the DB
			ResultSet rs = ps.executeQuery();
			
			%>
			<h2>Your Current Reservation</h2>
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
				<td><b>Line Detail</b></td>
				<td><b>Cancel Reservation</b></td>
			</tr>
			<%
			while(rs.next()) {
			%>
				<tr>
				<form method="get" action="ViewReservationDetail.jsp">
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
				<td><input type="submit" value="detail"></td>
				</form>	
				<form method="get" action="CancelReservation.jsp">
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
				<td><input type="submit" value="Cancel"></td>
				</form>
				
				</tr>
				<%
				
			}
			%>
			</table>
			<%
			query = "SELECT * FROM Have_Reservation WHERE username = ? AND state = ? And date < CURDATE()";
			ps = con.prepareStatement(query);

			//Add parameters of the query. Start with 1, the 0-parameter is the INSERT statement itself
			ps.setString(1, username);
			ps.setString(2, "complete");
			//Run the query against the DB
			rs = ps.executeQuery();
			%>
			<h2>Your Past Reservation</h2>
			<table border = "10" width="100%">
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
				<td><b>Line Detail</b></td>
			</tr>
			<%
			while(rs.next()) {
			%>
				<tr>
				<form method="get" action="ViewReservationDetail.jsp">
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
				<td><input type="submit" value="detail"></td>
				</form>	
				</tr>
			<% 
				
			}
			%>
			</table>
			<%
			//Close the connection. Don't forget to do it, otherwise you're keeping the resources of the server allocated.
			con.close();
		
		} catch (Exception ex) {
			out.print(ex);
		}
	%>
<form method="get" action="home.jsp">
	<br>
		<input type="hidden" name="username" value = "<%=request.getParameter("username")%>" readonly>
		<input type="submit" value="Back To Home Page">
	<br />
</form>
</body>
</html>