<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1" import="com.cs336.pkg.*"%>
<!--Import some libraries that have classes that we need -->
<%@ page import="java.io.*,java.util.*,java.sql.*"%>
<%@ page import="javax.servlet.http.*,javax.servlet.*"%>
<!DOCTYPE>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Customer Service</title>
</head>
<body>
<h1>Customer Service</h1>
<h2>Customer List Based on Train And Date (completed reservation only)</h2>
	<%
		try {

			//Get the database connection
			ApplicationDB5 db = new ApplicationDB5();	
			Connection con = db.getConnection();

			//Create a SQL statement
			Statement stmt = con.createStatement();

			//Get parameters from the HTML form
			String line_name = request.getParameter("line");
			String date = request.getParameter("date");
	
			//Make an insert statement for the login in blanks:
			String query = "SELECT distinct username FROM Have_Reservation WHERE line_name = ? AND date = ? AND state = ?";
			
			//Create a Prepared SQL statement allowing you to introduce the parameters of the query
			PreparedStatement ps = con.prepareStatement(query);

			//Add parameters of the query. Start with 1, the 0-parameter is the INSERT statement itself
			ps.setString(1, line_name);
			ps.setString(2, date);
			ps.setString(3, "complete");
			//Run the query against the DB
			ResultSet rs = ps.executeQuery();
			%>
			<table border = "1" >
			<tr><td>Customer list of <%=line_name%> on <%=date%></td></tr>
			<%
			while(rs.next()) {
				%>
				<tr><td>Customer: <%=rs.getString("username")%></td></tr>
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
<form method="get" action="TSeditor.jsp">
	<br>
		<input type="submit" value="Back to Customer Service Page">
	<br />
</form>
</body>
</html>