<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>마이 페이지</title>
<style type="text/css">
body {
	font-family: "Lato", sans-serif;
	color: white;
	/*   background: #171A1D; */
}

#contain {
	margin: 0 auto;
	width: 100%;
	height: 350px;
	margin-top: 150px;
}

#table {
	width: 45%;
	height: 300px;
	display: inline-block;
	float: left;
	background: #171A1D;
	margin-left: 5%;
}

#table1 {
	width: 45%;
	height: 300px;
	display: inline-block;
	float: left;
	background: #171A1D;
	margin-left: 5%;
}

#bo {
	width: 100%;
	height: 220px;
	display: inline-block;
	/*border:3px solid rgba(39, 44, 48, 0.36); */
	float: left;
	background: #171A1D;
	margin-left: 45px;
	margin-top: 50px
}

#table .head {
	font-weight: 900;
	font-size: 30px;
	text-transform: uppercase;
	text-align: center;
	min-height: 60px;
	line-height: 50px;
}

#table1 .head {
	font-weight: 900;
	font-size: 30px;
	text-transform: uppercase;
	text-align: center;
	min-height: 60px;
	line-height: 50px;
}

.cta {
	width: 100%;
	height: 50px;
	margin: 0 auto;
	background: #FDA202;
	text-align: center;
	text-transform: uppercase;
	line-height: 50px;
	font-size: 15px;
	color: #171A1D;
	font-weight: 900;
}

.yellow {
	border-bottom: 5px solid #FDA202;
}

.ta {
	width: 95%;
	text-align: center;
	border-collapse: collapse;
}

table th {
	text-align: center;
}

table td {
	text-align: center;
}

#table.pro {
	background: #15181B;
}

#box_a {
	margin-left: 86px;
	float: left;
	width: 90px;
}

#box_b {
	float: left;
}

#iseqchart th {
	border: 1px solid #333;
	padding: 3px 6px;
}

#iseqchart td {
	border: 1px solid #999;
	padding: 3px 6px;
}

@media only screen and (max-width: 1000px) {
	#turnover, .turnover {
		display: none;
		visibility: hidden;
	}
}

@media only screen and (max-width: 820px) {
	#turnover, .turnover {
		display: none;
		visibility: hidden;
	}
	#yearhigh, .yearhigh {
		display: none;
		visibility: hidden;
	}
}

