<%@page import="java.sql.*"%>
<%@page import="tool.DBUtils"%>
<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<title>buyer</title>
</head>
<body>
<%
	request.setCharacterEncoding("utf-8");
	String username = (String)session.getAttribute("username");
	String type = (String)session.getAttribute("type");
	if(username==null || !type.equals("buyer")){
		response.sendRedirect("login.jsp");
	}
%>
<h3>
	欢迎您:<%=username%>!
	<a href="LogoutServlet">退出登陆</a>
</h3>
<p>查询到以下商家：</p>
<ul>
<%
	Connection conn = DBUtils.getConnection();
	Statement st = conn.createStatement();
	ResultSet rs = st.executeQuery("select username from seller");
	while(rs.next()){
%>
	<li><%=rs.getString(1) %></li>
<% } %>
</ul>
</body>
</html>