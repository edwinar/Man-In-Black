<%@page import="com.eagle.men_in_black.model.MainDto"%>
<%@page import="com.eagle.men_in_black.model.DetailDto"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%
	List<DetailDto> basketList = (List<DetailDto>)request.getAttribute("basketList");
	MainDto dto = (MainDto)request.getSession().getAttribute("LoginInfo");
	List<DetailDto> couponList = (List<DetailDto>)request.getAttribute("couponList");
	Object points = (Object)request.getAttribute("points");
	int finalPrice = 0;
%>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link rel="stylesheet" href="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/css/bootstrap.min.css">
<title>:::Detail_Buy_Info:::</title>
<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.1.1/jquery.min.js"></script>
<style type="text/css">
//체크박스 싸이즈 크게
.chbox {
	width: 20px;
	height: 20px
}

td, th {
	text-align: center;
}
#order{
	width: 90%;
}
#leftOrder{
	float: left;
	width: 50%;
}
#rightOrder{
	float: right;
	width: 50%;
	border-left: solid black 1px;
}
#gift{
	width: 90%;
}
#leftGift{
	float: left;
	width: 50%;
}
#rightGift{
	float: right;
	width: 50%;
	border-left: solid black 1px;
}
</style>
</head>
<body>
<center>
<div id="mypagehead">
	<h3 style="margin-top: 50px;">결제/주문</h3>
</div>
</center>

<div id="total" style="margin-top: 50px;" align="center">
	<div id="table" style="width: 90%">
		<form name="f1">
			<table class="table">
				<col width="5%"><col width="9%"><col width="45%"><col width="10%"><col width="10%">
				<tr>
					<th>번호</th>
					<th>이미지</th>
					<th>상품정보</th>
					<th>가격정보</th>
					<th>가격</th>
				</tr>
				
				<%
					for(int i=0;i<basketList.size();i++){
						int count = i+1;
				%>
					<tr>
						<td rowspan="2"><%=count %>번</td>
						<td rowspan="2">
							<img alt="not found" src="../images/LOVE.jpg" style="width: 100px; height: 100px">
						</td>
						<td><%=basketList.get(i).getPRO_NAME() %></td>
						<td>수량 : <%=basketList.get(i).getBAS_PRO_NUM() %></td>
						<td><%=basketList.get(i).getPRO_PRICE() %> Won</td>
					</tr>
					<tr>
						<td>SIZE:<%=basketList.get(i).getPRO_SIZE() %>, COLOR: <%=basketList.get(i).getCOLOR() %></td>
						<td>상품 합계</td>
						<td id="finalPrice"><%=basketList.get(i).getBAS_PRO_NUM()*basketList.get(i).getPRO_PRICE() %> Won</td>
					</tr>
				<%
						finalPrice = finalPrice + (basketList.get(i).getBAS_PRO_NUM()*basketList.get(i).getPRO_PRICE());
					}
				%>
				
				
			</table>
		</form>
	</div>
</div>

<div id="orderInfo" style="margin-top: 100px;" align="center">
	<hr style="border: solid black 1px; width: 90%;" align="center">
	<div id="order">
		<div id="leftOrder">
			<table class="orderTable" width="90%" height="400px">
			<col width="20%"/><col width="50%"/><col width="30%"/>
				<tr>
					<td colspan="3">주문인</td>
				</tr>
				<tr>
					<td>이름</td>
					<td colspan="2" id="orderName"><%=dto.getUSER_NAME() %></td>
				</tr>
				<tr>
					<td>이메일</td>
					<td colspan="2" id="orderEmail"><%=dto.getEMAIL() %></td>
				</tr>
				<tr>
					<td>휴대전화</td>
					<td colspan="2" id="orderPhone"><%=dto.getTEL() %></td>
				</tr>
				<tr>
					<td rowspan="3">주소</td>
					<td colspan="2">
						<input type="text" size="10px" readonly="readonly" id="orderNum" value="<%=dto.getPOSTCODE() %>" style="text-align: center;"/>&nbsp&nbsp&nbsp&nbsp<input type="submit" value="우편번호" disabled="disabled"/>
					</td>
				</tr>
				<tr>
					<td colspan="2">
						<input type="text" size="42px" readonly="readonly" id="orderAddress_1" value="<%=dto.getADDRESS() %>"/>
					</td>
				</tr>
				<tr>
					<td colspan="2">
						<input type="text" size="42px" readonly="readonly" id="orderAddress_2" value="<%=dto.getDETAILADDRESS() %>"/>
					</td>
				</tr>
			</table>
		</div>
		<div id="rightOrder">
			<table class="orderTable" width="90%" height="400px">
			<col width="20%"/><col width="50%"/><col width="30%"/>
				<tr>
					<td colspan="2" style="padding-left: 150px">수령인</td>
					<td colspan="1">
						<input type="checkbox" id="ch" class="chbox" style="width: 20px; height: 20px"/>
						주문자와 동일
					</td>
				</tr>
				<tr>
					<td>이름</td>
					<td colspan="2" id="receiveName"></td>
				</tr>
				<tr>
					<td>이메일</td>
					<td colspan="2" id="receiveEmail"></td>
				</tr>
				<tr>
					<td>휴대전화</td>
					<td colspan="2" id="receivePhone"></td>
				</tr>
				<tr>
					<td rowspan="3">주소</td>
					<td colspan="2">
						<input type="text" size="10px" id="receiveNum" style="text-align: center;"/>&nbsp&nbsp&nbsp&nbsp<input type="submit" value="우편번호"/>
					</td>
				</tr>
				<tr>
					<td colspan="2">
						<input type="text" size="42px" id="receiveAddress_1"/>
					</td>
				</tr>
				<tr>
					<td colspan="2">
						<input type="text" size="42px" id="receiveAddress_2"/>
					</td>
				</tr>
			</table>
		</div>
	</div>
