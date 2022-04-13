<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1" import="com.cs336.pkg.*"%>
<%@ page import="java.io.*,java.util.*,java.sql.*"%>
<%@ page import="javax.servlet.http.*,javax.servlet.*" %>

<!DOCTYPE>
<html>
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
		<title>Replied Successfully</title>
	</head>
<body>
									  
<%
 
	  try {
		  ApplicationDB2 db = new ApplicationDB2(); 
		  Connection con = db.getConnection();
		  
		  Statement stmt = con.createStatement();
		  String OldQuestion = request.getParameter("OldQuestion");
		  String NewAnswer = request.getParameter("NewAnswer");
		 
		  String update = "UPDATE AllQuestions SET  answer = ? where question = ?";
		  PreparedStatement ps = con.prepareStatement(update);
		  
		  ps.setString(1, NewAnswer);
		  ps.setString(2, OldQuestion);
		  ps.executeUpdate();
		  
		  con.close();
		  response.sendRedirect("CustomerReps.jsp");
	  } catch (Exception ex) {
	   	out.print(ex);  
	  }
	%>




<form method="post" action="CustomerReps.jsp">
	<br>
		<input type="submit" value="Back to Questions Page">
	<br />
</form>

</body>
</html>