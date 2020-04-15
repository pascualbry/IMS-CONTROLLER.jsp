<%@ page import="Database.Variable_Brand"%>
<%@ page import="Database.DBConnection"%>
<%@ page import="CRUD.Get_Value"%>
<%@ page import="CRUD.Add_Value" %>
<%@ page import="java.util.*" %>
<%@ page import="java.sql.*" %>
<%@ page import="java.io.*" %>
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

String category = request.getParameter("category");
int x = 1;

DBConnection obj_Database = new DBConnection();
Connection connection = obj_Database.get_connection();

PreparedStatement ps = null;
ResultSet rs = null;

try {
	String query ="SELECT *, DATE_FORMAT(date, '%m/%d/%Y') AS dateReceive FROM inventory.category";
	ps=connection.prepareStatement(query);
	rs=ps.executeQuery();
	
	rs.afterLast();
	
	while (rs.previous()) {
		
		if (category.toLowerCase().equals(rs.getString("category").toLowerCase())){
			
			x = 0;
			
		}
		
	}			
	
	if (x == 1){

		Add_Value.Category(category);
		
		System.out.println("ADD");
		
		response.sendRedirect("/IMS/INVENTORY/Category.jsp"); 	
		
	}else {
		
		System.out.println("OK");
		
		response.sendRedirect("/IMS/INVENTORY/Category1.jsp#popupadd"); 
		
	}
	
}catch (Exception e) {
	
	System.out.print("Success");
	
}

%>

</body>
</html>