@media only screen and (max-width: 620px) {
	#turnover, .turnover {
		display: none;
		visibility: hidden;
	}
	#yearhigh, .yearhigh {
		display: none;
		visibility: hidden;
	}
	#dailyhigh, .dailyhigh {
		display: none;
		visibility: hidden;
	}
}
</style>
</head>
<body>

	<h1>마이페이지 메인</h1>
	<div>
		<div id="contain">
			<div id="table">
				<div class="head yellow">사용가능한 쿠폰</div>

				<div class="offer" align="center">
					<table style="text-align: center;">
						<col width="200px">
						<col width="200px">
						<tr>
							<th style="text-align: center;">쿠폰명</th>
							<th style="text-align: center;">할인 금액</th>
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
			<div id="table1" align="center" style="position: relative;">
				<div class="head yellow">적립금</div>
				<p align="center">현재0원</p>
				<table style="text-align: center;">
					<col width="150px">
					<col width="200px%">
					<col width="150px">
					<col width="150px">
					<tr>
						<th style="text-align: center;">날짜</th>
						<th style="text-align: center;">상품명</th>
						<th style="text-align: center;">금액</th>
						<th style="text-align: center;">최종</th>
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
			</div>
		</div>
		<div id="bo">
			<p style="background-color: #FDA202">주문내용</p>
			<table class="ta">

				<tr>
					<th class="turnover">이미지</th>
					<th class="turnover">분류</th>
					<th>상품이름1234512</th>
					<th class="turnover">수량</th>
					<th>재고</th>
					<th class="yearhigh">판매가</th>
					<th class="yearhigh">쿠폰</th>
					<th class="yearhigh">적립금</th>
					<th>결제금액</th>
					<th class="#dailyhigh">판매일</th>
					<th>상태</th>
				</tr>
				<tr>
					<td class="turnover">이미지</td>
					<td class="turnover">분류</td>
					<td>상품이름</td>
					<td class="turnover">수량</td>
					<td>재고</td>
					<th class="yearhigh">판매가</th>
					<th class="yearhigh">쿠폰</th>
					<th class="yearhigh">적립금</th>
					<td>결제금액</td>
					<th class="#dailyhigh">판매일</th>
					<td>상태</td>
				</tr>
				<tr>
					<td class="turnover">이미지</td>
					<td class="turnover">분류</td>
					<td>상품이름</td>
					<td class="turnover">수량</td>
					<td>재고</td>
					<th class="yearhigh">판매가</th>
					<th class="yearhigh">쿠폰</th>
					<th class="yearhigh">적립금</th>
					<td>결제금액</td>
					<th class="#dailyhigh">판매일</th>
					<td>상태</td>
				</tr>
				<tr>
					<td class="turnover">이미지</td>
					<td class="turnover">분류</td>
					<td>상품이름</td>
					<td class="turnover">수량</td>
					<td>재고</td>
					<th class="yearhigh">판매가</th>
					<th class="yearhigh">쿠폰</th>
					<th class="yearhigh">적립금</th>
					<td>결제금액</td>
					<th class="#dailyhigh">판매일</th>
					<td>상태</td>
				</tr>
				<tr>
					<td class="turnover">이미지</td>
					<td class="turnover">분류</td>
					<td>상품이름</td>
					<td class="turnover">수량</td>
					<td>재고</td>
					<th class="yearhigh">판매가</th>
					<th class="yearhigh">쿠폰</th>
					<th class="yearhigh">적립금</th>
					<td>결제금액</td>
					<th class="#dailyhigh">판매일</th>
					<td>상태</td>
				</tr>
			</table>
		</div>
		<div id="bo">
			<p style="background-color: #FDA202">장바구니</p>
			<table class="ta">

				<tr>
					<th class="turnover">이미지</th>
					<th class="turnover">분류</th>
					<th>상품이름1234512</th>
					<th class="turnover">수량</th>
					<th>재고</th>
					<th class="yearhigh">판매가</th>

				</tr>
				<tr>
					<td class="turnover">이미지</td>
					<td class="turnover">분류</td>
					<td>상품이름</td>
					<td class="turnover">수량</td>
					<td>재고</td>
					<th class="yearhigh">판매가</th>
				</tr>
				<tr>
					<td class="turnover">이미지</td>
					<td class="turnover">분류</td>
					<td>상품이름</td>
					<td class="turnover">수량</td>
					<td>재고</td>
					<th class="yearhigh">판매가</th>

				</tr>
				<tr>
					<td class="turnover">이미지</td>
					<td class="turnover">분류</td>
					<td>상품이름</td>
					<td class="turnover">수량</td>
					<td>재고</td>
					<th class="yearhigh">판매가</th>

				</tr>
				<tr>
					<td class="turnover">이미지</td>
					<td class="turnover">분류</td>
					<td>상품이름</td>
					<td class="turnover">수량</td>
					<td>재고</td>
					<th class="yearhigh">판매가</th>
				</tr>
			</table>
		</div>
		<div id="bo">
			<p style="background-color: #FDA202">Q&A</p>
			<table class="ta">

				<tr>
					<th>번호</th>
					<th>상품명</th>
					<th>제목</th>
					<th>날짜</th>
					<th>답변여부</th>
				</tr>
				<tr>
					<td>1</td>
					<td>바지바지</td>
					<td>바지 이뻐여?</td>
					<td>01.06</td>
					<td>답변완료</td>
				</tr>
				<tr>
					<td>2</td>
					<td>티티티</td>
					<td>티티티 이뻐여?</td>
					<td>01.06</td>
					<td>답변완료</td>

				</tr>
				<tr>
					<td>3</td>
					<td>바지바지</td>
					<td>바지 이뻐여?</td>
					<td>01.06</td>
					<td>답변완료</td>
				</tr>
				<tr>
					<td>4</td>
					<td>바지바지</td>
					<td>바지 이뻐여?</td>
					<td>01.06</td>
					<td>답변완료</td>
				</tr>
			</table>
		</div>

	</div>
</body>
</html>