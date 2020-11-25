<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<title>register</title>
<script src="js/jquery-2.1.4.min.js" type="text/javascript"></script>
		<script src="js/bootstrap.min.js" type="text/javascript"></script>
		<link rel="stylesheet" type="text/css" href="css/bootstrap.min.css">
<script type="text/javascript">
$(document).ready(function(){
	$("form").submit(function () {
		var data = $("form").serialize(); 
		$.ajax({
			type:"POST",                   
			url:"RegisterServlet",               
			data:data,
			success:function(data){             
				if(data=="err"){
					alert("注册失败！");
					// toDo 3
					//$("input[name='password']").text("");
				} else {
					$(location).attr('href', data+'.jsp');
				}
			}            
		});
		return false;
	});
});
</script>
</head>
<body>
<div class="container">
			<div class="jumbotron">
				<h1>欢迎来到校园跑系统！</h1>
				<p>...</p>
				<p><a class="btn btn-primary btn-lg" href="login.jsp" role="button">去登陆</a></p>
			</div>
			<form class="form-horizontal" action="RegisterServlet" method="get">
				<div class="form-group row">
					<label class="col-sm-2 col-form-label">用户名：</label>
					<div class="col-sm-10">
						<input type="text" class="form-control" name="username" placeholder="请输入用户名">
					</div>
				</div>
				<div class="form-group row">
					<label for="inputPassword" class="col-sm-2 col-form-label">密码：</label>
					<div class="col-sm-10">
						<input type="password" class="form-control" name="password" placeholder="请输入密码">
					</div>
				</div>
				<div class="form-group row">
					<label for="inputPassword" class="col-sm-2 col-form-label"></label>
					<div class="col-sm-10">
						<input type="radio" name="type" id="inlineRadio1" value="buyer" checked /> 买家
						<input type="radio" name="type" id="inlineRadio1" value="seller"> 卖家
						<input type="radio" name="type" id="inlineRadio1" value="sender"> 骑手
					</div>
				</div>
				<div class="form-group row">
					<label for="inputPassword" class="col-sm-2 col-form-label"></label>
					<div class="col-sm-10">
						<button type="submit" class="btn btn-primary">注册</button>
					</div>
				</div>
			</form>
		</div>
</body>
</html>