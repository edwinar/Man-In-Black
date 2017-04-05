<%@page import="java.util.List"%>
<%@page import="com.eagle.men_in_black.model.UserMypageDto"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%
	UserMypageDto mypageDto = (UserMypageDto) request.getAttribute("point");
	List<UserMypageDto> coupon = (List<UserMypageDto>) request.getAttribute("coupon");
	List<UserMypageDto> buy = (List<UserMypageDto>) request.getAttribute("buy");
	List<UserMypageDto> qna = (List<UserMypageDto>) request.getAttribute("qna");
	List<UserMypageDto> basket = (List<UserMypageDto>) request.getAttribute("basket");
	List<UserMypageDto> point5 = (List<UserMypageDto>) request.getAttribute("point5");
%>

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
				<a href="meninblack.mib">홈</a> > <a href="mymain.mib">MY PAGE</a>
			</h4>
			<h3>MY Order</h3>
			<h4>회원님의 마이페이지입니다.</h4>
		</div>
	</center>

	<div>
		<div id="contain">
			<!--onclick="location.href='coupon_Mileage.mib'"-->
			<div id="divl">
				<div class="head parea">사용가능한 쿠폰</div>

				<div align="center">
					<table style="text-align: center;">
						<col width="200px">
						<col width="200px">
						<%
							if (coupon == null || coupon.size() == 0) {
						%>
						<tr>
							<td colspan="2" style="text-align: center;">내역이 없습니다.</td>
						</tr>
						<%
							} else {
						%>
						<%
							for (int i = 0; i < coupon.size(); i++) {
						%>
						<tr>
							<th style="text-align: center;"><%=coupon.get(i).getCOUP_NAME()%></th>
							<th style="text-align: center;"><%=coupon.get(i).getCOUP_PRICE()%></th>
						</tr>
						<%
							}
							}
						%>


					</table>
				</div>

			</div>
			<div id="divr" align="center" style="position: relative;">
				<div class="head parea">적립금</div>
				<p align="center">
					<%
						if (mypageDto == null) {
					%>
					적립금이 없습니다.
					<%
						} else {
					%>
					현재<%=mypageDto.getPOINT_FINAL()%>
					<%} %>
					</p>
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
					<col width="200px">
					<%
						if (point5 == null || point5.size() == 0) {
					%>
					<tr>
						<td colspan="4" style="text-align: center;">내역이 없습니다.</td>
					</tr>
					<%
						} else {
					%>

					<%
						for (int i = 0; i < point5.size(); i++) {
					%>
					<tr>
						<td><%=point5.get(i).getPOINT_TIME()%></td>
						<td><%=point5.get(i).getPRO_NAME()%></td>
						<td><%=point5.get(i).getPOINT_PRICE()%></td>
						<td><%=point5.get(i).getPOINT_FINAL()%></td>
					</tr>
					<%
						}
						}
					%>


				</table>
			</div>
			<button type="button" onclick="location.href='coupon_Mileage.mib'"
				style="margin-left: 94%" class="btn btn-default">더보기</button>
		</div>



		<div id="boarddiv">
			<!--onclick="location.href='buyList.mib'"-->
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
					<th class="boardtwo">판매가</th>
					<th class="boardtwo">쿠폰</th>
					<th class="boardtwo">적립금</th>
					<th>결제금액</th>
					<th class="#boardthree">판매일</th>
					<th>상태</th>
				</tr>
				<%
					if (buy == null || buy.size() == 0) {
				%>
				<tr>
					<td colspan="11" style="text-align: center;">내역이 없습니다.</td>
				</tr>
				<%
					} else {
				%>
				<%
					for (int i = 0; i < buy.size(); i++) {
				%>
				<tr height="30px">
					<td class="boardone" rowspan="2"><a href="detail.mib?PRO_SEQ=<%=buy.get(i).getPRO_SEQ()%>"><img alt="not found"
						<%=buy.get(i).getSTORED_NAME()%> style="width: 100px; height: 100px"></a></td>
					<td class="boardone" rowspan="2" valign="middle"><%=buy.get(i).getSUB_ITEM()%></td>
					<td><a href="detail.mib?PRO_SEQ=<%=buy.get(i).getPRO_SEQ()%>"><%=buy.get(i).getPRO_NAME()%></a></td>
					<td class="boardone" rowspan="2" valign="middle"><%=buy.get(i).getSEL_NUM()%></td>
					<th class="boardtwo" rowspan="2" valign="middle"><%=buy.get(i).getSEL_NUM()%></th>
					<th class="boardtwo" rowspan="2" valign="middle"><%=buy.get(i).getCOUPON()%></th>
					<th class="boardtwo" rowspan="2" valign="middle"><%=buy.get(i).getPOINT()%></th>
					<td rowspan="2" valign="middle"><%=buy.get(i).getFINAL_PRICE()%></td>
					<th class="#boardthree" rowspan="2" valign="middle"><%=buy.get(i).getSEL_TIME()%></th>
					<td rowspan="2" valign="middle"><%=buy.get(i).getSEL_TIME()%></td>
				</tr>
				<tr>
					<td><%=buy.get(i).getSEL_SIZE()%> : <%=buy.get(i).getSEL_COLOR()%></td>
				</tr>
				<%
					}
					}
				%>
			</table>


			<button type="button" onclick="location.href='buylist.mib'"
				style="margin-left: 94%" class="btn btn-default">더보기</button>
		</div>
		<br> <br> <br> <br> <br> <br>


		<div id="boarddiv">
			<!--onclick="location.href='basketlist.mib'"-->
			<p style="background-color: #696969">장바구니</p>
			<table class="table">
				<col width="5%">
				<col width="5%">
				<col width="50%">
				<col width="10%">
				<col width="10%">
				<col width="10%">
				<tr>
					<th class="boardone">이미지</th>
					<th class="boardone">분류</th>
					<th>상품이름</th>
					<th class="boardone">수량</th>
					<th class="boardtwo">금액</th>
				</tr>
				<%
					if (basket == null || basket.size() == 0) {
				%>
				<tr>
					<td colspan="6" style="text-align: center;">내역이 없습니다.</td>
				</tr>
				<%
					} else {
				%>
				<%
					for (int i = 0; i < basket.size(); i++) {
				%>

				<tr>

					<td class="boardone" rowspan="2" rowspan="2"><img
						alt="not found" <%=basket.get(i).getSTORED_NAME()%>
						style="width: 100px; height: 100px"></td>
					<td class="boardone" rowspan="2" rowspan="2"><%=basket.get(i).getSUB_ITEM()%></td>
					<td><%=basket.get(i).getPRO_NAME()%></td>
					<td class="boardone" rowspan="2" rowspan="2"><%=basket.get(i).getBAS_PRO_NUM()%></td>
					<td class="boardtwo" rowspan="2" rowspan="2"><%=basket.get(i).getPRO_PRICE()%></td>
				</tr>
				<tr>
					<td><%=basket.get(i).getPRO_SIZE()%> : <%=basket.get(i).getCOLOR()%></td>
				</tr>
				<%
					}
					}
				%>
			</table>
			<button type="button" onclick="location.href='basketlist.mib'"
				style="margin-left: 94%" class="btn btn-default">더보기</button>
		</div>



		<div id="boarddiv">
			<!--onclick="location.href='myboard.mib'"-->
			<p style="background-color: #696969">Q&A</p>
			<table class="table">

				<tr>
					<th>번호</th>
					<th>상품명</th>
					<th>제목</th>
					<th>날짜</th>
					<th>답변여부</th>
				</tr>
				<%
					if (qna == null || qna.size() == 0) {
				%>
				<tr>
					<td colspan="5" style="text-align: center;">내역이 없습니다.</td>
				</tr>
				<%
					} else {
				%>
				<%
					for (int i = 0; i < qna.size(); i++) {
				%>
				<tr>
					<td><%=i + 1%></td>
					<td><%=qna.get(i).getPRO_NAME()%></td>
					<td><%=qna.get(i).getQNA_TITLE()%></td>
					<td><%=qna.get(i).getQNA_TIME()%></td>
					<%
						if (qna.get(i).getQNA_STEP() == "Y") {
					%>
					<td>답변완료</td>
					<%
						} else {
					%>
					<td>답변중</td>
					<%
						}
					%>
				</tr>
				<%
					}
					}
				%>
			</table>
			<button type="button" onclick="location.href='myboard.mib'"
				style="margin-left: 94%" class="btn btn-default">더보기</button>
		</div>

	</div>
</body>
</html>