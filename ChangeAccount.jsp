<%@ page import="java.sql.*" %>
<%@ page import="Database.DBConnection" %>
<%@ page import="CRUD.Add_Value" %>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
</head>

<body>

<%

String email = request.getParameter("email");
String password = request.getParameter("password");

String username = request.getParameter("username");
String name = request.getParameter("name");
String contactNumber = request.getParameter("contactNumber");
String userType = request.getParameter("userType");
/*
System.out.println(username);
System.out.println(name);
System.out.println(contactNumber);
System.out.println(userType);
*/
String DBEmail = "";
String DBPassword = "";

DBConnection oobj_DBConnection = new DBConnection();
Connection connection = oobj_DBConnection.get_connection();

PreparedStatement ps = null;
ResultSet rs = null;

try {
	String query ="SELECT * FROM account.supervisor";
	ps=connection.prepareStatement(query);
	rs=ps.executeQuery();
	
	rs.afterLast();
	
	while (rs.previous()) {
		
		//System.out.println(rs.getString("email"));
		if(rs.getString("email").equals(email)){
			if(rs.getString("password").equals(password)){
				System.out.println(username);
				Add_Value.ChangeAccount(username);
				Add_Value.ChangeAccount1(name);
				Add_Value.ChangeAccount2(contactNumber);
				
				response.sendRedirect("/IMS/ACCOUNT/Accounts.jsp");
				
			}else{
				
				response.sendRedirect("/IMS/ACCOUNT/Accounts2.jsp?username=" + username);	
				
			}
		}
		
	}	
	
	response.sendRedirect("/IMS/ACCOUNT/Accounts2.jsp?username=" + username);			
	
}catch (Exception e) {
	
	System.out.print("Success");
	
}

%>

</body>
</html>
