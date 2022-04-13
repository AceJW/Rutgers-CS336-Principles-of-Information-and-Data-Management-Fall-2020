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
<h3>Search Result</h3>

	<%
	 ArrayList<String> l = new ArrayList<String>();
	 ArrayList<String> t = new ArrayList<String>();
	 ArrayList<String> o = new ArrayList<String>();
	 ArrayList<String> d = new ArrayList<String>();
	 ArrayList<String> dateList = new ArrayList<String>();
	 ArrayList<String> dt = new ArrayList<String>();
	 ArrayList<String> at = new ArrayList<String>();
	 String[] lineArray = new String[1];
	 String[] tidArray = new String[1];
	 String[] originArray = new String[1];
	 String[] destArray = new String[1];
	 String[] dateArray = new String[1];
	 String[] depTimeArray = new String[1];
	 String[] arrTimeArray = new String[1];
	 ArrayList<String> l2 = new ArrayList<String>();
	 ArrayList<String> t2 = new ArrayList<String>();
	 ArrayList<String> o2 = new ArrayList<String>();
	 ArrayList<String> d2 = new ArrayList<String>();
	 ArrayList<String> dateList2 = new ArrayList<String>();
	 ArrayList<String> dt2 = new ArrayList<String>();
	 ArrayList<String> at2 = new ArrayList<String>();
	 String[] lineArray2 = new String[1];
	 String[] tidArray2 = new String[1];
	 String[] originArray2 = new String[1];
	 String[] destArray2 = new String[1];
	 String[] dateArray2 = new String[1];
	 String[] depTimeArray2 = new String[1];
	 String[] arrTimeArray2 = new String[1];
	  try {
	
		   //Get the database connection
		   ApplicationDB4 db = new ApplicationDB4(); 
		   Connection con = db.getConnection();
		   
		   //Create a SQL statement
		   Statement stmt = con.createStatement();
		
		   //Make an insert statement for the login in blanks:
		   String query = "SELECT * FROM Train_Schedule";
		   
		   //Create a Prepared SQL statement allowing you to introduce the parameters of the query
		   PreparedStatement ps = con.prepareStatement(query);
		
		   
		   //Run the query against the DB
		   ResultSet rs = ps.executeQuery();
		   
		   String produceList = request.getParameter("produceList");
		   
		   while(rs.next()) {
			   if(produceList.equals(rs.getString("origin_s_name")))
			   {
				     l.add(rs.getString("line_name"));
				     t.add(rs.getString("tid"));
				     o.add(rs.getString("origin_s_name"));
				     d.add(rs.getString("dest_s_name")); 
				     dateList.add(rs.getString("date")); 
				     dt.add(rs.getString("departure_time"));
				     at.add(rs.getString("arrive_time"));
			   }
			   else if(produceList.equals(rs.getString("dest_s_name")))
			   {
				     l2.add(rs.getString("line_name"));
				     t2.add(rs.getString("tid"));
				     o2.add(rs.getString("origin_s_name"));
				     d2.add(rs.getString("dest_s_name")); 
				     dateList2.add(rs.getString("date")); 
				     dt2.add(rs.getString("departure_time"));
				     at2.add(rs.getString("arrive_time"));
			   }
		     
		   }
		   lineArray = new String[l.size()+1];
		   tidArray = new String[l.size()+1];
		   originArray = new String[l.size()+1];
		   destArray = new String[l.size()+1];
		   dateArray = new String[l.size()+1];
		   depTimeArray = new String[l.size()+1];
		   arrTimeArray = new String[l.size()+1];
		   int tempCount = 0;
		   for(String s: l)
		   {
			   lineArray[tempCount] = s;
			   tempCount++;
		   }
		   tempCount = 0;
		   for(String s: t)
		   {
			   tidArray[tempCount] = s;
			   tempCount++;
		   }
		   tempCount = 0;
		   for(String s: o)
		   {
			   originArray[tempCount] = s;
			   tempCount++;
		   }
		   tempCount = 0;
		   for(String s: d)
		   {
			   destArray[tempCount] = s;
			   tempCount++;
		   }
		   tempCount = 0;
		   for(String s: dateList)
		   {
			   dateArray[tempCount] = s;
			   tempCount++;
		   }
		   tempCount = 0;
		   for(String s: dt)
		   {
			   depTimeArray[tempCount] = s;
			   tempCount++;
		   }
		   tempCount = 0;
		   for(String s: at)
		   {
			   arrTimeArray[tempCount] = s;
			   tempCount++;
		   }
		   lineArray2 = new String[l2.size()+2];
		   tidArray2 = new String[l2.size()+2];
		   originArray2 = new String[l2.size()+2];
		   destArray2 = new String[l2.size()+2];
		   dateArray2 = new String[l2.size()+2];
		   depTimeArray2 = new String[l2.size()+2];
		   arrTimeArray2 = new String[l2.size()+2];
		   tempCount = 0;
		   for(String s: l2)
		   {
			   lineArray2[tempCount] = s;
			   tempCount++;
		   }
		   tempCount = 0;
		   for(String s: t2)
		   {
			   tidArray2[tempCount] = s;
			   tempCount++;
		   }
		   tempCount = 0;
		   for(String s: o2)
		   {
			   originArray2[tempCount] = s;
			   tempCount++;
		   }
		   tempCount = 0;
		   for(String s: d2)
		   {
			   destArray2[tempCount] = s;
			   tempCount++;
		   }
		   tempCount = 0;
		   for(String s: dateList2)
		   {
			   dateArray2[tempCount] = s;
			   tempCount++;
		   }
		   tempCount = 0;
		   for(String s: dt2)
		   {
			   depTimeArray2[tempCount] = s;
			   tempCount++;
		   }
		   tempCount = 0;
		   for(String s: at2)
		   {
			   arrTimeArray2[tempCount] = s;
			   tempCount++;
		   }
		   
		   //Close the connection. Don't forget to do it, otherwise you're keeping the resources of the server allocated.
		   con.close();
		   
	  
	  } catch (Exception ex) {
	   	out.print(ex);  
	  }

	%>
		<br>
			<b>Origin From the Station</b>
		<br />	
	
	<table border = "7" width="100%">
	<tr>
		<td>Line Name</td>
		<td>TID</td>
		<td>Origin</td>
		<td>Destination</td>
		<td>Date</td>
		<td>Depart Time</td>
		<td>Arrive Time</td>
	</tr>
		 <%
	      for(int i = 0; i < l.size();i++)
	      {
	     %>
		     
	       <tr>
		        <td>
		        	<%=lineArray[i]%>
		        </td>
		        <td >
		        	<%=tidArray[i]%>
		        </td>
		        <td >
		        	<%=originArray[i]%>
		        </td>
		        <td >
		        	<%=destArray[i]%>
		        </td>
		        <td >
		        	<%=dateArray[i]%>
		        </td>
		        <td >
		        	<%=depTimeArray[i]%>
		        </td>
		        <td >
		        	<%=arrTimeArray[i]%>
		        </td>
		        
	     	</tr>
	     <%
	      }
	  %>
	</table>	
	
	<br>
			<b>Destination in the Station</b>
		<br />	
	
	<table border = "7" width="100%">
	<tr>
		<td>Line Name</td>
		<td>TID</td>
		<td>Origin</td>
		<td>Destination</td>
		<td>Date</td>
		<td>Depart Time</td>
		<td>Arrive Time</td>
	</tr>
		 <%
	      for(int i = 0; i < l2.size();i++)
	      {
	     %>
		     
	       <tr>
		        <td>
		        	<%=lineArray2[i]%>
		        </td>
		        <td >
		        	<%=tidArray2[i]%>
		        </td>
		        <td >
		        	<%=originArray2[i]%>
		        </td>
		        <td >
		        	<%=destArray2[i]%>
		        </td>
		        <td >
		        	<%=dateArray2[i]%>
		        </td>
		        <td >
		        	<%=depTimeArray2[i]%>
		        </td>
		        <td >
		        	<%=arrTimeArray2[i]%>
		        </td>
		        
	     	</tr>
	     <%
	      }
	  %>
	</table>
	
	
<form method="get" action="TSeditor.jsp">
	<br>
		<input type="submit" value="BackToEdit">
	<br />	
</form>
</body>
</html>