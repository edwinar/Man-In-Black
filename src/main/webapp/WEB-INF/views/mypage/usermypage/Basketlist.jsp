<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link rel="stylesheet"
	href="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/css/bootstrap.min.css">
<style type="text/css">
.ch {
	width: 20px;
	height: 20px
}
td,th {
text-align: center;


}
</style>
<title>::장바구니::</title>
</head>
<body>
	<div id="total" style="height: 600px; margin-top: 300px">
		<div id="table" style="width: 90%">
			<form name="f1">
				<table class="table" >
					<col width="5%">
					<col width="5%">
					<col width="9%">
					<col width="50%">
					<col width="10%">
					<tr>
						<th><input type="checkbox" id="allCheck"
							style="width: 20px; height: 20px" c></th>
						<th>번호</th>
						<th>이미지</th>
						<th>상품정보</th>
						<th>가격</th>
					</tr>

					<tr>
						<td rowspan="2"><input type="checkbox" onclick="ty(1)"
							value="10000" id="ch1" class="ch"></td>
						<td rowspan="2">1번</td>
						<td rowspan="2"><img alt="not found" src="../images/LOVE.jpg"
							style="width: 100px; height: 100px"></td>
						<td>창거니가 어제 입던 소매티</td>
						<td rowspan="2">10000 Won</td>
					</tr>
					<tr>
						<td>SIZE:L, COLOR: green</td>
					</tr>
					<tr>
						<td rowspan="2"><input type="checkbox" onclick="ty(2)"
							value="20000" id="ch2" class="ch"></td>
						<td rowspan="2">2번</td>
						<td rowspan="2"><img alt="not found" src="../images/LOVE.jpg"
							style="width: 100px; height: 100px"></td>
						<td>창거니가 어제 입던 소매티</td>
						<td rowspan="2">20000 Won</td>
					</tr>
					<tr>
						<td>SIZE:L, COLOR: green</td>
					</tr>
					<tr>
						<td rowspan="2"><input type="checkbox" onclick="ty(3)"
							value="30000" id="ch3" class="ch"></td>
						<td rowspan="2">2번</td>
						<td rowspan="2"><img alt="not found" src="../images/LOVE.jpg"
							style="width: 100px; height: 100px"></td>
						<td>창거니가 어제 입던 소매티</td>
						<td rowspan="2">30000 Won</td>
					</tr>
					<tr>
						<td>SIZE:L, COLOR: green</td>
					</tr>

				</table>
				배송료, 선택 상품 합계 금액<input type="text" id="pay" value="">
			</form>

		</div>
		<div id="결제"></div>
	</div>
	<script type="text/javascript">
		var b = 0;
		function ty(n) {
			if (document.f1.elements[n].checked == true) {
				b += Number(document.f1.elements[n].value);
				document.getElementById('pay').value = b;
			} else if (document.f1.elements[n].checked == false) {
				b -= Number(document.f1.elements[n].value);
				document.getElementById('pay').value = b;
			}
		}

		$(function() {
			$("#allCheck").click(function() {
				b=0;
				if ($("#allCheck").prop("checked")) {
					$("input[type=checkbox]").prop("checked", true);
				} else if($("#allCheck").prop("checked", false)){
					$("input[type=checkbox]").prop("checked", false);
				}for (var i = 1; i < 4; i++) {
					if (document.f1.elements[i].checked == true) {
						b += Number(document.f1.elements[i].value);
						document.getElementById('pay').value = b;
					} else{
						
						document.getElementById('pay').value = 0;
					}
				}
			})
			
		})

		
		
	</script>


</body>
</html>