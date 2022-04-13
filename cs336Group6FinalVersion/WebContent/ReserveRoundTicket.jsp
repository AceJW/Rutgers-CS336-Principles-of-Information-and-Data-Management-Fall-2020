<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1" import="com.cs336.pkg.*"%>
<!--Import some libraries that have classes that we need -->
<%@ page import="java.io.*,java.util.*,java.sql.*"%>
<%@ page import="javax.servlet.http.*,javax.servlet.*"%>
<!DOCTYPE>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Reserve Page</title>
</head>
<body>
	<%
		try {
			//Get the database connection
			ApplicationDB5 db = new ApplicationDB5();	
			Connection con = db.getConnection();

			//Create a SQL statement
			Statement stmt = con.createStatement();
			
			stmt = con.createStatement();
			String reserve_num = request.getParameter("reserve_num");
			String username = request.getParameter("username");
			String linename = request.getParameter("line");
			String date = request.getParameter("date");
			String origin = request.getParameter("origin");
			String departTime= request.getParameter("departArray");
			String dest = request.getParameter("dest");
			String arriveTime = request.getParameter("arriveArray");
			String stops = request.getParameter("stops");
			String fare = request.getParameter("fare");
			String state = "in_progress";
			//Make an insert statement for the login in blanks:
			String query2 = "INSERT INTO Have_Reservation(reserve_num, username, line_name, date, origin,departure_time,dest, arrive_time,stop_num, fare, state, one_or_round_way)"
					+ "VALUES (?, ?, ?, ?, ?, ? , ? , ? , ? , ? , ?, ?)";
			//Get parameters from the HTML form
			PreparedStatement ps2 = con.prepareStatement(query2);
			ps2.setString(1, reserve_num);
			ps2.setString(2, username);
			ps2.setString(3, linename);
			ps2.setString(4, date);
			ps2.setString(5, origin);
			ps2.setString(6, departTime);
			ps2.setString(7, dest);
			ps2.setString(8, arriveTime);
			ps2.setString(9, stops);
			ps2.setString(10, fare);
			ps2.setString(11, state);
			ps2.setString(12, "round_way");
			ps2.execute();
			String update = "UPDATE Have_Reservation SET one_or_round_way = ? where reserve_num = ?";
			//Close the connection. Don't forget to do it, otherwise you're keeping the resources of the server allocated.
			PreparedStatement ps = con.prepareStatement(update);
			ps.setString(1, "round_way");
			ps.setString(2, reserve_num);
			ps.execute();
			con.close();
		} catch (Exception ex) {
			out.print(ex);
		}
	%>
<form method="get" action="ShoppingCart.jsp">
	<br>
		<input type="hidden" name="username" value = "<%=request.getParameter("username")%>" readonly>
		<%
			response.sendRedirect("ShoppingCart.jsp?username="+request.getParameter("username"));
		%>
	<br />
</form>
</body>
</html>