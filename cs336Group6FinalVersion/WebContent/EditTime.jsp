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
	  boolean isOrigin = false;
	  boolean isDest = false;
	  try {
		  ApplicationDB4 db = new ApplicationDB4(); 
		  Connection con = db.getConnection();
		  
		  Statement stmt = con.createStatement();
		  String line = request.getParameter("line");
		  String sid = request.getParameter("sidArray");
		  String sname = request.getParameter("snameArray");
		  String arrt = request.getParameter("arrArray");
		  String dept = request.getParameter("dptArray");
		 
		  String update = "UPDATE Line_has_station SET arrive_to_station_time = ?, departure_from_station_time = ? where line_name = ? AND s_name = ?";
		  PreparedStatement ps = con.prepareStatement(update);
		  ps.setString(1, arrt);
		  ps.setString(2, dept);
		  ps.setString(3, line);
		  ps.setString(4, sname);
		  ps.executeUpdate();
		  if(sid.contains("Origin"))
		  {
			  isOrigin = true;
			  sid = sid.substring(7);
			  out.print(sid);
		  }
		  else if(sid.contains("Destination"))
		  {
			  isDest = true;
			  sid = sid.substring(12);
			  out.print(sid);
		  }
		  else
		  {
			  int temp = sid.indexOf(":");
			  sid = sid.substring(temp+1);
		  }
		  
		  con.close();
		  if(!isOrigin && !isDest)
		  {
			  response.sendRedirect("TSeditor.jsp");
		  }
		  else 
		  {
			  db = new ApplicationDB4(); 
			  con = db.getConnection();
			  stmt = con.createStatement();
			  if(isOrigin)
			  {
				  update = "UPDATE Train_Schedule SET departure_time = ? where line_name = ?";
				  ps = con.prepareStatement(update);
				  ps.setString(1, dept);
				  ps.setString(2, line);
			  }
			  else if(isDest)
			  {
				  update = "UPDATE Train_Schedule SET arrive_time = ? where line_name = ?";
				  ps = con.prepareStatement(update);
				  ps.setString(1, arrt);
				  ps.setString(2, line);
			  }
			  ps.executeUpdate();
			  
		  }
		  con.close();
		  response.sendRedirect("TSeditor.jsp");
	  } catch (Exception ex) {
	   	out.print(ex);  
	  }
	  
	%>




</body>
</html>