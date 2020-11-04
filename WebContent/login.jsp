<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<title>login</title>
</head>
<body>
<form action="LoginCheckServlet" method="get">
username:<input type="text" name="username"><br>
password:<input type="password" name="password"><br>
type:<select name="type">
	<option value="buyer" />buyer
	<option value="seller" />seller
	<option value="sender" />sender
</select><br>
<input type="submit" value="登陆">
<a href="register.jsp"><input type="button" value="去注册"></a>
</form>
</body>
</html>