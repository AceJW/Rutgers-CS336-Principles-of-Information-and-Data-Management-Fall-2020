<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1" import="com.cs336.pkg.*"%>
<!--Import some libraries that have classes that we need -->
<%@ page import="java.io.*,java.util.*,java.sql.*"%>
<%@ page import="javax.servlet.http.*,javax.servlet.*"%>
<!DOCTYPE>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>SearchResult</title>
</head>
<body>
<%
	String question1 = "";
	String answer1 = "";
	ArrayList<String> qa = new ArrayList<String>();
	try {
		   //Get the database connection
		   ApplicationDB2 db = new ApplicationDB2(); 
		   Connection con = db.getConnection();
		   
		   //Get parameters from the HTML form
		   String search = request.getParameter("Search");
		   //Create a SQL statement
		   Statement stmt = con.createStatement();
		
		   //Make an insert statement for the login in blanks:
		   String query = "SELECT * FROM AllQuestions";
		   
		   //Create a Prepared SQL statement allowing you to introduce the parameters of the query
		   PreparedStatement ps = con.prepareStatement(query);
		
		   
		   //Run the query against the DB
		   ResultSet rs = ps.executeQuery();
		   
		   
		   while(rs.next()) {
		     question1 = rs.getString("question");
		     answer1 = rs.getString("answer");
		     if(question1.toLowerCase().contains(search))
		     {
		    	 qa.add(question1);
		    	 qa.add(answer1);
		     }
		     
		   }
		   
		   
		
		   //Close the connection. Don't forget to do it, otherwise you're keeping the resources of the server allocated.
		   con.close();
	}
	catch (Exception ex) {
		   	out.print(ex);  
		  }
%>
		
	<br><b>Search Result</b><br />
	<table border = "2" style="width: 100%;">
		 <%
		  int count2 = 1;
		  int count = 1;
		  for(String question: qa)
		  {
		    if(count == 1)
		    {
		    
		 %> 
		 	<tr>
		  		<td><%=count2%>.Question:</td>
		  		<td width="85%"><%=question %></td>
			</tr>
		     
		 <%	
		    }
		    else
		    {
		    	%>
		    	<tr>
			  		<td>Answer:</td>
			  		<td width="85%"><%=question %></td>
				</tr>
		    	<%
		    	count2++;
		    	count = 0;	
		    }
		    count++;
		  }
		 %>
	</table>	
	
<form method="get" action="questions.jsp">
	<br>
		<input type="hidden" name="username" value = "<%=request.getParameter("username")%>" readonly>
		<input type="submit" value="Back to Questions Page">
	<br />
</form>
</body>
</html>