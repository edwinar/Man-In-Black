<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link rel="stylesheet"
	href="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/css/bootstrap.min.css">
<title>::마이 페이지::</title>
<style type="text/css">
body {
	font-family: "Lato", sans-serif;
}

#contain {
	margin: 0 auto;
	width: 100%;
	height: 330px;
	margin-top: 100px;
}


#divl {
	width: 45%;
	height: 300px;
	display: inline-block;
	float: left;
	margin-left: 5%;
	border: 2px solid rgba(39, 44, 48, 0.36);
}

#divr {
	width: 45%;
	height: 300px;
	display: inline-block;
	float: left;
	margin-left: 5%;
	border: 2px solid rgba(39, 44, 48, 0.36);
}

#boarddiv {
	width: 100%;
	display: inline-block;
	float: left; //
	background: #171A1D;
	margin-left: 45px;
	margin-top: 50px
}

#divl .head {
	font-weight: 900;
	font-size: 30px;
	text-transform: uppercase;
	text-align: center;
	min-height: 60px;
	line-height: 50px;
}

#divr .head {
	font-weight: 900;
	font-size: 30px;
	text-transform: uppercase;
	text-align: center;
	min-height: 60px;
	line-height: 50px;
}


.parea {
	border-bottom: 5px solid #696969;
}

td, th {
	text-align: center;
}


@media only screen and (max-width: 1600px) {
	#boardone, .boardone {
		display: none;
		visibility: hidden;
	}
}

@media only screen and (max-width: 1300px) {
	#boardone, .boardone {
		display: none;
		visibility: hidden;
	}
	#boardtwo, .boardtwo {
		display: none;
		visibility: hidden;
	}
}

@media only screen and (max-width: 1100px) {
	#boardone, .boardone {
		display: none;
		visibility: hidden;
	}
	#boardtwo, .boardtwo {
		display: none;
		visibility: hidden;
	}
	#boardthree, .boardthree {
		display: none;
		visibility: hidden;
	}
}
</style>
</head>
<body>
<center>
	<div id="mypagehead">
		<h4 align="right" style="margin-right: 100px">
			<a href="MenInBlack.jsp">홈</a> > <a href="mymain.mib">MY PAGE</a>
		</h4>
		<h3>MY Order</h3>
		<h4>회원님의 마이페이지입니다.</h4>
	</div>
