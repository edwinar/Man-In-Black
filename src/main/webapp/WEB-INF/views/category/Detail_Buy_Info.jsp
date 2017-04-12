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
	String rootPath = request.getContextPath();
	int finalPrice = 0;
	int deliveryFee = 0;
	int finalFee = 0;
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
				<col width="10%"><col width="9%"><col width="30%"><col width="10%"><col width="20%">
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
						<img alt="not found" src="..<%=rootPath %>/images/<%=basketList.get(i).getSTORED_NAME() %>" style="width: 100px; height: 100px">
					</td>
					<td><%=basketList.get(i).getPRO_NAME() %></td>
					<td>수량 : <%=basketList.get(i).getBAS_PRO_NUM() %></td>
					<td><%=basketList.get(i).getPRO_PRICE() %> Won</td>
				</tr>
				<tr>
					<td>SIZE:<%=basketList.get(i).getPRO_SIZE() %>, COLOR: <%=basketList.get(i).getCOLOR() %></td>
					<td>상품 합계</td>
					<td id="finalPrice"><%=basketList.get(i).getBAS_PRO_NUM()*basketList.get(i).getPRO_PRICE() %> Won</td>
					<input type="hidden" id="ffip" value="<%=basketList.get(i).getBAS_PRO_NUM()*basketList.get(i).getPRO_PRICE() %>">
				</tr>
				<%
					finalPrice = finalPrice + (basketList.get(i).getBAS_PRO_NUM()*basketList.get(i).getPRO_PRICE());
				}
				if(finalPrice<50000) deliveryFee = 2500;
				else deliveryFee = 0;
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
						<input type="text" size="10px" readonly="readonly" id="orderNum" value="<%=dto.getPOSTCODE() %>" style="text-align: center;"/>&nbsp&nbsp&nbsp&nbsp<input type="submit" class="btn btn-default" value="우편번호" disabled="disabled"/>
					</td>
				</tr>
				<tr>
					<td colspan="2">
						<input type="text" size="30px" readonly="readonly" id="orderAddress_1" value="<%=dto.getADDRESS() %>"/>
					</td>
				</tr>
				<tr>
					<td colspan="2">
						<input type="text" size="30px" readonly="readonly" id="orderAddress_2" value="<%=dto.getDETAILADDRESS() %>"/>
					</td>
				</tr>
			</table>
		</div>
		<div id="rightOrder">
		<form action="buymymain.mib" id="form">
		<%
			for(int i = 0; i<basketList.size();i++){
		%>
			<input type="hidden" value="<%=basketList.get(i).getBAS_SEQ()%>" name="BAS_SEQ<%=i%>"/>
		<%
			}
		%>
			<input type="hidden" name="basketListSize" value="<%=basketList.size()%>"/>
			<input type="hidden" name="DEL_PRICE" id="DEL_PRICE"/>
			<input type="hidden" name="FINAL_PRICE" id="FINAL_PRICE"/>
			<input type="hidden" name="POINT" id="POINT"/>
			<input type="hidden" name="COUPON" id="COUPON"/>
			<input type="hidden" name="COUP_SEQ" id="COUP_SEQ"/>
			<table class="orderTable" width="90%" height="400px">
			<col width="20%"/><col width="50%"/><col width="30%"/>
				<tr>
					<td colspan="2" style="padding-left: 150px">수령인</td>
					<td colspan="1">
						<input type="checkbox" id="ch" class="chbox" style="width: 20px; height: 20px"/>
						주문자동일
					</td>
				</tr>
				<tr>
					<td>이름</td>
					<td colspan="2">
					<input type="text" id="receiveName" name="receiveName"/>
					</td>
				</tr>
				<tr>
					<td>이메일</td>
					<td colspan="2">
					<input type="text" id="receiveEmail" name="receiveEmail"/>
					</td>
				</tr>
				<tr>
					<td>휴대전화</td>
					<td colspan="2">
					<input type="text" id="receivePhone" name="receivePhone"/>
					</td>
				</tr>
				<tr>
					<td rowspan="3">주소</td>
					<td colspan="2">
						<input type="text" size="10px" id="receiveNum" name="receiveNum" style="text-align: center;"/>&nbsp&nbsp&nbsp&nbsp<input type="submit" class="btn btn-default" value="우편번호"/>
					</td>
				</tr>
				<tr>
					<td colspan="2">
						<input type="text" size="30px" id="receiveAddress_1" name="receiveAddress_1"/>
					</td>
				</tr>
				<tr>
					<td colspan="2">
						<input type="text" size="30px" id="receiveAddress_2" name="receiveAddress_2"/>
					</td>
				</tr>
			</table>
			</form>
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
					<td colspan="3">쿠폰선택</td>
					
					<!-- <td rowspan="2">
						<button style="width: 80%; height: 80%;" id="couponBtn">적용하기</button>
					</td> -->
				</tr>
				<tr>
					<td colspan="3">
						<select name=coupon style="width: 100px;" size=1 id="couponChoice">
					        <option value="0" selected="selected">미선택</option>
					        <%
					        	for(int i=0;i<couponList.size();i++){
					        %>
					        	<option value="<%=couponList.get(i).getCOUP_PRICE()%>,<%=couponList.get(i).getCOUP_SEQ()%>"><%=couponList.get(i).getCOUP_NAME() %></option>
					        <%
					        	}
					        %>
				    	</select>
					</td>
				</tr>
				<tr>
					<td colspan="3" id="copricetd"></td>
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
					<td colspan="2" style="text-align: right;">
						<input type="text" size="20px" id="pointValue"  onkeypress="onlyNumber();"/>
					</td>
					<td>
						<button id="pointBtn" class="btn btn-default">사용하기</button>
					</td>
				</tr>
				<tr>
					<td colspan="3" ></td>
				</tr>
			</table>
		</div>
	</div>
