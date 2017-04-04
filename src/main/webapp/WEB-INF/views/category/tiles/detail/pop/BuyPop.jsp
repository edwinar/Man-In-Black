<%@page import="java.util.List"%>
<%@page import="com.eagle.men_in_black.model.DetailDto"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%
	int count = 1;
	int PRO_SEQ = Integer.parseInt(request.getParameter("PRO_SEQ"));
	List<DetailDto> detailDtoList = (List<DetailDto>)request.getAttribute("list");
	List<DetailDto> listColor = (List<DetailDto>)request.getAttribute("listColor");
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
<script type="text/javascript" src="http://code.jquery.com/jquery-2.1.0.min.js"></script>
<script type="text/javascript">
$(function() {
	$('#plus').on('click',function(){		
		var num = $('#number').val();
		num = Number(num);
		num = num+1;
		$('#number').val(num);
		//alert(num);
	});
	$('#minus').on('click',function(){		
		var num = $('#number').val();
		num = Number(num);
		if(num>1)num = num-1;
		$('#number').val(num);
		//alert(num);
	});
	$('#colorSelect').change(function(){
		var color = $('#colorSelect option:selected').val();
		//alert(color);
		if(color=='no'){
			$('#sizeSelect').attr('disabled',true);
		}else{
			$('#sizeSelect').attr('disabled',false);
			location.href="BuyPop.mib?PRO_SEQ=<%=PRO_SEQ %>&COLOR="+color;//아작스사용해야한다.
		}
	});
});
</script>
<div align="center" style="text-align: center;">
	<div class="thumbnail" align="center" style="text-align: center;">
		<div class="score" align="center" style="height: 20%; width: 100%; text-align: center;">
			<div style="height: 60%; text-align: center; width: 100%" align="center">
				<h3><%=detailDtoList.get(0).getPRO_NAME() %></h3>
			</div>
			<div style="height: 40%; text-align: center; width: 100%" align="center">
				<h6>옵션과 수량을 선택해주세요.</h6>
			</div>
			<hr style="border: solid black 1px; width: 80%;">
		</div>
		<div align="center" style="height: 15%; width: 100%; text-align: center;">
			<h5>색상</h5>
			<select name=color size=1 id="colorSelect">
		        <option value="no" selected="selected">칼라선택</option>
		        <%
		        	for(int i=0;i<listColor.size();i++){
		        %>
		        	<option value="<%=listColor.get(i).getCOLOR() %>"><%=listColor.get(i).getCOLOR() %></option>
		        <%
		        	}
		        %>
	    	</select>
		</div>
		<div class="info" style="height: 15%; width: 100%; text-align: center;">
			<h5>사이즈</h5><br>
			<select name=size size=1 id="sizeSelect" disabled="disabled">
		        <option value="" selected="selected">사이즈선택</option>
		        <option value="S">S</option>
		        <option value="M">M</option>
	    	</select>
		</div>
		<div style="height: 15%; width: 100%; text-align: center;" align="center">
			<h5>수량</h5><br>
			<button class="btn btn-default" id="minus" type="submit" style="width: 15%; height: 100%;" disabled="disabled">-</button>
			<input type="text" id="number" size="5px" value="<%=count %>" style="text-align: center;" readonly="readonly"/>
			<button class="btn btn-default" id="plus" style="width: 15%; height: 100%;" disabled="disabled">+</button>
		</div>
		<div class="btn" align="center" style="height: 35%; width:80%; text-align: center;">
			<button type="button" class="btn btn-primary btn-lg btn-block" style="width: 100%; height: 50%;" onclick="">장바구니</button>
			<button type="button" class="btn btn-default btn-lg btn-block" style="width: 100%; height: 50%;" onclick="">구매하기</button>
		</div>
	</div>
</div>
</body>
</html>