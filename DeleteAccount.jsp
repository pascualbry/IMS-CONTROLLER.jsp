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

				Add_Value.DeleteAccount(username);
				
				Add_Value.Delete_Account(username);
				
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
