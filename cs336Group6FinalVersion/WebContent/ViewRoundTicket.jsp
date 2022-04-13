<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1" import="com.cs336.pkg.*"%>
<!--Import some libraries that have classes that we need -->
<%@ page import="java.io.*,java.util.*,java.sql.*"%>
<%@ page import="javax.servlet.http.*,javax.servlet.*"%>
<!DOCTYPE>
<html>

	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
		<title>Buy A Round Ticket</title>
	</head>
	<body>
	
	
		<%
		ArrayList<String> line_names = new ArrayList<String>();
		ArrayList<String> line_names2 = new ArrayList<String>();
		ArrayList<String> line_names3 = new ArrayList<String>();
		ArrayList<String> s_indexs = new ArrayList<String>();
		ArrayList<String> s_indexs2 = new ArrayList<String>();
		ArrayList<String> depart = new ArrayList<String>();
		ArrayList<String> arrive = new ArrayList<String>();
		String[] departArray = new String[1];
		String[] arriveArray = new String[1];
		String[] lineArray = new String[1];
		int[] s_indexArray = new int[1];
		int[] s_indexArray2 = new int[1];
		
		try {
			
			//Get the database connection
			ApplicationDB4 db = new ApplicationDB4();	
			Connection con = db.getConnection();		

			//Create a SQL statement
			Statement stmt = con.createStatement();
			String username=request.getParameter("username");
			String dest=request.getParameter("origin");
			String origin=request.getParameter("dest");
			String date=request.getParameter("date");
			String fare=request.getParameter("fare");
			String reserve_num=request.getParameter("reserve_num");
			
			String TicketInfo = "SELECT * FROM Line_has_station WHERE s_name= ?";
			PreparedStatement ps = con.prepareStatement(TicketInfo);
			ps.setString(1, origin);
			ResultSet rs = ps.executeQuery();
			
			while (rs.next())
			{
				line_names.add(rs.getString("line_name"));
				
			}
			con.close();
			
			ApplicationDB4 db2 = new ApplicationDB4();	
			Connection con2 = db2.getConnection();	
			Statement stmt2 = con2.createStatement();
			String TicketInfo2 = "SELECT * FROM Line_has_station WHERE s_name= ?";
			PreparedStatement ps2 = con2.prepareStatement(TicketInfo2);
			ps2.setString(1, dest);
			ResultSet rs2 = ps2.executeQuery();
			while (rs2.next())
			{
				line_names2.add(rs2.getString("line_name"));	
				
			}
			con2.close();
			for(String s: line_names)
			{
				for(String s2: line_names2)
				{
					if(s.equals(s2))
					{
						line_names3.add(s);
						break;
					}
				}
			}
			ApplicationDB4 db4 = new ApplicationDB4();	
			Connection con4 = db4.getConnection();	
			Statement stmt4 = con4.createStatement();
			for(String s: line_names3)
			{			
				
				String TicketInfo4 = "SELECT * FROM Line_has_station WHERE line_name= ? AND s_name = ?";
				PreparedStatement ps4 = con4.prepareStatement(TicketInfo4);
				ps4.setString(1, s);
				ps4.setString(2, origin);
				ResultSet rs4 = ps4.executeQuery();
				while(rs4.next())
				{
					s_indexs.add(rs4.getString("station_index"));
					depart.add(rs4.getString("departure_from_station_time"));
				}

				TicketInfo4 = "SELECT * FROM Line_has_station WHERE line_name= ? AND s_name = ?";
				ps4 = con4.prepareStatement(TicketInfo4);
				ps4.setString(1, s);
				ps4.setString(2, dest);
				ResultSet rs5 = ps4.executeQuery();
				while(rs5.next())
				{
					s_indexs2.add(rs5.getString("station_index"));
					arrive.add(rs5.getString("arrive_to_station_time"));
				}
			}
			con4.close();
			departArray = new String[line_names3.size()+1];
			arriveArray = new String[line_names3.size()+1];
			lineArray = new String[line_names3.size()+1];
			s_indexArray = new int[line_names3.size()+1];
			s_indexArray2 = new int[line_names3.size()+1];
			int tempCount = 0;
		    for(String s: depart)
		    {
		       departArray[tempCount] = s;
			   tempCount++;
		    }
		    tempCount = 0;
		    for(String s: arrive)
		    {
		    	arriveArray[tempCount] = s;
			   tempCount++;
		    }
		    tempCount = 0;
		    for(String s: line_names3)
		    {
			   lineArray[tempCount] = s;
			   tempCount++;
		    }
		    tempCount = 0;
		    for(String s: s_indexs)
		    {
			   s_indexArray[tempCount] = Integer.parseInt(s);
			   tempCount++;
		    }
		    tempCount = 0;
		    for(String s: s_indexs2)
		    {
			   s_indexArray2[tempCount] = Integer.parseInt(s);
			   tempCount++;
		    }
			
			%>
			<table border = "9"  width="100%">
				<tr> 
					<td><b>LineName </b></td>
					<td><b>Date</b></td>
					<td><b>Your Origin</b></td>
					<td><b>Departure Time</b></td>
					<td><b>Your Destination</b></td>
					<td><b>Arrive Time</b></td>
					<td><b>Total Stops</b></td>
					<td><b>Your Fare</b></td>
					<td><b>Add To Cart</b></td>
				</tr>	
				<% 
				ApplicationDB4 db3 = new ApplicationDB4();	
				Connection con3 = db3.getConnection();	
				Statement stmt3 = con3.createStatement();
			    for(int i = 0; i < line_names3.size(); i++)
			    {
					String TicketInfo3 = "SELECT * FROM Train_Schedule WHERE line_name= ? AND date >= ?";
					PreparedStatement ps3 = con3.prepareStatement(TicketInfo3);
					ps3.setString(1, lineArray[i]);
					ps3.setString(2, date);
					ResultSet rs3 = ps3.executeQuery();
					if(s_indexArray[i] - s_indexArray2[i] < 0)
					{
						while (rs3.next())
						{
						%>
							<tr> 
								<form method="post" action="ReserveRoundTicket.jsp">
								<input type="hidden" name="reserve_num" value = "<%=request.getParameter("reserve_num")%>" readonly>
								<input type="hidden" name="username" value = "<%=request.getParameter("username")%>" readonly>
								<td><input type="text" name="line" value =<%=rs3.getString("line_name")%> readonly></td>
								<td><input type="text" name="date" value =<%= rs3.getString("date")%> readonly></td>
								
								<td><input type="text" name="origin" value =<%= origin%> readonly></td>
								<td><input type="text" name="departArray" value =<%= departArray[i]%> readonly></td>
								<td><input type="text" name="dest" value =<%= dest%> readonly></td>
								<td><input type="text" name="arriveArray" value =<%= arriveArray[i]%> readonly></td>
								<td><input type="text" name="stops" value =<%= s_indexArray2[i] - s_indexArray[i]%> readonly></td>
								<td><input type="text" name="fare" value =<%= fare%> readonly></td>
								<td><input type="submit" value="AddToCart">
								</form>	
							</tr>
						<% 
						}
					}
		    	}
			    con3.close();
		%>

			
		<%} catch (Exception e) {
			out.print(e);
		}%>
	
	<form method="get" action="ShoppingCart.jsp">
		<input type="hidden" name="username" value = "<%=request.getParameter("username")%>" readonly>
		<input type="submit" value="Back To Shopping Cart Page">
	</form><br><br>
	

	</body>
</html>