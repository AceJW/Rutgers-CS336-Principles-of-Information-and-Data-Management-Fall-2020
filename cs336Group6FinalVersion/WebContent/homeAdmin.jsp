<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1" import="com.cs336.pkg.*"%>
<%@ page import="java.io.*,java.util.*,java.sql.*"%>
<%@ page import="javax.servlet.http.*,javax.servlet.*"%>

<!DOCTYPE>
<html>
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
		<title>Administrator Dashboard</title>
	</head>
	<body>
	<h1>Administrator Dashboard</h1>	
	<br>
	
	<table border = "3">
	<tr>
	<td><b>Sale report </b></td>
	<td><b>Reservetion Lists by </b></td>
	<td><b>Listing of Revenue by </b></td>
	<td><b>Best Customer</b></td>	
	</tr>
	<tr>
	<td>
		<br>
		<br>
		<form method="get" action="SaleReport.jsp">
		<input type="submit" value="Sales report">
		</form>
		<br>
	</td>
	<td>
		<form method="get" action="ReserveByLine.jsp">
		<input type="submit" value="Trainsit Line">
	</form>
		<form method="get" action="ReserveByCustomer.jsp">
		<input type="submit" value="Customer">
		</form>
	</td>
	<td>
		<form method="get" action="RevByLine.jsp">
		<input type="submit" value="Trainsit Line">
		</form>
		<form method="get" action="RevByCus.jsp">
		<input type="submit" value="Customer">
		</form>
	</td>
	<td>
		<br>
		<br>
		<form method="get" action="BestCustomer.jsp">
		<input type="submit" value="Best customer">
		</form>
		<br>
	</td>
	</tr>
	</table>
	<br>
	<b>Best 5 Most Active Transit Lines per Month: </b>
	<br>
	
	<form method="get" action="top5.jsp">
		<b>Year: </b>
		<input size="20" type="number" name="Year" min ="1900"max ="2200" placeholder="2021" maxlength='4'  required>
		<b>Month: </b>
		<input size="20" type="number" name="Month" min ="1"max ="12" placeholder="09" maxlength='2'  required>

		
		<input type="submit" value="search">
		</form>
	<br />
		<% try {
			
			//Get the database connection
			ApplicationDB db = new ApplicationDB();	
			Connection con = db.getConnection();		

			//Create a SQL statement
			Statement stmt = con.createStatement();
			//Get the selected radio button from the index.jsp
			//entity is from the index

			//Make a SELECT query from the table specified by the 'command' parameter at the index.jsp
			//str will look like SELECT * FROM beers
			String str = "SELECT * FROM RailwayBooking.Employee where username not like '%admin'";
			//Run the query against the database.
			
			ResultSet rs = stmt.executeQuery(str);
				 
		%>
		<b>Customer Representative List</b>
		<table border = "8" width="100%">
			<tr> 
				<td><b>SSN</b></td>
				<td><b>First Name</b></td>
				<td><b>Last Name</b></td>
				<td><b>Username</b></td>
				<td><b>Password</b></td>
				
				<td><b>edit</b></td>
				<td><b>delete</b></td>
			</tr>		 
			<%while(rs.next()) {
				%>
				
				<tr>
				<form method="post" action="CReditor.jsp">
				<td><input type="text" name="SSN" value = "<%=rs.getString("ssn")%>" readonly></td>
				<td><input type="text" name="FirstName" value = "<%=rs.getString("firstName")%>"  required></td>
				<td><input type="text" name="LastName" value = "<%=rs.getString("lastName")%>"  required></td>
				<td><input type="text" name="UserName" value = "<%=rs.getString("username")%>"  required></td>
				<td><input type="text" name="Password" value = "<%=rs.getString("password")%>"  required></td>
				<td><input type="submit" name="Edit" value="edit"></td>
				<td><input type="submit" name="Delete" value="delete"></td>
				</form>
				</tr>			
				<% }
			
			%><tr>
			  <td>
			  <form method="post" action="CReditor.jsp">
			  <input type="text" name="SSN" placeholder="xxx-xx-xxxx" maxlength='9'  required></td>
			  <td><input type="text" name="FirstName" placeholder="Alan"  required></td>
			  <td><input type="text" name="LastName" placeholder="Turing"  required></td>
			  <td><input type="text" name="UserName" placeholder="cxx"  required></td>
			  <td><input type="text" name="Password" placeholder="xxxxxx"  required></td>
			  <td colspan="2"><input type="submit" name="Add" value="add" style="width:200px;">
			  </form>
			  </td>
			  </tr>
			<%
			//close the connection.
			db.closeConnection(con);
			%>
		</table>

		<%} catch (Exception e) {
			out.print(e);
		}%>
		
		<br>
		<form method="get" action="index.jsp">
		<input type="submit" value="Log Out">
		</form>
	</body>
</html>