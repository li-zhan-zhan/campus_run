<%@page import="java.sql.*"%>
<%@page import="tool.DBUtils"%>
<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<title>buyer</title>
<script src="js/jquery-2.1.4.min.js" type="text/javascript"></script>
<script src="js/bootstrap.min.js" type="text/javascript"></script>
<link rel="stylesheet" type="text/css" href="css/bootstrap.min.css">
</head>
<body>
<%
	request.setCharacterEncoding("utf-8");
	String username = (String)session.getAttribute("username");
	String type = (String)session.getAttribute("type");
	if(username==null){
		response.sendRedirect("login.jsp");
	} else if(!type.equals("buyer")) {
		response.sendRedirect(type+".jsp");
	}
%>
<div class="container">
<div class="jumbotron">
  <h1>欢迎您:<%=username%>!</h1>
  <p>
  	<a class="btn btn-primary btn-lg" href="order.jsp" role="button">查看订单</a>
  	<a class="btn btn-primary btn-lg" href="LogoutServlet" role="button">退出登陆</a>
  </p>
</div>
<div class="panel panel-default">
<div class="panel-heading">商品列表</div>
<div class="panel-body">
  <p>请购买您要购买的商品：</p>
</div>

<p></p>
<table class="table table-hover">
<tr>
<th>商家名称</th><th>商品名称</th><th>单价</th><th>商品描述</th><th>库存</th><th>操作</th>
</tr>
<%
	Connection conn = DBUtils.getConnection();
	Statement st = conn.createStatement();
	String sql = 
			"SELECT seller.username,seller.`id`,goods.`id`,goods.`name`,goods.`describe`, goods.price, goods.stock "+
			" FROM seller INNER JOIN goods ON goods.seller_id = seller.id";
	ResultSet rs = st.executeQuery(sql);
	while(rs.next()){
%>
	<tr>
	<td><%=rs.getString("username") %></td>
	<td><%=rs.getString("name") %></td>
	<td>￥<%=rs.getString("price") %></td>
	<td><%=rs.getString("describe") %></td>
	<td><%=rs.getString("stock") %></td>
	<td><a type="button" class="btn btn-info" href="BuyServlet?
	goods_id=<%=rs.getString("goods.id") %>&
	seller_id=<%=rs.getString("seller.id") %>&
	buyer_id=<%=(String)session.getAttribute("id") %>">购买</a></td>
	</tr>
<% } %>
</table>
</div>
</div>
</body>
</html>