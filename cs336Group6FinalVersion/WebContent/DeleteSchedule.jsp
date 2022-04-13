<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1" import="com.cs336.pkg.*"%>
<%@ page import="java.io.*,java.util.*,java.sql.*"%>
<%@ page import="javax.servlet.http.*,javax.servlet.*" %>

<!DOCTYPE>
<html>
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
		<title>Edit Date</title>
	</head>
<body>
									  
<%
 
	  try {
		  ApplicationDB4 db = new ApplicationDB4(); 
		  Connection con = db.getConnection();	  
		  Statement stmt = con.createStatement();
		  String line = request.getParameter("lineArray");
		  String date = request.getParameter("dateArray");
		  String delete = "delete from Train_Schedule where line_name = ? AND date = ?";
		  PreparedStatement ps = con.prepareStatement(delete);
		  ps.setString(1, line);	  
		  ps.setString(2, date);
		  ps.executeUpdate(); 
		  
		  con.close();
		  
		  response.sendRedirect("ScheduleDeletion.jsp");
	  } catch (Exception ex) {
	   	out.print(ex);  
	  }
	%>




</body>
</html>