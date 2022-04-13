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
	<form method="get" action="ProduceTSList.jsp">
	   	<br><b>Produce a list of train schedules:</b><br />
	   		<tr>
		      <td>Input Station Name To Search:</td>
		      <td width="85%">
			    <input size="60" type="text" name="produceList" required>
			    <input type="submit" value="Search"> 
		      </td>
		    </tr>
  	 </form>  
  	 
  	 <form method="get" action="ProduceUserList.jsp">
	   	<br><b>Produce a list of all customers based on transit line and date:</b><br />
	   		<tr>
		      <td>Input Transit Line Name: <input type="text" name="line" placeholder ="G117" required></td>
		      <br>
		      <td>Input Date(YYYY-MM-DD): <input type="text" name="date" placeholder = "2019-02-01" required></td>
		      <br />
			   <input type="submit" value="Search"> 
		    </tr>
  	 </form> 
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
		   
		   
		   while(rs.next()) {
		     l.add(rs.getString("line_name"));
		     t.add(rs.getString("tid"));
		     o.add(rs.getString("origin_s_name"));
		     d.add(rs.getString("dest_s_name")); 
		     dateList.add(rs.getString("date")); 
		     dt.add(rs.getString("departure_time"));
		     at.add(rs.getString("arrive_time"));
		     
		   }
		   lineArray = new String[l.size()+2];
		   tidArray = new String[l.size()+2];
		   originArray = new String[l.size()+2];
		   destArray = new String[l.size()+2];
		   dateArray = new String[l.size()+2];
		   depTimeArray = new String[l.size()+2];
		   arrTimeArray = new String[l.size()+2];
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
		
		   //Close the connection. Don't forget to do it, otherwise you're keeping the resources of the server allocated.
		   con.close();
		   
		   
	  } catch (Exception ex) {
	   	out.print(ex);  
	  }

	%>
	<form method="get" action="ScheduleDeletion.jsp">
		<br>
			<b>Train Schedules Overview</b>
			<input type="submit" value="Click Here To Choose Schedules You Want To Delete">
		<br />	
	</form>	
	<table border = "8" width="100%">
	<tr>
		<td>Line Name</td>
		<td>TID</td>
		<td>Origin</td>
		<td>Destination</td>
		<td>Date</td>
		<td>Depart Time</td>
		<td>Arrive Time</td>
		<td>EditButton</td>
	</tr>
		 <%
	      for(int i = 0; i < l.size();i++)
	      {
	     %>
		     <form method="get" action="EditTrainSchedule.jsp">
			       <tr>
				        <td>
				        	<input type="text" name="lineArray" value = "<%=lineArray[i]%>" readonly>
				        </td>
				        <td >
				        	<input type="text" name="tidArray" value = "<%=tidArray[i]%>" readonly>
				        </td>
				        <td >
				        	<input type="text" name="originArray" value = "<%=originArray[i]%>" readonly>
				        </td>
				        <td >
				        	<input type="text" name="destArray" value = "<%=destArray[i]%>" readonly>
				        </td>
				        <td >
				        	<input type="text" name="dateArray" value = "<%=dateArray[i]%>" readonly>
				        </td>
				        <td >
				        	<input type="text" name="depTimeArray" value = "<%=depTimeArray[i]%>" readonly>
				        </td>
				        <td >
				        	<input type="text" name="arrTimeArray" value = "<%=arrTimeArray[i]%>" readonly>
				        </td>
				        <td >
				        	<input type="submit" value="Edit">
				        </td>
			     	</tr>
		    </form>
	     <%
	      }
	  %>
	</table>	
<form method="get" action="CustomerReps.jsp">
	<br>
		<input type="submit" value="Answer Unanswered Questions">
	<br />	
</form>	
	
<form method="get" action="index.jsp">
	<br>
		<input type="submit" value="Log Out">
	<br />	
</form>
</body>
</html>