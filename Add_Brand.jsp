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

String brand = request.getParameter("brand");
int x = 1;

DBConnection obj_Database = new DBConnection();
Connection connection = obj_Database.get_connection();

PreparedStatement ps = null;
ResultSet rs = null;

try {
	String query ="SELECT *, DATE_FORMAT(date, '%m/%d/%Y') AS dateReceive FROM inventory.brand";
	ps=connection.prepareStatement(query);
	rs=ps.executeQuery();
	
	rs.afterLast();
	
	while (rs.previous()) {
		
		if (brand.toLowerCase().equals(rs.getString("brand").toLowerCase())){
			
			x = 0;
			
		}
		
	}			
	
	if (x == 1){

		Add_Value.Brand(brand);
		
		System.out.println("ADD");
		
		response.sendRedirect("/IMS/INVENTORY/Brand.jsp"); 	
		
	}else {
		
		System.out.println("OK");
		
		response.sendRedirect("/IMS/INVENTORY/Brand1.jsp#popupadd"); 
		
	}
	
}catch (Exception e) {
	
	System.out.print("Success");
	
}

%>

</body>
</html>
