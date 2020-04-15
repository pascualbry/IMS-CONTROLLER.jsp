<%@ page import="Email.Send_Email" %>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>

<%

String email = request.getParameter("email");

System.out.println(email);

Send_Email.Forgot_Password(email);

%>

<head>
  <title>Reset Password</title>
  <link rel = "icon" href = "icon.png" type = "image/x-icon">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <link rel = "stylesheet" type = "text/css" href = "/IMS/CSS/EmailSent.css" />
  <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
</head>

<body>
    <div class="login">
      <div class="imgcontainer">
        <i class="fa fa-check-circle-o" aria-hidden="true"></i>
        <h2>Forgot Password Email Sent</h2>
        <br>
        <p>We have sent a password reset mail to your email address: <b>"<%=email %>"</b>.</p>
        <br>
        <p>Please check your inbox to continue.</p>
      </div>
    </div>
</body>

</html>
