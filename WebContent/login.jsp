<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="utf-8">
		<title>登录</title>
		<script src="js/jquery-2.1.4.min.js" type="text/javascript"></script>
		<script src="js/bootstrap.min.js" type="text/javascript"></script>
		<link rel="stylesheet" type="text/css" href="css/bootstrap.min.css">
		<link rel="stylesheet" type="text/css" href="css/login.css">
		<script type="text/javascript">
			$(document).ready(function() {
				$("form").submit(function() {
					var data = $("form").serialize();
					$.ajax({
						type: "POST",
						url: "LoginCheckServlet",
						data: data,
						success: function(data) {
							if (data == "err") {
								alert("用户名或密码错误！");
								// toDo 3
								//$("input[name='password']").text("");
							} else {
								$(location).attr('href', data + '.jsp');
							}
						}
					});
					return false;
				});
			});
		</script>
	</head>
	
	<body class="text-center">
    <form class="form-signin" action="LoginCheckServlet" method="get">
  <img class="mb-4" src="img/logo.PNG" alt="" width="96" height="96">
  <h2 class="h3 mb-3 font-weight-normal">欢迎来到校园跑系统<br>请登录</h2>
  <label  class="sr-only">Username</label>
  <input   class="form-control" placeholder="Username" name="username" required autofocus>
  <label for="inputPassword" class="sr-only">Password</label>
  <input type="password" id="inputPassword" class="form-control" placeholder="Password" name="password" required>
  <div class="form-group row">
	<div class="col-sm-10">
		用户类别：<select name="type">
			<option value="buyer" selected>买家</option>
			<option value="seller">卖家</option>
			<option value="sender">骑手</option>
		</select>
	</div>
	
</div>

  <button class="btn btn-lg btn-primary btn-block" type="submit">登录</button>
  <p><a href="register.jsp">去注册</a></p>
  <p class="mt-5 mb-3 text-muted">&copy;2020 校园跑</p>
</form>
</body>
</html>
