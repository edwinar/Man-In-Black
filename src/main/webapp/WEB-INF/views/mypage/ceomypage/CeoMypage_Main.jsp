<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<link rel="stylesheet"
	href="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/css/bootstrap.min.css">
<style type="text/css">
td, th {
	text-align: center;
}
</style>
</head>
<body>
	<center>
		<div id="mypagehead">
			<h4 align="right" style="margin-right: 100px">
				<a href="MenInBlack.jsp">홈</a> > <a href="mymain.mib">MY PAGE</a> >
				<a href="ceoMypage_Main.mib">구매내역</a>
			</h4>
			<h4>M.I.B 판매 내역입니다.</h4>
		</div>
	</center>

	<div align="center">
		<p>
			<input type="date" height="50px">~<input type="date"
				value="2017-03-27"> <a href="#" class="btn btn-primary"
				role="button">1주</a> <a href="#" class="btn btn-primary"
				role="button">1개월</a> <a href="#" class="btn btn-primary"
				role="button">3개월</a>
		</p>
	</div>
	<!--엑셀로 다운받기-->
	<div align="right">
		<button type="button" class="btn btn-success">
			엑셀 다운로드 <span class="glyphicon glyphicon-download-alt"
				aria-hidden="true"></span>
		</button>
	</div>
	<!--검색(유저ID,상품이름)-->
		<div class="col-lg-6" style="width: 800px; padding-left: 440px">
			<div class="input-group">
				<input type="text" class="form-control" placeholder="유저ID,상품이름">
				<span class="input-group-btn">
					<button class="btn btn-default" type="button">검색</button>
				</span>
			</div>
			<!-- /input-group -->
		</div>
		<!-- /.col-lg-6 -->


	<div id="total" style="margin-top: 100px">
		<div id="table" style="width: 90%">
			<form name="f1">
				<table class="table">
					<col width="5%">
					<col width="9%">
					<col width="50%">
					<col width="10%">
					<tr>

						<th>번호</th>
						<th>이미지</th>
						<th>상품정보</th>
						<th>가격</th>
					</tr>

					<tr>

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

			</form>

		</div>

	</div>

	<div class="row" align="center">
		<p>
			<a href="#" class="btn btn-default" role="button"><</a> <a href="#"
				class="btn btn-default" role="button">1</a> <a href="#"
				class="btn btn-default" role="button">2</a> <a href="#"
				class="btn btn-default" role="button">3</a> <a href="#"
				class="btn btn-default" role="button">4</a> <a href="#"
				class="btn btn-default" role="button">></a>
		</p>
	</div>
	</div>

</body>
</html>