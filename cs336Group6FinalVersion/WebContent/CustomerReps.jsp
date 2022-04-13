<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1" import="com.cs336.pkg.*"%>
<!--Import some libraries that have classes that we need -->
<%@ page import="java.io.*,java.util.*,java.sql.*"%>
<%@ page import="javax.servlet.http.*,javax.servlet.*"%>
<!DOCTYPE>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Customer Representative</title>
</head>
<body>

<h1>Customer Service</h1>

	<%
	 String question1 = "";
	 String answer1 = "";
	 ArrayList<String> q = new ArrayList<String>();
	 ArrayList<String> a = new ArrayList<String>();
	 String[] qs = new String[1];
	 String[] as = new String[1];
	  try {
	
		   //Get the database connection
		   ApplicationDB2 db = new ApplicationDB2(); 
		   Connection con = db.getConnection();
		   
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
		     if(answer1.equals(""))
		     {
		    	 q.add(question1);
			     a.add(answer1);
		     }
		   }
		   qs = new String[q.size()];
		   as = new String[a.size()];
		   int tempCount = 0;
		   for(String s: q)
		   {
			   qs[tempCount] = s;
			   tempCount++;
		   }
		   tempCount = 0;
		   for(String s: a)
		   {
			   as[tempCount] = s;
			   tempCount++;
		   }
		
		   //Close the connection. Don't forget to do it, otherwise you're keeping the resources of the server allocated.
		   con.close();
	  
	  } catch (Exception ex) {
	   	out.print(ex);  
	  }
	%>
	<br><b>Unanswered Question</b><br />
	<table border = "2" width="100%">
		 <%
		    for(int i = 0; i < q.size();i++)
		    {
		    
   		%>
	    			
	   			<form method="get" action="ReplySuccess.jsp">
	   				<tr>
				  		<td><%=i+1%>.Question:</td>
				  		<td width="85%">
				  		<input size="110" type="text" name="OldQuestion" value = "<%=qs[i]%>" readonly>
				  		</td>
					</tr>
		   			<tr>
		   				<td>Answer:</td>
		   				<td width="85%">
							<input size="60" type="text" name="NewAnswer" required>
							<input type="submit" value="Reply"> 
						</td>
					</tr>
					
				</form>
   		<%
		    }
		%>
	</table>	
	
<form method="get" action="TSeditor.jsp">
	<br>
		<input type="submit" value="BackToEdit">
	<br />
</form>	
<form method="get" action="index.jsp">
	<br>
		<input type="submit" value="Log Out">
	<br />
</form>
</body>
</html>