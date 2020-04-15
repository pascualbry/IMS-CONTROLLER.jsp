<%@ page import="CRUD.Change_Value" %>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
  <title>Enter Password</title>
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <link rel = "stylesheet" type = "text/css" href = "/Inventory/Css/Inventory_EditProduct.css" />
  <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
  <link href="https://fonts.googleapis.com/css?family=Roboto:300,400,500,700" rel="stylesheet">
  <link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.5.0/css/all.css" integrity="sha384-B4dIYHKNBt8Bc12p+WXckhzcICo0wtJAoU8YZTY5qE0Id1GSseTk6S+L3BlXeVIU" crossorigin="anonymous">
</head>

<body>

<%

String email = request.getParameter("email");
String password = request.getParameter("password");
String password1 = request.getParameter("password1");
String name = request.getParameter("name");
String contactNumber = request.getParameter("contactNumber");
String username = request.getParameter("username");

if (password.equals(password1)){
	
	Change_Value obj_Change_Value = new Change_Value();

	obj_Change_Value.New_Password(email, password, name, contactNumber, username);

	response.sendRedirect("/IMS/ACCOUNT/ResetSuccessfully.jsp");
	
}else {

	response.sendRedirect("/IMS/ACCOUNT/Forgot_Password.jsp?email=" + email);
	
}

%>

</body>
</html>
