<%@page import="com.eagle.men_in_black.model.UserMypageDto"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%
	List<UserMypageDto> buyList = (List<UserMypageDto>) request.getAttribute("buyList");
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link rel="stylesheet"
	href="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/css/bootstrap.min.css">
<style type="text/css">

td, th {
	text-align: center;
}
</style>
<title>::구매내역::</title>
</head>
<body>
	<center>
		<div id="mypagehead">
			<h4 align="right" style="margin-right: 100px">
				<a href="meninblack.mib">홈</a> > <a href="mymain.mib">MY PAGE</a> >
				<a href="buylist.mib">구매내역</a>
			</h4>
			<h3>MY Order</h3>
			<h4>회원님이 M.I.B에서 구매하신 내역입니다.</h4>
		</div>
	</center>

	<div  align="right">
		<p> <input type="date" height="50px">~<input type="date" value="2017-03-27">
			<a href="#" class="btn btn-primary" role="button">1주</a> 
			<a href="#"class="btn btn-primary" role="button">1개월</a> 
			<a href="#"class="btn btn-primary" role="button">3개월</a> 
		</p>
	</div>



	<div>



		<div id="total" style="margin-top: 100px">
			<div id="table" style="width: 90%">
				<form name="f1">
					<table class="table">
				<col width="9%">
				<col width="7%">
				<col width="23%">
				<col width="6%">
				<col width="6%">
				<col width="7%">
				<col width="7%">
				<col width="7%">
				<col width="9%">
				<col width="12%">
				<col width="7%">
				<tr height="40px">
					<th class="boardone">이미지</th>
					<th class="boardone">분류</th>
					<th>상품이름1234512</th>
					<th class="boardone">수량</th>
					<th class="boardtwo">판매가</th>
					<th class="boardtwo">쿠폰</th>
					<th class="boardtwo">적립금</th>
					<th>결제금액</th>
					<th class="#boardthree">판매일</th>
					<th>상태</th>
				</tr>
				<%for(int i = 0; i<buyList.size(); i++){ %>
				<tr height="30px" >
					<td class="boardone" rowspan="2"><img alt="not found"src="../images/LOVE.jpg" style="width: 100px; height: 100px"></td>
					<td class="boardone" rowspan="2" valign="middle"><%=buyList.get(i).getSUB_ITEM() %></td>
					<td><%=buyList.get(i).getPRO_NAME()%></td>
					<td class="boardone" rowspan="2" valign="middle"><%=buyList.get(i).getSEL_NUM() %></td>
					<th class="boardtwo" rowspan="2" valign="middle"><%=buyList.get(i).getSEL_NUM() %></th>
					<th class="boardtwo" rowspan="2" valign="middle"><%=buyList.get(i).getCOUPON() %></th>
					<th class="boardtwo" rowspan="2" valign="middle"><%=buyList.get(i).getPOINT() %></th>
					<td rowspan="2" valign="middle"><%=buyList.get(i).getFINAL_PRICE() %></td>
					<th class="#boardthree" rowspan="2" valign="middle"><%=buyList.get(i).getSEL_TIME() %></th>
					<td rowspan="2" valign="middle"><%=buyList.get(i).getDEL_STEP() %></td>
				</tr>
				<tr>
					<td><%=buyList.get(i).getSEL_SIZE() %> : <%=buyList.get(i).getSEL_COLOR() %></td>
				</tr>
					<%}%>
			</table>

				</form>

			</div>

		</div>

		<div class="row" align="center">
			<p>
				<a href="#" class="btn btn-default" role="button"><</a> 
				<a href="#"class="btn btn-default" role="button">1</a> 
					<a href="#"class="btn btn-default" role="button">2</a> 
					<a href="#"class="btn btn-default" role="button">3</a> 
					<a href="#"class="btn btn-default" role="button">4</a> 
					<a href="#"class="btn btn-default" role="button">></a>
			</p>
		</div>
	</div>
</body>
</html>