</div>
<div style="margin-top: 250px; margin-bottom: 50px;" align="center">
	<hr style="border: solid black 1px; width: 90%;" align="center">
	<table width="30%" height="100px">
	<col width="50%"/><col width="40%"/><col width="10%"/>
		<tr>
			<td>배송비</td>
			<td id="deliveryFee"><%=deliveryFee %></td>
			<td>Won</td>
		</tr>
		<tr>
		<td>쿠폰사용금액</td>
		<td id="couusepri"></td>
		<td>Won</td>
		</tr>
		<tr>
		<td>포인트사용금액</td>
		<td id="pousepri"></td>
		<td>Won</td>
		</tr>
		<tr>
			<td>총 결제 금액</td>
			<td id="final">
			<%
				if(deliveryFee==2500){
			%>
			<%=finalPrice + deliveryFee%>
			<%
				}else{
			%>
			<%=finalPrice%>
			<%
				}
			%>
			</td>
			<td>Won</td>
		</tr>
		<tr>
			<td colspan="3">
				<button style="width:100%; height: 40px" id="buy" class="btn btn-default">결제하기</button>
			</td>
		</tr>
	</table>
</div>
<script type="text/javascript">
$(function() {
var finalPrice = "<%=finalPrice %>";
var midPrice;
	$('#ch').on('click',function(){
		if($("#ch").is(':checked')){		
			var name = $("#orderName").text();	
			var email = $("#orderEmail").text();
			var phone = $("#orderPhone").text();
			var num = $("#orderNum").val();
			var address_1 = $("#orderAddress_1").val();
			var address_2 = $("#orderAddress_2").val();
			
			$("#receiveName").val(name);
			$("#receiveEmail").val(email);
			$("#receivePhone").val(phone);
			$("#receiveNum").val(num);
			$("#receiveAddress_1").val(address_1);
			$("#receiveAddress_2").val(address_2);	
		}else{
			$("#receiveName").val('');
			$("#receiveEmail").val('');
			$("#receivePhone").val('');
			$("#receiveNum").val('');
			$("#receiveAddress_1").val('');
			$("#receiveAddress_2").val('');	
		}
	});
	$('#couponBtn').on('click',function(){
		var couponValue = $("#couponChoice option:selected").val();
		var array = couponValue.split(",");
		midPrice = finalPrice;
		if(array[0]=="no"){
			$('#final').text(midPrice);
			$('#pointValue').attr('disabled',false);
			$('#pointBtn').attr('disabled',false);
			$('#couponBtn').attr('disabled',true);
			$('#couponChoice').attr('disabled',true);
		}else{
			midPrice = midPrice - array[0];
			$('#final').text(midPrice);
			$('#pointValue').attr('disabled',false);
			$('#pointBtn').attr('disabled',false);
			$('#couponBtn').attr('disabled',true);
			$('#couponChoice').attr('disabled',true);
		}
		deliveryFeeChange();
	});
	
	var couppri = "";
	
	$("#couponChoice").change(function() {
		var couponValue = $("#couponChoice option:selected").val();
		var array = couponValue.split(",");
		couppri = array[0];
		var pointsValue = $('#pointValue').val();
		$("#copricetd").text('쿠폰가격은 '+array[0]+'입니다.');
		$("#couusepri").text(array[0]);
		var pointsValue = $('#pointValue').val();
	
		if(pointsValue==''){
			$('#final').text($('#ffip').val()-array[0]);
		}else{
			$('#final').text(($('#ffip').val()-array[0])-pointsValue);
		}
	
	});
	
	
	
	
	
	
	
	$('#pointBtn').on('click',function(){
		var useablePoints = <%=points %>;
		var pointsValue = $('#pointValue').val();
		if(pointsValue==""||pointsValue==null){
			$('#final').text(midPrice);
		}else{
			if(pointsValue>useablePoints){
				alert(useablePoints+"를 넘습니다.");
				$('#final').text(midPrice);
				$('#pointValue').val("0");
			}else{
				$("#pousepri").text(pointsValue);
				
				if(couppri==''){
					//alert("여기들어오니111?");
					$('#final').text($('#ffip').val()-pointsValue);
				}else{
					//alert("여기들어오니222?");
					$('#final').text(($('#ffip').val()-couppri)-pointsValue);
				}
				
				//finalPrice = midPrice - pointsValue; 최종금액 바꾸는부분 
				
			}
		}
		deliveryFeeChange();
	});
	$('#buy').on('click',function(){
		if($('#receiveName').val()==""||$('#receiveName').val()==null||
			$('#receiveEmail').val()==""||$('#receiveEmail').val()==null||
			$('#receivePhone').val()==""||$('#receivePhone').val()==null||
			$('#receiveNum').val()==""||$('#receiveNum').val()==null||
			$('#receiveAddress_1').val()==""||$('#receiveAddress_1').val()==null||
			$('#receiveAddress_2').val()==""||$('#receiveAddress_2').val()==null){
			alert("수령인의 정보를 모두 채우시오");
		}else{
			$('#form').submit();
		}
	});
});
function onlyNumber(){
    if((event.keyCode<48)||(event.keyCode>57))event.returnValue=false;
}
function deliveryFeeChange(){
	var value=$('#final').text();
	if(value<50000){
		$('#deliveryFee').text("2500");
	}else{
		$('#deliveryFee').text("0");
	}
	var deliveryFee = $('#deliveryFee').text();
	$('#final').text(parseInt(deliveryFee)+parseInt(value));
	//////////////////////////////////
	$("#DEL_PRICE").val(deliveryFee);
	var fp = $('#final').text();
	var couponTwo = $("#couponChoice option:selected").val();
	var point = $("#pointValue").val();
	$("#FINAL_PRICE").val(fp);
	$("#POINT").val(point);
	var array = couponTwo.split(",");
	$("#COUPON").val(array[0]);
	$("#COUP_SEQ").val(array[1]);
}
</script>
</body>
</html>