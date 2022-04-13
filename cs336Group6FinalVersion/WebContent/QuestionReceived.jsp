<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1" import="com.cs336.pkg.*"%>
<%@ page import="java.io.*,java.util.*,java.sql.*"%>
<%@ page import="javax.servlet.http.*,javax.servlet.*" %>

<!DOCTYPE>
<html>
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
		<title>Question Received</title>
	</head>
<body>
						  

<%
		
		try {

			//Get the database connection
		   ApplicationDB2 db = new ApplicationDB2(); 
		   Connection con = db.getConnection();
		   
		   //Create a SQL statement
		   Statement stmt = con.createStatement();
		   
		   //Get parameters from the HTML form at the questions.jsp
		   String NewQuestion = request.getParameter("NewQuestion");
		   String answer = "";
		   
		   String query = "SELECT * FROM AllQuestions where question = ?";
		   PreparedStatement q= con.prepareStatement(query);
		   
		   q.setString(1, NewQuestion);
		   ResultSet rs = q.executeQuery();
		   boolean exist = false;
			
			while(rs.next()) {
				exist = !rs.wasNull();
			}
			if (!exist)
			{
				
		   
			   //Make an insert statement for the Sells table:
			   String insert = "INSERT INTO AllQuestions(question, answer)"
				+ "VALUES (?, ?)";
			   
			   //Create a Prepared SQL statement allowing you to introduce the parameters of the query
			   PreparedStatement ps = con.prepareStatement(insert);
			   
			   //Add parameters of the query. Start with 1, the 0-parameter is the INSERT statement itself
			   ps.setString(1, NewQuestion);
			   ps.setString(2, answer);
			   ps.executeUpdate();
			   con.close();
			   response.sendRedirect("questions.jsp?username="+request.getParameter("username"));
			}
		   con.close();
			
		}catch (Exception ex) {
			out.print(ex);
		}
		
		%>
	<h1>The Question You Are Asking Is Already Exists</h1>	
		

	  
<form method="post" action="questions.jsp">
	<br>
		<input type="hidden" name="username" value = "<%=request.getParameter("username")%>" readonly>
		<input type="submit" value="Back to Questions Page">
	<br />
</form>

</body>
</html>