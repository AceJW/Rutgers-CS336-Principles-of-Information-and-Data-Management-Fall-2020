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
	 String line = "";
	 String date ="";
	 ArrayList<String> sid = new ArrayList<String>();
	 ArrayList<String> sname = new ArrayList<String>();
	 ArrayList<String> sindex = new ArrayList<String>();
	 ArrayList<String> arr = new ArrayList<String>();
	 ArrayList<String> dpt = new ArrayList<String>();
	 String[] sidArray = new String[1];
	 String[] snameArray = new String[1];
	 String[] sindexArray = new String[1];
	 String[] arrArray = new String[1];
	 String[] dptArray = new String[1];
	  try {
	
		   //Get the database connection
		   ApplicationDB4 db = new ApplicationDB4(); 
		   Connection con = db.getConnection();
		   
		   //Create a SQL statement
		   Statement stmt = con.createStatement();
		   
		   line = request.getParameter("lineArray");
		   String tid = request.getParameter("tidArray");
		   String  origin= request.getParameter("originArray");
		   String  dest= request.getParameter("destArray");
		   date = request.getParameter("dateArray");
		   String  depTime= request.getParameter("depTimeArray");
		   String  arrTime= request.getParameter("arrTimeArray");
		   
		   
		   //Make an insert statement for the login in blanks:
		   String query = "SELECT * FROM Line_has_station WHERE line_name = ? ORDER BY station_index";
		   
		   //Create a Prepared SQL statement allowing you to introduce the parameters of the query
		   PreparedStatement ps = con.prepareStatement(query);
			
		   ps.setString(1, line);
		   
		   //Run the query against the DB
		   ResultSet rs = ps.executeQuery();
		   
		   
		   while(rs.next()) {
			 sid.add(rs.getString("station_sid"));
			 sname.add(rs.getString("s_name"));
			 sindex.add(rs.getString("station_index"));
			 arr.add(rs.getString("arrive_to_station_time")); 
			 dpt.add(rs.getString("departure_from_station_time")); 
		     
		   }
		   sidArray = new String[sid.size()+2];
		   snameArray = new String[sid.size()+2];
		   sindexArray = new String[sid.size()+2];
		   arrArray = new String[sid.size()+2];
		   dptArray = new String[sid.size()+2];
		   int tempCount = 0;
		   for(String s: sid)
		   {
			   sidArray[tempCount] = s;
			   tempCount++;
		   }
		   tempCount = 0;
		   for(String s: sname)
		   {
			   snameArray[tempCount] = s;
			   tempCount++;
		   }
		   tempCount = 0;
		   for(String s: sindex)
		   {
			   sindexArray[tempCount] = s;
			   tempCount++;
		   }
		   tempCount = 0;
		   for(String s: arr)
		   {
			   arrArray[tempCount] = s;
			   tempCount++;
		   }
		   tempCount = 0;
		   for(String s: dpt)
		   {
			   dptArray[tempCount] = s;
			   tempCount++;
		   }
		   
		
		   //Close the connection. Don't forget to do it, otherwise you're keeping the resources of the server allocated.
		   con.close();
	  
	  } catch (Exception ex) {
	   	out.print(ex);  
	  }
	%>
	<br><b>Line Details</b><br />
	
	<table border = "6">
	<tr>
		<td>Line Name:
			<%=line%>
		</td>
		<td>Station ID</td>
		<td>Station Name</td>
		<td>Arrive Time</td>
		<td>Departure Time</td>
		<td></td>
	</tr>
		 <%
	      for(int i = 0; i < sid.size();i++)
	      {
	     %>
		     <form method="get" action="EditTime.jsp">
			       <tr>
			       		<td>
							<input type="hidden" name="line" value = "<%=line%>" readonly>
						</td>
						
						<%
						if(i == 0)
						{
							%>
							<td>
				        		<input type="text" name="sidArray" value = "Origin: <%=sidArray[i]%>" readonly>
				        	</td>
							<%
						}
						else if(i == sid.size()-1)
						{
							%>
							<td>
				        		<input type="text" name="sidArray" value = "Destination: <%=sidArray[i]%>" readonly>
				        	</td>
							<%
						}
						else
						{
							%>
							<td>
				        		<input type="text" name="sidArray" value = "Stop<%=sindexArray[i]%>:<%=sidArray[i]%>" readonly>
				        	</td>
							<%
						}
						%>
				        <td>
				        		<input type="text" name="snameArray" value = "<%=snameArray[i]%>" readonly>
				        </td>
				        <td >
				          	<%
				          	if(arrArray[i] == null||arrArray[i].equals("00:00:00"))
				          	{
				          		%>
				          			<input type="text" name="arrArray" value = "" readonly>
				          		<%
				          	}
				          	else
				          	{
				          	%>
				        		<input type="text" name="arrArray" value = "<%=arrArray[i]%>">
				        	<%
				          	}
				        	%>
				        </td>
				        <td >
				        	<%
				        	if(dptArray[i] == null||dptArray[i].equals("00:00:00"))
				        	{
				        	%>
				        		<input type="text" name="dptArray" value = "" readonly>
				        	<%
				        	}
				        	else
				        	{
				        	%>
				        		<input type="text" name="dptArray" value = "<%=dptArray[i]%>">
				        	<%
				        	}
				        	%>
				        </td>
				        <td><input type="submit" value="submit"></td>
			     	</tr>
		    </form>
	     <%
	      }
	  %>
	  <tr>
		<form method="get" action="EditDate.jsp">
			<td>
				<input type="hidden" name="line" value = "<%=line%>" readonly>
			</td>
			<td></td>
			<td></td>
			<td></td>
			<td>Date:
				<input type="hidden" name="origindate" value = "<%=date%>">
				<input type="text" name="date" value = "<%=date%>">
			</td>
			<td><input type="submit" value="submit"></td>
		</form>
	</tr>
	</table>	
	
	
<form method="get" action="TSeditor.jsp">
	<br>
		
		<input type="submit" value="Back To Overview Page">
	<br />
</form>
</body>
</html>