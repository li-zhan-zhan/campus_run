<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<title>error</title>
</head>
<body>
	<%
		String message = (String)session.getAttribute("message");
		out.println(message);
	%>
</body>
</html>