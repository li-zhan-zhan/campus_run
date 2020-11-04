<%@page import="tool.DBConnection"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.Connection"%>
<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<title>Insert title here</title>
</head>
<body>
<%
Connection conn = DBConnection.getConnection();
Statement statement = conn.createStatement();
ResultSet rs = statement.executeQuery("select * from user");
while(rs.next()) {
	//System.out.println(rs.getString(1));
	//System.out.println(rs.getString(2));
	//System.out.println(rs.getString(3));
}
%>
</body>
</html>