<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1" import="com.cs336.pkg.*"%>
<%@ page import="java.io.*,java.util.*,java.sql.*"%>
<%@ page import="javax.servlet.http.*,javax.servlet.*" %>

<!DOCTYPE>
<html>
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
		<title>Cancel Reservation</title>
	</head>
<body>
									  
<%
 
	  try {
		  ApplicationDB5 db = new ApplicationDB5(); 
		  Connection con = db.getConnection();	  
		  Statement stmt = con.createStatement();
		  String reserve_num = request.getParameter("reserve_num");
		  String delete = "delete from Have_Reservation where reserve_num = ?";
		  PreparedStatement ps = con.prepareStatement(delete);
		  ps.setString(1, reserve_num);	  
		  ps.executeUpdate(); 
		  con.close();
		  
		  response.sendRedirect("ViewCompleteReservations.jsp?username="+request.getParameter("username"));
	  } catch (Exception ex) {
	   	out.print(ex);  
	  }
	%>




</body>
</html>