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

				Add_Value.ForRelease(clientName);
				
				Add_Value.ForRelease_Delete(clientName);
				
				response.sendRedirect("/IMS/DELIVERY/Delivery.jsp");
				
			}else{
				
				response.sendRedirect("/IMS/QUALITYCONTROL/QCG33.jsp?clientName=" + clientName);	
				
			}
		}
		
	}	
	
	response.sendRedirect("/IMS/QUALITYCONTROL/QCG33.jsp?clientName=" + clientName);			
	
}catch (Exception e) {
	
	System.out.print("Success");
	
}

%>

</body>
</html>
