<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<title>login</title>
<link rel="stylesheet" type="text/css" href="css/style.css" />
<script src="js/jquery-2.1.4.min.js" type="text/javascript"></script>
<script src="js/demo.js" type="text/javascript"></script>
</head>
<body>
<div id="mForm">
	<form id="in" action="LoginCheckServlet" method="get">
		username:<input type="text" name="username"><br>
		password:<input type="password" name="password"><br>
		type:
		<input name = "type" type="radio" value="buyer" checked />buyer
		<input name = "type" type="radio" value="seller" />seller
		<input name = "type" type="radio" value="sender" />sender
		<br>
		<input  type="submit" value="登陆">
		<a href="register.jsp">去注册</a>
	</form>
</div>
</body>
</html>