<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<title>register</title>
<link rel="stylesheet" type="text/css" href="css/style.css" />
</head>
<body>
<div id="mForm">
	<form action="RegisterServlet" method="get">
		username:<input type="text" name="username"><br>
		password:<input type="password" name="password"><br>
		type:
		<input name = "type" type="radio" value="buyer" checked />buyer
		<input name = "type" type="radio" value="seller" />seller
		<input name = "type" type="radio" value="sender" />sender
		<br>
		<input type="submit" value="注册">
		<a href="login.jsp">去登陆</a>
	</form>
</div>
</body>
</html>