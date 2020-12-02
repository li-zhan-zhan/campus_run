<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<title>卖家页面</title>
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
	} else if(!type.equals("seller")) {
		response.sendRedirect(type+".jsp");
	}

%>
<div class="container">
	<div class="jumbotron">
	<h1>欢迎卖家:<%=username%>!</h1>
	<p>
		<a class="btn btn-primary btn-lg" href="order.jsp" role="button">查看订单</a>
		<a class="btn btn-primary btn-lg" href="LogoutServlet" role="button">退出登陆</a>
	</p>
	</div>
添加商品
<form action="addGoodsServlet" method="get">
name:<input type="text" name="name"><br>
price:<input type="text" name="price"><br>
stock:<input type="text" name=""><br>
describe<textarea rows="3" cols="20"></textarea><br>
</form>
</div>
  <p class="mt-5 mb-3 text-muted text-center">&copy;2020 校园跑</p>
</body>
</html>