<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1" import="com.cs336.pkg.*"%>
<!--Import some libraries that have classes that we need -->
<%@ page import="java.io.*,java.util.*,java.sql.*"%>
<%@ page import="javax.servlet.http.*,javax.servlet.*"%>
<!DOCTYPE>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>createAccount</title>
</head>
<body>
	<%
		try {

			//Get the database connection
			ApplicationDB db = new ApplicationDB();	
			Connection con = db.getConnection();

			//Create a SQL statement
			Statement stmt = con.createStatement();

			//Get parameters from the HTML form at the index.jsp
			String firstName = request.getParameter("firstName");
			String lastName = request.getParameter("lastName");
			String emailAddress = request.getParameter("emailAddress");
			String username = request.getParameter("username");
			String password = request.getParameter("password");
			String age = request.getParameter("age");
			String disable = request.getParameter("command");


			//Make an insert statement for the Sells table:
			String insert = "INSERT INTO Customer(firstName, lastName, emailAddress, username, password,age, disable)"
			+ "VALUES (?, ?, ?, ?, ?, ?, ?)";
			
			//Create a Prepared SQL statement allowing you to introduce the parameters of the query
			PreparedStatement ps = con.prepareStatement(insert);

			//Add parameters of the query. Start with 1, the 0-parameter is the INSERT statement itself
			ps.setString(1, firstName);
			ps.setString(2, lastName);
			ps.setString(3, emailAddress);
			ps.setString(4, username);
			ps.setString(5, password);
			ps.setString(6, age);
			ps.setString(7, disable);

			ps.executeUpdate();
			
			//Close the connection. Don't forget to do it, otherwise you're keeping the resources of the server allocated.
			con.close();
			out.print(username + " Account created!");
			
		} catch (Exception ex) {
			out.print("Username exist!");
		}
	%>
	
<form method="get" action="index.jsp">
	<br>
		<input type="submit" value="Back to Login Page">
	<br />
</form>

</body>
</html>