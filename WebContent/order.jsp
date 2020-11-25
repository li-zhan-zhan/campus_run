<%@page import="java.sql.*"%>
<%@page import="tool.DBUtils"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>order</title>
<script src="js/jquery-2.1.4.min.js" type="text/javascript"></script>
<script src="js/bootstrap.min.js" type="text/javascript"></script>
<link rel="stylesheet" type="text/css" href="css/bootstrap.min.css">
<style type="text/css">
</style>
</head>
<body>
<div class="container">
<div class="jumbotron">
  <h1>欢迎您:<%=session.getAttribute("username")%>!</h1>
  <p><a class="btn btn-primary btn-lg" href="main" role="button">返回</a></p>
</div>
<table class="table table-hover">
<tr>
<th>商家名称</th><th>买家名称</th><th>商品名称</th><th>最近操作时间</th><th>状态</th><th>操作</th>
</tr>
<%
	request.setCharacterEncoding("utf-8");
	String type = (String)session.getAttribute("type");
	Connection conn = DBUtils.getConnection();
	String id = (String)session.getAttribute("id");
	String sql = "SELECT `order`.id,`order`.time,`order`.`status`,	goods.`name`,buyer.username,seller.username "+
			" FROM `order` "+
			" INNER JOIN goods ON `order`.goods_id = goods.id "+
			" INNER JOIN buyer ON `order`.buyer_id = buyer.id "+
			" INNER JOIN seller ON `order`.seller_id = seller.id "+
			" where `order`."+type+"_id="+id+" order by `order`.time desc"; 
	Statement s = conn.createStatement();
	ResultSet rs = s.executeQuery(sql);
	while(rs.next()){
		String status = rs.getString("order.status");
		String order_id = rs.getString("order.id");
%>
<tr>
	<td><%=rs.getString("seller.username") %></td>
	<td><%=rs.getString("buyer.username") %></td>
	<td><%=rs.getString("goods.name") %></td>
	<td><%=rs.getTimestamp("time") %></td>
	<td><%=status %></td>
	<td><%
	if(!status.equals("已送达") && !status.equals("已取消")){
		if(type.equals("buyer")){
			out.print("<a type='button' class='btn btn-info' href='OrderServlet?flag=0&order_id="+order_id+"'>取消订单</a> ");
			out.print("<a type='button' class='btn btn-info' href='OrderServlet?flag=3&order_id="+order_id+"'>确认送达</a> ");
		}
		if(type.equals("seller")&& !status.equals("商家已接单")&& !status.equals("骑手已接单")) {
			out.print("<a type='button' class='btn btn-info' href='OrderServlet?flag=1&order_id="+order_id+"'>接受订单</a> ");
			out.print("<a type='button' class='btn btn-info' href='OrderServlet?flag=0&order_id="+order_id+"'>取消订单</a> ");
		} else{
			
		}
		if(type.equals("sender") && !status.equals("骑手已接单")){
			out.print("<a type='button' class='btn btn-info' href='OrderServlet?flag=2&order_id="+order_id+"'>接受订单</a> ");
		}
	}
	
	%></td>
</tr>
<% } %>
</table>
</div>
</body>
</html>