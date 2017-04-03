<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%
	
%>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.2.0/css/bootstrap.min.css">
<title>:::BuyPop:::</title>
<style type="text/css">
.thumbnail{
 width: 100%;
 height: 100%;
 text-align: center;
}
</style>
</head>
<body>
<div>
	<div class="thumbnail">
		<div class="score" align="center" style="height: 20%; width: 100%;">
			<div style="height: 60%; text-align: left;">
				<h3>에디코치자켓</h3>
			</div>
			<div style="height: 40%; text-align: left;">
				<h5>옵션과 수량을 선택해주세요.</h5>
			</div>
			<hr style="border: solid black 1px; width: 70%;">
		</div>
		<div align="center" style="height: 15%; width: 100%;">
			<h5>색상</h5><br/>
			<a class="btn btn-default" href="#" role="button">BLACK</a>
		</div>
		<div class="info" style="height: 15%; width: 100%;">
			<h5>사이즈</h5><br/>
			<a class="btn btn-default" href="#" role="button">S</a>
			<a class="btn btn-default" href="#" role="button">M</a>
		</div>
		<div style="height: 15%; width: 100%; text-align: left;">
			<h5>수량</h5><br/>
			<button style="width: 50%; height: 100%;" onclick="">+</button>
			<input type="text" size="10px"/>
			<button style="width: 50%; height: 100%;" onclick="">-</button>
		</div>
		<div class="btn" align="center" style="height: 35%; width:100%;">
			<button style="width: 100%; height: 50%;" onclick="">장바구니</button>
			<button style="width: 100%; height: 50%;" onclick="">구매하기</button>
		</div>
	</div>
</div>
</body>
</html>