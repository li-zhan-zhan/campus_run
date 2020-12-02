<%@page import="tool.DBUtils"%>
<%@page import="java.sql.*"%>
<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<title>骑手页面</title>
<script src="js/jquery-2.1.4.min.js" type="text/javascript"></script>
<script src="js/bootstrap.min.js" type="text/javascript"></script>
<link rel="stylesheet" type="text/css" href="css/bootstrap.min.css">
</head>
<body>
<%
	String username = (String)session.getAttribute("username");
	String type = (String)session.getAttribute("type");
	if(username==null){
		response.sendRedirect("login.jsp");
	} else if(!type.equals("sender")) {
		response.sendRedirect(type+".jsp");
	}

%>
<div class="container">
<div class="jumbotron">
  <h1>欢迎骑手:<%=username%>!</h1>
  <p>
  	<a class="btn btn-primary btn-lg" href="order.jsp" role="button">查看订单</a>
  	<a class="btn btn-primary btn-lg" href="LogoutServlet" role="button">退出登陆</a>
  </p>
</div>
<table class="table table-hover">
<tr>
<th>商家名称</th><th>买家名称</th><th>商品名称</th><th>最近操作时间</th><th>状态</th><th>操作</th>
</tr>
<%
	request.setCharacterEncoding("utf-8");
	Connection conn = DBUtils.getConnection();
	String id = (String)session.getAttribute("id");
	String sql = "SELECT `order`.id,`order`.time,`order`.`status`,	goods.`name`,buyer.username,seller.username "+
			" FROM `order` "+
			" INNER JOIN goods ON `order`.goods_id = goods.id "+
			" INNER JOIN buyer ON `order`.buyer_id = buyer.id "+
			" INNER JOIN seller ON `order`.seller_id = seller.id "+
			" where `order`.`status`='商家已接单'"; 
	Statement s = conn.createStatement();
	ResultSet rs = s.executeQuery(sql);
	while(rs.next()){
%>
<tr>
	<td><%=rs.getString("seller.username") %></td>
	<td><%=rs.getString("buyer.username") %></td>
	<td><%=rs.getString("goods.name") %></td>
	<td><%=rs.getTimestamp("time") %></td>
	<td><%=rs.getString("order.status") %></td>
	<td><a type='button' class='btn btn-info' href='OrderServlet?flag=2&order_id=<%=rs.getString("order.id") %>'>接受订单</a><br></td>
</tr>
<% } %>
</table>
  <p class="mt-5 mb-3 text-muted text-center">&copy;2020 校园跑</p>
</body>
</div>
</html>