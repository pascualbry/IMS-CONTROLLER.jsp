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

String name = request.getParameter("name");
int quantity = Integer.parseInt(request.getParameter("quantity"));
int price = Integer.parseInt(request.getParameter("price"));
String brand = request.getParameter("brand");
String category = request.getParameter("category");

Add_Value.Product(name, quantity, price, brand, category);

Add_Value.Create_Demand(name);

Add_Value.Create_Serial(name);

int serial = 0;

while(quantity > 0) {
	
	serial += 1;
	
	String serialNumber = request.getParameter("SERIALNUMBER" + serial);
	System.out.println(serialNumber);
	Add_Value.Serial_Number(name, serialNumber);
	
	quantity -= 1;
	
}

response.sendRedirect("/IMS/INVENTORY/Product.jsp");

%>

</body>
</html>
