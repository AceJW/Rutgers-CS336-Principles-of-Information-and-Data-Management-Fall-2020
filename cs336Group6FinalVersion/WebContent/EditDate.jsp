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
<h1>Customer Service</h1>									  
<%
	  boolean flag = false;
 
	  try {
		  ApplicationDB4 db = new ApplicationDB4(); 
		  Connection con = db.getConnection();
		  
		  Statement stmt = con.createStatement();
		  String line = request.getParameter("line");
		  String date = request.getParameter("date");
		  String origindate = request.getParameter("origindate");
		  String string = "select * from Train_Schedule where line_name = ?";
		  PreparedStatement ps2 = con.prepareStatement(string);
		  ps2.setString(1, line);
		  ResultSet rs2 = ps2.executeQuery();
		  while(rs2.next())
		  {
			  if((rs2.getString("date")).equals(date))
			  {
				  flag = true;
			  }
		  }
		  if(!flag)
		  {
			  String update = "UPDATE Train_Schedule SET  date = ? where line_name = ? AND date = ?";
			  PreparedStatement ps = con.prepareStatement(update);
			  
			  ps.setString(1, date);
			  ps.setString(2, line);
			  ps.setString(3, origindate);
			  ps.executeUpdate();
			  con.close();
			  response.sendRedirect("TSeditor.jsp");
		  }
		  else
		  {
			  %>
			  <h2>The Line Already Exists In The Date You Inputed<h2>
			  <%
		  }
		  
		  
		  con.close();
	  } catch (Exception ex) {
	   	out.print(ex);  
	  }
	%>
<form method="get" action="TSeditor.jsp">
	<br>
		
		<input type="submit" value="Back To Customer Representative Main Page">
	<br />
</form>



</body>
</html>