<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>::쿠폰 & 적립금::</title>
<style type="text/css">
//쿠폰바디 폰트
body {
	font-family: "Lato", sans-serif; 
}
//쿠폰 콘테인 다이브 
#couponcontain {
	margin: 0 auto;
	width: 100%;
	height: 700px;
	margin-top: 150px;
}
//쿠폰 적립금 다이브
#divl {
	width: 45%;
	height: 377px;
	display: inline-block;
	border:2px solid rgba(39, 44, 48, 0.36); 
	float: left;
	//background: #171A1D;
	margin-left: 45px;
}
//쿠폰 적립금 다이브 헤드
#divl .head {
	font-weight: 900;
	font-size: 30px;
	text-transform: uppercase;
	text-align: center;
	min-height: 60px;
	line-height: 50px;
}


//페이징 처리 공간 
.paging {
	width: 100%;
	height: 30px;
	margin: 0 ;
	text-align: center;
	text-transform: uppercase;
	line-height: 30px;
	font-size: 15px;
	font-weight: 900;
	
}
//쿠폰 적립금 라인 
.gray {
	border-bottom: 5px solid #696969;
}


</style>
</head>
<body>
<center>
<div id="mypagehead">
<h4 align="right" style="margin-right: 100px"><a href="MenInBlack.jsp">홈</a> > 
<a href="mymain.mib">MY PAGE</a> > 
<a href="coupon_Mileage.mib">쿠폰&적립금</a></h4>
<h3>MY Order</h3>
<h4>회원님이 M.I.B에서 받으신 쿠폰 및 적립 내역입니다.</h4>
</div>
</center>
	<div id="couponcontain">
		<div id="table">
			<div class="head gray">사용가능한 쿠폰</div>

			<div class="offer" align="center">
				<table style="text-align: center;">
				<col width="200px"><col width="200px">
					<tr>
						<th style="text-align: center; margin-top: 10px">쿠폰명</th>
						<th style="text-align: center; margin-top: 10px">할인 금액</th>
					</tr>
					<tr>
						<td>생일푹하 쿠폰</td>
						<td>1000원할인</td>
					</tr>
				</table>
			</div>
			<div>
				<!--페이징 -->
			</div>
		</div>
		<div id="table" align="center" style=" position: relative;">
			<div class="head gray">적립금</div>
			<p align="center">현재0원</p>
			<table style="text-align: center;">
				<col width="150px">
				<col width="200px%">
				<col width="150px">
				<col width="150px">
				<tr>
					<th style="text-align: center; margin-top: 5px">날짜</th>
					<th style="text-align: center;margin-top: 5px">상품명</th>
					<th style="text-align: center;margin-top: 5px">금액</th>
					<th style="text-align: center;margin-top: 5px">최종</th>
				</tr>
				<tr>
					<td>01.02</td>
					<td>jean</td>
					<td>100원</td>
					<td>100원</td>
				</tr>
				<tr>
					<td>01.03</td>
					<td>outer</td>
					<td>100원</td>
					<td>200원</td>
				</tr>

			</table>
			<div class="paging" style="position:absolute; right:0px; bottom:0px">1 2 3 4 5</div>
		</div>
		
	</div>
</body>
</html>