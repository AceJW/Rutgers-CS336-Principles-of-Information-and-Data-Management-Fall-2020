
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"
    import="com.cs336.pkg.*"%>
<%@ page import="java.io.*,java.util.*,java.sql.*"%>
<%@ page import="javax.servlet.http.*,javax.servlet.*"%>
<%@ page import="java.util.ArrayList" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
</head>
<body>		
			<h1>Sales Reports By Year/Month</h1>	
<% 			ApplicationDB5 db = new ApplicationDB5();	
			Connection con = db.getConnection();
			String year = request.getParameter("Year");
			String month = request.getParameter("month");
				
			Statement stmt = con.createStatement(); 
			ResultSet rs = stmt.executeQuery("SELECT sum(fare) as sum FROM ReservationSystem.Have_Reservation where year(date)='"+year+"' and month(date)='"+month+"' and state = 'complete'");
			double total=0;
				%><table border = "3" width="100%">
				 	<tr>	  
					<td>Total Revenue</td>	
				  	</tr>	   
				<%					 
				  while(rs.next()){%>	
				  	<tr>	  
					<td><%=rs.getString("sum")%></td>	
				  	</tr>	   
				  <%}			
		    	
				db.closeConnection(con);

			
			%>
			</table><br><br>
			<form method="get" action="SaleReport.jsp">
		<input type="submit" value="Choose another month to see sales report">
	</form>
	<br><br>
		<form method="get" action="homeAdmin.jsp">
		<input type="submit" value="Go back to Admin home">
	</form>
		
</body>
</html>