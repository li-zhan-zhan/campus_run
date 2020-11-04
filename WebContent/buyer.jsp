<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<title>buyer</title>
</head>
<body>
欢迎您:<%=(String)session.getAttribute("username") %>!
<a href="LogoutServlet">退出登陆</a>
</body>
</html>