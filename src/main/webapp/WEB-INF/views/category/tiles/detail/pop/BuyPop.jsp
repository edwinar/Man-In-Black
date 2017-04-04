<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%
	int count = 1;
%>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.2.0/css/bootstrap.min.css">
<title>:::BuyPop:::</title>
<style type="text/css">

</style>
</head>
<body>
<script type="text/javascript">
function countplus(){
	var num = $('#number').val();
	alert(num);
}
function countminus(){
	
}
</script>
<div align="center" style="text-align: center;">
	<div class="thumbnail" align="center" style="text-align: center;">
		<div class="score" align="center" style="height: 20%; width: 100%; text-align: center;">
			<div style="height: 60%; text-align: center; width: 100%" align="center">
				<h3>에디코치자켓</h3>
			</div>
			<div style="height: 40%; text-align: center; width: 100%" align="center">
				<h6>옵션과 수량을 선택해주세요.</h6>
			</div>
			<hr style="border: solid black 1px; width: 80%;">
		</div>
		<div align="center" style="height: 15%; width: 100%; text-align: center;">
			<h5>색상</h5>
			<select name=color size=1>
		        <option value="" selected="selected">칼라선택</option>
		        <option value="BLACK">BLACK</option>
		        <option value="WHITE">WHITE</option>
	    	</select>
		</div>
		<div class="info" style="height: 15%; width: 100%; text-align: center;">
			<h5>사이즈</h5><br>
			<select name=size size=1>
		        <option value="" selected="selected">사이즈선택</option>
		        <option value="S">S</option>
		        <option value="M">M</option>
	    	</select>
		</div>
		<div style="height: 15%; width: 100%; text-align: center;" align="center">
			<h5>수량</h5><br>
			<button class="btn btn-default" id="plus" type="submit" style="width: 15%; height: 100%;" onclick="countminus()">-</button>
			<input type="text" id="number" size="5px" value="<%=count %>" style="text-align: center;"/>
			<button class="btn btn-default" id="minus" type="submit" style="width: 15%; height: 100%;" onclick="countplus()">+</button>
		</div>
		<div class="btn" align="center" style="height: 35%; width:80%; text-align: center;">
			<button type="button" class="btn btn-primary btn-lg btn-block" style="width: 100%; height: 50%;" onclick="">장바구니</button>
			<button type="button" class="btn btn-default btn-lg btn-block" style="width: 100%; height: 50%;" onclick="">구매하기</button>
		</div>
	</div>
</div>
</body>
</html>