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
String username = request.getParameter("username");
String password = request.getParameter("password");

String DBEmail = "";
String DBPassword = "";

DBConnection oobj_DBConnection = new DBConnection();
Connection connection = oobj_DBConnection.get_connection();

PreparedStatement ps = null;
ResultSet rs = null;

try {
	String query ="SELECT * FROM account.incharge";
	ps=connection.prepareStatement(query);
	rs=ps.executeQuery();
	
	rs.afterLast();
	
	while (rs.previous()) {
		
		//System.out.println(rs.getString("email"));
		if(rs.getString("username").equals(username)){
			if(rs.getString("password").equals(password)){
				
				Add_Value.OnGoing(clientName);
				
				Add_Value.Ongoing_Incharge(clientName, username);

				Add_Value.OnGoing_Delete(clientName);
				
				response.sendRedirect("/IMS/QUALITYCONTROL/QCG.jsp");	
				
			}else{
				
				response.sendRedirect("/IMS/QUALITYCONTROL/QCG11.jsp?clientName="+clientName+"");	
				
			}
		}
		
	}	

	response.sendRedirect("/IMS/QUALITYCONTROL/QCG11.jsp?clientName="+clientName+"");		
	
}catch (Exception e) {
	
	System.out.print("Success");
	
}

%>

</body>
</html>