</div>
<div id="giftInfo" style="margin-top: 500px;" align="center">
	<hr style="border: solid black 1px; width: 90%;" align="center">
	<div id="gift">
		<div id="leftGift">
			<table class="giftTable" width="90%" height="150px">
			<col width="20%"/><col width="50%"/><col width="30%"/>
				<tr>
					<td colspan="3">쿠폰</td>
				</tr>
				<tr>
					<td colspan="2">쿠폰선택</td>
					<td rowspan="2">
						<button style="width: 80%; height: 80%;" id="couponBtn">적용하기</button>
					</td>
				</tr>
				<tr>
					<td colspan="2">
						<select name=coupon size=1 id="couponChoice">
					        <option value="no" selected="selected">미선택</option>
					        <%
					        	for(int i=0;i<couponList.size();i++){
					        %>
					        	<option value="<%=couponList.get(i).getCOUP_PRICE() %>"><%=couponList.get(i).getCOUP_NAME() %></option>
					        <%
					        	}
					        %>
				    	</select>
					</td>
				</tr>
			</table>
		</div>
		<div id="rightGift">
			<table class="giftTable" width="90%" height="150px">
			<col width="35%"/><col width="35%"/><col width="30%"/>
				<tr>
					<td colspan="3">적립금</td>
				</tr>
				<tr>
					<td>사용가능적립금</td>
					<td><%=points %></td>
					<td>Won 사용가능</td>
				</tr>
				<tr>
					<td colspan="2">
						<input type="text" size="30px" id="pointValue"/>
					</td>
					<td>
						<button id="pointBtn">Won 사용하기</button>
					</td>
				</tr>
			</table>
		</div>
	</div>
</div>
<div style="margin-top: 250px; margin-bottom: 50px;" align="center">
	<hr style="border: solid black 1px; width: 90%;" align="center">
	<table width="30%" height="100px">
	<col width="50%"/><col width="50%"/>
		<tr>
			<td>배송비</td>
			<td>3000 Won</td>
		</tr>
		<tr>
			<td>총 결제 금액</td>
			<td id="final"><%=finalPrice %> Won</td>
		</tr>
		<tr>
			<td colspan="2">
				<button style="width: 80%; height: 100%" onclick="buy()">결제하기</button>
			</td>
		</tr>
	</table>
</div>
<script type="text/javascript">
$(function() {
	$('#ch').on('click',function(){
		if($("#ch").is(':checked')){		
			var name = $("#orderName").text();	
			var email = $("#orderEmail").text();
			var phone = $("#orderPhone").text();
			var num = $("#orderNum").val();
			var address_1 = $("#orderAddress_1").val();
			var address_2 = $("#orderAddress_2").val();
			
			$("#receiveName").text(name);
			$("#receiveEmail").text(email);
			$("#receivePhone").text(phone);
			$("#receiveNum").val(num);
			$("#receiveAddress_1").val(address_1);
			$("#receiveAddress_2").val(address_2);	
		}else{
			$("#receiveName").text('');
			$("#receiveEmail").text('');
			$("#receivePhone").text('');
			$("#receiveNum").val('');
			$("#receiveAddress_1").val('');
			$("#receiveAddress_2").val('');	
		}
	});
	$('#couponBtn').on('click',function(){
		var couponValue = $("#couponChoice option:selected").val();
		var finalPrice = "<%=finalPrice %>";
		if(couponValue=="no"){
			
		}else{
			finalPrice = finalPrice - couponValue;
			$('#final').text(finalPrice+" Won");
		}
	});
	$('#pointBtn').on('click',function(){
		var useablePoints = <%=points %>;
		var pointsValue = $('#pointValue').val();
		var finalPrice = "<%=finalPrice %>";
		if(pointsValue==""||pointsValue==null){
			
		}else{
			if(pointsValue>useablePoints){
				alert(useablePoints+"를 넘습니다.");
			}else{
				finalPrice = finalPrice - pointsValue;
				$('#final').text(finalPrice+" Won");
			}
		}
	});
});
function buy() {
	alert("결제가 완료되었습니다! 호갱님ㅎㅎ");
}
</script>
</body>
</html>