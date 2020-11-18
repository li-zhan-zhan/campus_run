<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<title>sender</title>
</head>
<body>
<%
	String username = (String)session.getAttribute("username");
	String type = (String)session.getAttribute("type");
	if(username==null || !type.equals("sender")){
		response.sendRedirect("login.jsp");
}
%>
欢迎您:<%=username %>!
<a href="LogoutServlet">退出登陆</a>
<br>

</body>
</html>