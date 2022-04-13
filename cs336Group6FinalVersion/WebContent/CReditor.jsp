<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1" import="com.cs336.pkg.*"%>
<%@ page import="java.io.*,java.util.*,java.sql.*"%>
<%@ page import="javax.servlet.http.*,javax.servlet.*"%>

<!DOCTYPE>
<html>
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
		<title>CReditor</title>
	</head>
	<body>
	<h1>CReditor:</h1>
	
	<%	
	try{
			//Get the database connection
			ApplicationDB db = new ApplicationDB();	
			Connection con = db.getConnection();		

			//Create a SQL statement
			Statement stmt = con.createStatement();
			//Get the selected radio button from the index.jsp
			//entity is from the index
			String edit = request.getParameter("Edit");
			String delete = request.getParameter("Delete");
			String add = request.getParameter("Add");
			
			String ssn = request.getParameter("SSN");
			String firstName = request.getParameter("FirstName");
			String lastName = request.getParameter("LastName");
			String username = request.getParameter("UserName");
			String password = request.getParameter("Password");

			
			String str ="";
			
		
				
			if(delete!=null){
				str = "DELETE FROM RailwayBooking.Employee where ssn like '%"+ssn+"'";
				out.print("<h1>"+"Delete Successfully "+"<br>"+"</h1>");
				stmt.executeUpdate(str);
			}else if(add!=null){
				
				str = "SELECT * FROM RailwayBooking.Employee where username like '%"+username+"'";
				
				ResultSet rs = stmt.executeQuery(str);
				boolean exist = false;
				while(rs.next()) {
					exist = !rs.wasNull();
					
				}
				if(!exist){											
						str = "SELECT * FROM RailwayBooking.Employee where ssn like '%"+ssn+"'";
			
						ResultSet rs2 = stmt.executeQuery(str);
						boolean exist2 = false;
						while(rs2.next()) {
							exist2 = !rs2.wasNull();
							
						}						
						if (!exist2)
						{
							String insert="INSERT INTO Employee(ssn, firstName, lastName, username, password) VALUES ('"+ssn+"', '"+firstName+"', '"+lastName+"', '"+username+"' , '"+password+"' )";
							stmt.executeUpdate(insert);
							out.print("<h1>"+"Add Successfully "+"<br>"+"</h1>");
						}else{
							out.print("<h1>"+"This ssn already existed in DB: "+ssn+"<br>"+"</h1>");
						}												
				}else{
					out.print("<h1>"+"This username already existed in DB: "+username+"<br>"+"</h1>");
				}
			}else if(edit!=null){
				str = "Select username from Employee where ssn = '"+ssn+"'";
				ResultSet rs3 = stmt.executeQuery(str);
				String OriginUsername="admin";
				while(rs3.next()) {
					OriginUsername=rs3.getString("username");
				}	
				
				
				if(OriginUsername.equals(username)==true){
					str = "UPDATE Employee Set firstName = '"+firstName+"', lastName = '"+lastName+"', password= '"+password+"' where ssn = '"+ssn+"'";
					//"UPDATE Employee Set firstName = 'firstName', lastName = 'lastName', username = 'username', password'password' where ssn = 'ssn'";
					stmt.executeUpdate(str);
					out.print("<h1>"+"Edit Successfully "+"<br>"+"</h1>");
				}else{
					str = "SELECT * FROM RailwayBooking.Employee where username like '%"+username+"'";
		
					ResultSet rs4 = stmt.executeQuery(str);
					boolean exist3 = false;
					while(rs4.next()) {
						exist3 = !rs4.wasNull();
						
					}						
					if (!exist3)
					{
						str = "UPDATE Employee Set firstName = '"+firstName+"', lastName = '"+lastName+"', username ='"+username+"', password= '"+password+"' where ssn = '"+ssn+"'";
						stmt.executeUpdate(str);
						out.print("<h1>"+"Edit Successfully "+"<br>"+"</h1>");
					}else{
						out.print("<h1>"+"This username already existed in DB!!!: "+username+"<br>"+"</h1>");
					}
				}
			}
	}catch (Exception ex) {
		out.print(ex);
	}
			
	%>
	<form method="get" action="homeAdmin.jsp">
	<br>
		<input type="submit" value="Back to Admin Home Page">
	<br />
</form>
	
	</body>
</html>