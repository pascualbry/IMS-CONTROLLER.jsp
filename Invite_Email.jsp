<%@ page import="Database.DBConnection" %>
<%@ page import="Email.Send_Email" %>
<%@ page import="CRUD.Add_Value" %>
<%@ page import="java.sql.*" %>
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
String userType = request.getParameter("userType");

Add_Value.Invite_Account(email, userType);

Send_Email.Invite_Account(email);

response.sendRedirect("/IMS/ACCOUNT/Accounts.jsp");

%>

</body>
</html>
