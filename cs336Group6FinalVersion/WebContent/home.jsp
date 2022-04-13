<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1" import="com.cs336.pkg.*"%>
<!--Import some libraries that have classes that we need -->
<%@ page import="java.io.*,java.util.*,java.sql.*"%>
<%@ page import="javax.servlet.http.*,javax.servlet.*"%>
<!DOCTYPE>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Customer Home</title>
</head>
<body>

<h1>Customer Home</h1>
<h2>Current User: <%out.print(request.getParameter("username"));%></h2>

<h2>Search To Reserve Your Ticket</h2>
<form method="get" action="ViewTicket.jsp">
	<input type="hidden" name="username" value = "<%=request.getParameter("username")%>" readonly>
	<label for="origin"><b>Input The Station Of Your Departure</b></label>
	<input type="text" name="origin" placeholder ="unS" required><br><br>
	
	<label for="dest"><b>Input The Station Of Your Destination</b></label>
	<input type="text" name="dest" placeholder ="detaS" required><br><br>
	<b>Date of travel: </b>
		(YYYY-MM-DD)
	<input size="20" type="text" name="DOT" placeholder ="2019-02-01" required>			
	<input type="submit" value="Search the Tickets"><br><br>
</form>

<form method="get" action="ShoppingCart.jsp">
	<p align="right">
	  <input type="hidden" name="username" value = "<%=request.getParameter("username")%>" readonly>
	  <input type="submit" value="Your Shopping Cart" />
	</p>
</form>
<form method="get" action="ViewCompleteReservations.jsp">
	<p align="right">
	  <input type="hidden" name="username" value = "<%=request.getParameter("username")%>" readonly>
	  <input type="submit" value="View Your Completed Reservations" />
	</p>
</form>
<br>
	<form method="get" action="questions.jsp">
		<input type="hidden" name="username" value = "<%=request.getParameter("username")%>" readonly>
		<input type="submit" value="Questions Page">
	</form>
<br>
<br>
	<form method="get" action="index.jsp">
		<input type="submit" value="Log Out">
	</form>
<br>
<h3>Train Schedules Overview</h3>
<%			
			ApplicationDB4 db2 = new ApplicationDB4();	
			Connection con2 = db2.getConnection();		
			Statement stmt3 = con2.createStatement();
			String delete = "truncate table Line_Train_Schedule";
			stmt3.execute(delete);
			//Create a SQL statement
			Statement stmt2 = con2.createStatement();
			String str = "SELECT * FROM LineSystem.Train_Schedule";
			ResultSet rs2 = stmt2.executeQuery(str);
			
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
				<td><b>Line Detail</b></td>	
			</tr>	
			<% 
			while(rs2.next()) {
				%>
				<tr>
				<form method="post" action="BroSeaDetail.jsp">
				<input type="hidden" name="username" value = "<%=request.getParameter("username")%>" readonly>
				<td><input type="text" name="Line" value =<%=rs2.getString("line_name")%> readonly></td>
				<td><%= rs2.getString("date")%></td>
				<td><%= rs2.getString("origin_s_name")%></td>
				<td><%= rs2.getString("dest_s_name")%></td>
				<td><%
				if(rs2.getString("departure_time")!=null&& !(rs2.getString("departure_time")).equals("00:00:00")){
					out.print(rs2.getString("departure_time"));
				};
				%>
				</td>
				<td><%
				if(rs2.getString("arrive_time")!=null&& !(rs2.getString("arrive_time")).equals("00:00:00")){
					out.print(rs2.getString("arrive_time"));
				};
				%>
				</td>
				<td><%= rs2.getString("total_fare")+"$"%></td>
				<td><input type="submit" value="detail">
				</form>	
				</td>
				</tr>
					
				
				<% }
			//close the connection.
			db2.closeConnection(con2);
			%>
<%
		
%>	

</body>
</html>