<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<title>Insert title here</title>
<script src="https://cdn.staticfile.org/jquery/2.1.1/jquery.min.js"></script>
<script>
function f1(){
	$.ajax({
		type:"POST",                   
		url:"TestServlet",               
		data:"username=lzzvia&password=123",              
		success:function(data){             
			if(data=="1"){
				console.log(data);
				$(location).attr('href', 'http://www.baidu.com');
			} else {
				alert(data);
			}
		}            
	});
}
</script>
</head>
<body>
<button onclick="f1()">click</button>
<p id="info">123</p>
</body>
</html>