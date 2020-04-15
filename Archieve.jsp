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

String clientName = request.getParameter("clientName");
String email = request.getParameter("email");
String password = request.getParameter("password");

System.out.println(clientName);
System.out.println(email);
System.out.println(password);

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

				Add_Value.Archive(clientName);
				
				Add_Value.ArchiveDelete(clientName);
				
				response.sendRedirect("/IMS/INVENTORY/Archive.jsp");
				
			}else{
				
				response.sendRedirect("/IMS/INVENTORY/Product4.jsp?name=" + clientName);	
				
			}
		}
		
	}	
	
	response.sendRedirect("/IMS/INVENTORY/Product4.jsp?name=" + clientName);			
	
}catch (Exception e) {
	
	System.out.print("Success");
	
}

%>

</body>
</html>
