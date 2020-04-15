<%@ page import="CRUD.Add_Value" %>
<%@ page import="Database.Variable_Product"%>
<%@ page import="CRUD.Get_Value"%>
<%@ page import="java.util.*" %>
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
String contactNumber = request.getParameter("contactNumber");
String product1 = request.getParameter("product1");
int quantity1 = Integer.parseInt(request.getParameter("quantity1"));
String product2 = request.getParameter("product2");
int quantity2 = Integer.parseInt(request.getParameter("quantity2"));
String product3 = request.getParameter("product3");
int quantity3 = Integer.parseInt(request.getParameter("quantity3"));
String product4 = request.getParameter("product4");
int quantity4 = Integer.parseInt(request.getParameter("quantity4"));
String product5 = request.getParameter("product5");
int quantity5 = Integer.parseInt(request.getParameter("quantity5"));
int total = Integer.parseInt(request.getParameter("total"));
int finalTotal = Integer.parseInt(request.getParameter("finalTotal"));
String location = request.getParameter("location");

Add_Value.Order(clientName, contactNumber, total, finalTotal, location);

Add_Value.Create_Client(clientName);

Add_Value.Create_Schema(clientName);

int product = 0;

if (quantity1 != 0){
	product += 1;
}if (quantity2 != 0){
	product += 1;
}if (quantity3 != 0){
	product += 1;
}if (quantity4 != 0){
	product += 1;
}if (quantity5 != 0){
	product += 1;
}

String productName ="";
String newProduct = "";
int productQuantity = 0;
int newQuantity = 0;
int left = 0;

while(product > 0) {	
	
	newProduct = request.getParameter("product" + product);
	newQuantity = Integer.parseInt(request.getParameter("quantity" + product));
	
	Add_Value.Demand(newProduct);
	
	Add_Value.Client(clientName, newProduct, newQuantity);

	Get_Value obj_Get_Value = new Get_Value();
	
	List<Variable_Product> list = obj_Get_Value.Product();
	
	Iterator<Variable_Product> it_list = list.iterator();
	
	while (it_list.hasNext()) {
		
		Variable_Product obj_Variable_Product = new Variable_Product();
		
		obj_Variable_Product = it_list.next();
		
		if (newProduct.equals(obj_Variable_Product.getName())){
			
			productName = obj_Variable_Product.getName();
			
			productQuantity = obj_Variable_Product.getQuantity();
			
			left = productQuantity - newQuantity;
			
		}
			
				
	}

	Add_Value.Transfer_Serial(clientName, productName, productQuantity, left);
	//System.out.println(clientName);
	//System.out.println(productName);
	//System.out.println(productQuantity);
	//System.out.println(left);
	//System.out.println();
	
	Add_Value.Delete_Serial(productName, productQuantity, left);
	//System.out.println(productName);
	//System.out.println(productQuantity);
	//System.out.println(left);
	
	Add_Value.Quantity(left, productName);
	product -= 1;
	
}
if(product == 0){
	response.sendRedirect("/IMS/PURCHASING/Purchasing.jsp");
	
}

%>

</body>
</html>
