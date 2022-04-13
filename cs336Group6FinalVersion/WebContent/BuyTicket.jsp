<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1" import="com.cs336.pkg.*"%>
<!--Import some libraries that have classes that we need -->
<%@ page import="java.io.*,java.util.*,java.sql.*"%>
<%@ page import="javax.servlet.http.*,javax.servlet.*"%>
<!DOCTYPE>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Thanks For Purchasing</title>
</head>
<body>
<h1>You Have Bought The Ticket Successfully</h1>

	<%
		try {
			boolean flag1 = false;
			boolean flag2 = false;
			int age = 0;
			String disable = "";
			String username = request.getParameter("username");
			String reserve_num = request.getParameter("reserve_num");
			String one_or_round_way = request.getParameter("one_or_round_way");
			double fare = Double.parseDouble(request.getParameter("fare"));
			ApplicationDB db2 = new ApplicationDB();
			Connection con2 = db2.getConnection();
			Statement stmt2 = con2.createStatement();
			String query2 = "SELECT * FROM Customer WHERE username = ?";
			PreparedStatement ps2 = con2.prepareStatement(query2);
			ps2.setString(1, username);
			ResultSet rs2 = ps2.executeQuery();
			while(rs2.next()) {
				age = Integer.parseInt(rs2.getString("age"));
				disable = rs2.getString("disable");
			}
			if(one_or_round_way.equals("round_way"))
			{
				fare = fare*2;
				%>
				<br><b>Your Fare Doubles Because You Are Buying Round Way Trip Ticket</b><br />
				<%
			}
			
			if(age < 12 || age > 70)
			{
				fare = fare * 0.8;
				flag1 = true;
			}
			if(disable.equals("yes"))
			{
				fare = fare * 0.8;
				flag2 = true;
			}
			
			if(flag1)
			{
				%>
				<br><b>You Got A Discount Because Of Your Age: <%=age%></b><br />
				<%
			}
			if(flag2)
			{
				%>
				<br><b>You Got A Discount Because You Are A Disabled</b><br />
				<%
			}
			%>
			<br><b>You Have Paid: $<%=fare%> </b><br />
			<%
			if(one_or_round_way.equals("round_way"))
			{
				fare = fare/2;
			}
			con2.close();
			//Get the database connection
			ApplicationDB5 db = new ApplicationDB5();	
			Connection con = db.getConnection();

			//Create a SQL statement
			Statement stmt = con.createStatement();

			//Get parameters from the HTML form
			
			//Make an insert statement for the login in blanks:
			String query = "UPDATE Have_Reservation SET  fare = ?, state = ? where reserve_num = ?";
			
			//Create a Prepared SQL statement allowing you to introduce the parameters of the query
			PreparedStatement ps = con.prepareStatement(query);

			//Add parameters of the query. Start with 1, the 0-parameter is the INSERT statement itself
			ps.setString(1, String.valueOf(fare));
			ps.setString(2, "complete");
			ps.setString(3, reserve_num);
			//Run the query against the DB
			ps.executeUpdate();
			
			//Close the connection. Don't forget to do it, otherwise you're keeping the resources of the server allocated.
			con.close();
		
		} catch (Exception ex) {
			out.print(ex);
		}
	%>
<form method="get" action="ShoppingCart.jsp">
	<br>
		<input type="hidden" name="username" value = "<%=request.getParameter("username")%>" readonly>
		<input type="submit" value="Back To Shopping Cart">
	<br />
</form>
</body>
</html>