</center>

	<div>
		<div id="contain" onclick="location.href='coupon_Mileage.mib'">
			<div id="divl">
				<div class="head parea">사용가능한 쿠폰</div>

				<div  align="center">
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

			</div>
			<div id="divr" align="center" style="position: relative;">
				<div class="head parea">적립금</div>
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
			<button type="button" onclick="location.href='coupon_Mileage.mib'" style="margin-left: 94%" class="btn btn-default"> 더보기</button>
		</div>



		<div id="boarddiv" onclick="location.href='buylist.mib'">
			<p style="background-color: #696969">주문내용</p>
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
					<th>재고</th>
					<th class="boardtwo">판매가</th>
					<th class="boardtwo">쿠폰</th>
					<th class="boardtwo">적립금</th>
					<th>결제금액</th>
					<th class="#boardthree">판매일</th>
					<th>상태</th>
				</tr>
				<tr height="30px">
					<td class="boardone" rowspan="2"><img alt="not found"
						src="../images/LOVE.jpg" style="width: 100px; height: 100px"></td>
					<td class="boardone" rowspan="2" valign="middle">분류</td>
					<td>상품이름</td>
					<td class="boardone" rowspan="2" valign="middle">수량</td>
					<td rowspan="2">재고</td>
					<th class="boardtwo" rowspan="2" valign="middle">판매가</th>
					<th class="boardtwo" rowspan="2" valign="middle">쿠폰</th>
					<th class="boardtwo" rowspan="2" valign="middle">적립금</th>
					<td rowspan="2" valign="middle">결제금액</td>
					<th class="#boardthree" rowspan="2" valign="middle">판매일</th>
					<td rowspan="2" valign="middle">상태</td>
				</tr>
				<tr>
					<td>옵션1 옵션 2</td>
				</tr>
				<tr height="30px">
					<td class="boardone" rowspan="2"><img alt="not found"
						src="../images/LOVE.jpg" style="width: 100px; height: 100px"></td>
					<td class="boardone" rowspan="2">분류</td>
					<td>상품이름</td>
					<td class="boardone" rowspan="2">수량</td>
					<td rowspan="2">재고</td>
					<th class="boardtwo" rowspan="2">판매가</th>
					<th class="boardtwo" rowspan="2">쿠폰</th>
					<th class="boardtwo" rowspan="2">적립금</th>
					<td rowspan="2">결제금액</td>
					<th class="#boardthree" rowspan="2">판매일</th>
					<td rowspan="2">상태</td>
				</tr>
				<tr>
					<td>옵션1 옵션 2</td>
				</tr>
				<tr height="30px">
					<td class="boardone" rowspan="2"><img alt="not found"
						src="../images/LOVE.jpg" style="width: 100px; height: 100px"></td>
					<td class="boardone" rowspan="2">분류</td>
					<td>상품이름</td>
					<td class="boardone" rowspan="2">수량</td>
					<td rowspan="2">재고</td>
					<th class="boardtwo" rowspan="2">판매가</th>
					<th class="boardtwo" rowspan="2">쿠폰</th>
					<th class="boardtwo" rowspan="2">적립금</th>
					<td rowspan="2">결제금액</td>
					<th class="#boardthree" rowspan="2">판매일</th>
					<td rowspan="2">상태</td>
				</tr>
				<tr>
					<td>옵션1 옵션 2</td>
				</tr>
				<tr height="30px">
					<td class="boardone" rowspan="2"><img alt="not found"
						src="../images/LOVE.jpg" style="width: 100px; height: 100px"></td>
					<td class="boardone" rowspan="2">분류</td>
					<td>상품이름</td>
					<td class="boardone" rowspan="2">수량</td>
					<td rowspan="2">재고</td>
					<th class="boardtwo" rowspan="2">판매가</th>
					<th class="boardtwo" rowspan="2">쿠폰</th>
					<th class="boardtwo" rowspan="2">적립금</th>
					<td rowspan="2">결제금액</td>
					<th class="#boardthree" rowspan="2">판매일</th>
					<td rowspan="2">상태</td>
				</tr>
				<tr>
					<td>옵션1 옵션 2</td>
				</tr>
			</table>
			<button type="button" onclick="location.href='buylist.mib'" style="margin-left: 94%" class="btn btn-default"> 더보기</button>
		</div>
		<br> <br> <br> <br> <br> <br>


		<div id="boarddiv" onclick="location.href='basketlist.mib'">
			<p style="background-color: #696969">장바구니</p>
			<table class="table">
				<col width="5%">
				<col width="5%">
				<col width="50%">
				<col width="10%">
				<col width="10%">
				<col width="10%">
				<tr>
					<th class="boardone" >이미지</th>
					<th class="boardone" >분류</th>
					<th>상품이름1234512</th>
					<th class="boardone" >수량</th>
					<th >재고</th>
					<th class="boardtwo" >금액</th>
				</tr>
				<tr>
					<td class="boardone" rowspan="2" rowspan="2"><img alt="not found"
						src="../images/LOVE.jpg" style="width: 100px; height: 100px"></td>
					<td class="boardone" rowspan="2" rowspan="2">분류</td>
					<td>상품이름</td>
					<td class="boardone" rowspan="2" rowspan="2">수량</td>
					<td rowspan="2">재고</td>
					<th class="boardtwo" rowspan="2" rowspan="2">판매가</th>
				</tr>
				<tr>
					<td>옵션 1 옵션 2</td>
				</tr>

				<tr>
					<td class="boardone" rowspan="2"><img alt="not found"
						src="../images/LOVE.jpg" style="width: 100px; height: 100px"></td>
					<td class="boardone" rowspan="2">분류</td>
					<td>상품이름</td>
					<td class="boardone" rowspan="2">수량</td>
					<td rowspan="2">재고</td>
					<th class="boardtwo" rowspan="2">판매가</th>
				</tr>
				<tr>
					<td>옵션 1 옵션 2</td>
				</tr>
				<tr>
					<td class="boardone" rowspan="2"><img alt="not found"
						src="../images/LOVE.jpg" style="width: 100px; height: 100px"></td>
					<td class="boardone" rowspan="2">분류</td>
					<td>상품이름</td>
					<td class="boardone" rowspan="2">수량</td>
					<td rowspan="2">재고</td>
					<th class="boardtwo" rowspan="2">판매가</th>
				</tr>
				<tr>
					<td>옵션 1 옵션 2</td>
				</tr>
				<tr>
					<td class="boardone" rowspan="2"><img alt="not found"
						src="../images/LOVE.jpg" style="width: 100px; height: 100px"></td>
					<td class="boardone" rowspan="2">분류</td>
					<td>상품이름</td>
					<td class="boardone" rowspan="2">수량</td>
					<td rowspan="2">재고</td>
					<th class="boardtwo" rowspan="2">판매가</th>
				</tr>
				<tr>
					<td>옵션 1 옵션 2</td>
				</tr>
			</table>
			<button type="button" onclick="location.href='basketlist.mib'" style="margin-left: 94%" class="btn btn-default"> 더보기</button>
		</div>



		<div id="boarddiv" onclick="location.href='myboard.mib'">
			<p style="background-color: #696969">Q&A</p>
			<table class="table">

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
			<button type="button" onclick="location.href='myboard.mib'" style="margin-left: 94%" class="btn btn-default"> 더보기</button>
		</div>

	</div>
</body>
</html>