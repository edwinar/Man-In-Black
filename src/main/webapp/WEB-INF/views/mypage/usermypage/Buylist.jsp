<%@page import="java.util.Calendar"%>
<%@page import="com.eagle.men_in_black.model.UserMypageDto"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%
	List<UserMypageDto> buyList = (List<UserMypageDto>) request.getAttribute("buyList");
	String START_DATE = (request.getParameter("START_DATE") == null || request.getParameter("START_DATE") == "")
			? ""
			: request.getParameter("START_DATE");
	String END_DATE = (request.getParameter("END_DATE") == null || request.getParameter("END_DATE") == "")
			? ""
			: request.getParameter("END_DATE");

	Calendar cal = Calendar.getInstance();
	int tyear = cal.get(Calendar.YEAR);
	int tmonth = cal.get(Calendar.MONTH) + 1;
	int tday = cal.get(Calendar.DATE);

	if (START_DATE.equals("")) {

		if (tmonth < 10) {
			if (tday < 10) {
				START_DATE = tyear + "-0" + tmonth + "-0" + tday;
				END_DATE = tyear + "-0" + tmonth + "-0" + tday;
			} else {
				START_DATE = tyear + "-0" + tmonth + "-" + tday;
				END_DATE = tyear + "-0" + tmonth + "-" + tday;
			}
		} else {
			if (tday < 10) {
				START_DATE = tyear + "-" + tmonth + "-0" + tday;
				END_DATE = tyear + "-" + tmonth + "-0" + tday;
			} else {
				START_DATE = tyear + "-" + tmonth + "-" + tday;
				END_DATE = tyear + "-" + tmonth + "-" + tday;
			}
		}
	} else {
		END_DATE = tyear + "-" + END_DATE.substring(2, 4) + "-" + END_DATE.substring(4, 6);

		String yyear = tyear + "";
		String endyear = START_DATE.substring(0, 2);

		if (!yyear.substring(2, 4).equals(endyear)) {
			START_DATE = (tyear - 1) + "-" + START_DATE.substring(2, 4) + "-" + START_DATE.substring(4, 6);

		} else {
			START_DATE = tyear + "-" + START_DATE.substring(2, 4) + "-" + START_DATE.substring(4, 6);
		}

	}
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
<script type="text/javascript">
	$(document)
			.ready(
					function() {
						$('#start_date').change(function() {
							var date1 = $('#start_date').val();
							var date2 = $('#end_date').val();

							$("#end_date").attr( 'min', date1 );
					    	//$("#start_date").attr( 'max', date2 );
					    	$("#end_date").val(date1);

						});

						$('#dateBtn').click(
								function() {
									var date1 = $('#start_date').val();
									var date2 = $('#end_date').val();

									strat_date = date1.split('-').join('')
											.substring(2, 8);
									end_date = date2.split('-').join('')
											.substring(2, 8);

									location.href = 'buylist.mib?START_DATE='
											+ strat_date + "&END_DATE="
											+ end_date;
								});

						$('#week').click(
								function() {
									var now = new Date();
									var year = now.getFullYear();
									var mon = (now.getMonth() + 1) > 9 ? ''
											+ (now.getMonth() + 1) : '0'
											+ (now.getMonth() + 1);
									var day = now.getDate() > 9 ? ''
											+ now.getDate() : '0'
											+ now.getDate();

									var fullDate = year + mon + day;

									var weekDate = year + '' + mon + ''
											+ (day - 7);

									// 오늘날짜가 7일보다 작을때 
									for (i = 1; i <= 7; i++) {
										if (day == i) {
											var lastDay = (new Date(year,
													(mon - 1), 0)).getDate();
											lastDay = (lastDay+i)-7;
											weekDate = year + '' + (mon - 1)
													+ '' + lastDay;
											if (mon < 10) {
												weekDate = year + '0'
														+ (mon - 1) + ''
														+ lastDay;
											}

										}
									}

									fullDate = fullDate.substring(2, 8);
									weekDate = weekDate.substring(2, 8);

									//alert(fullDate);
									//alert(weekDate);

									location.href = 'buylist.mib?START_DATE='
											+ weekDate + "&END_DATE="
											+ fullDate;

								});

						$('#month')
								.click(
										function() {
											var now = new Date();
											var year = now.getFullYear();
											var mon = (now.getMonth() + 1) > 9 ? ''
													+ (now.getMonth() + 1)
													: '0'
															+ (now.getMonth() + 1);
											var monthdate_mon = (now.getMonth()) > 9 ? ''
													+ (now.getMonth())
													: '0'
															+ (now.getMonth());
											var day = now.getDate() > 9 ? ''
													+ now.getDate() : '0'
													+ now.getDate();

											var fullDate = year + mon + day;
											var monthDate = year
													+ monthdate_mon + day;

											var monthdate_lastDay = (new Date(
													year, (monthdate_mon - 1),
													0)).getDate();

											// 전에 한달의 마지막 날보다 지금 날이 클경우 
											// 연도 도 고려 
											if (mon == 0) { //1월일때 
												year = year - 1;
												monthdate_mon = 12;
												monthDate = year + ''
														+ monthdate_mon + day;
											}

											if (monthdate_lastDay < day
													&& mon != 0) { // 1월이아니고 전달보다 지금이 클때 
												
												if (monthdate_mon > 9) {
													monthDate = year + ''
															+ (monthdate_mon)
															+ monthdate_lastDay;
												} else {
													monthDate = year + '0'
															+ (monthdate_mon)
															+ monthdate_lastDay;
												}
											}

											fullDate = fullDate.substring(2, 8);
											monthDate = monthDate.substring(2,
													8);
											//alert(fullDate);
											//alert(monthDate);	
											location.href = 'buylist.mib?START_DATE='
													+ monthDate
													+ "&END_DATE="
													+ fullDate;

										});
						$('#threeMonth')
								.click(
										function() {
											var now = new Date();
											var year = now.getFullYear();
											var mon = (now.getMonth() + 1) > 9 ? ''
													+ (now.getMonth() + 1)
													: '0'
															+ (now.getMonth() + 1);
											var monthdate_mon = (now.getMonth() + 1) > 9 ? ''
													+ (now.getMonth() + 1)
													: '0'
															+ (now.getMonth() + 1);
											var day = now.getDate() > 9 ? ''
													+ now.getDate() : '0'
													+ now.getDate();

											var fullDate = year + mon + day;
											var monthDate = year
													+ monthdate_mon + day;

											if (monthdate_mon > 2) {
												var monthdate_lastDay = (new Date(
														year,
														(monthdate_mon - 3), 0))
														.getDate();
											}

											if (mon > 2
													&& monthdate_lastDay < day) {
												monthdate_mon = monthdate_mon - 3;
												if (monthdate_mon == 0) {
													monthdate_mon = 1;
													monthDate = year + '0'
															+ monthdate_mon
															+ monthdate_lastDay;
												} else {
													monthDate = year + '0'
															+ monthdate_mon
															+ monthdate_lastDay;
												}

											} else {
												monthdate_mon = monthdate_mon - 3;
												if (monthdate_mon == 0) {
													monthdate_mon = 1;
													monthDate = year + '0'
															+ monthdate_mon
															+ day;
												} else {
													monthDate = year + '0'
															+ monthdate_mon
															+ day;
												}

											}

											for (i = 1; i <= 2; i++) { // 1,2,월일때 연도,월 바꿔줌 
												if (mon == i) {
													year = year - 1;
													//alert(year);
													monthdate_mon = 10 + i;
													monthDate = year + ''
															+ monthdate_mon
															+ day;
													//alert(monthDate);
												}
											}

											fullDate = fullDate.substring(2, 8);
											monthDate = monthDate.substring(2,
													8);
											//alert(fullDate);
											//alert(monthDate);	
											location.href = 'buylist.mib?START_DATE='
													+ monthDate
													+ "&END_DATE="
													+ fullDate;
										});
					});
	

	
	
	function change(SEQ) {
		
		
		$.ajax({
 			type : "POST",
 			url : "delstep.mib",
 			dataType : "html",
 			data : {
 				"DEL_SEQ" : SEQ
 			},
 			success : function(data) {
 				
 				var flag = $.parseJSON(data);
 				
 				if(flag.success=='success'){
 					$("#btn"+SEQ).attr("value","리뷰쓰기");
 					$("#btn"+SEQ).attr("onclick","go("+$('#proseqg').val()+","+$('#delseqg').val()+ ")");
 					$("#cancle"+SEQ).remove();
 					
 				}else{
 					alert("실패");
 				}
 			},
 			complete : function(data) {
 			},
 			error : function(xhr, status, error) {
 				alert("에러발생");
 			}
 		});
		
	}
	
	
	
	

	function go(seq, DEL_SEQ) {
		var PRO_SEQ = seq;
		
		window.open(
						"reveiwwrite.mib?PRO_SEQ=" + PRO_SEQ +"&DEL_SEQ=" + DEL_SEQ, +
						"pop",
						"width=800 height=520 resizable=no location=no screenX=400 screenY=300 scrollbars=no");
	}


        function open_win(SEQ)
        {
            var DEL_SEQ = SEQ;
            alert(DEL_SEQ);

            cw=screen.availWidth;     //화면 넓이
            ch=screen.availHeight;    //화면 높이

            sw=1080;    //띄울 창의 넓이
            sh=700;    //띄울 창의 높이

            ml=(cw-sw)/2;        
            mt=(ch-sh)/2;         


            window.open("buyCancel.mib?DEL_SEQ="+DEL_SEQ,"pop", 'width='+sw+',height='+sh+',top='+mt+',left='+ml+', toolbar=no, location=no, directories=no, status=no, menubar=no, resizable=no, scrollbars=no, copyhistory=no');
        }



</script>
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

	<div align="right">
		<p>
			<input type="date" height="50px" name="start_date" id="start_date"
				value="<%=START_DATE%>">~<input type="date" name="end_date"
				id="end_date" value="<%=END_DATE%>" min="<%=END_DATE%>">
			<button type="button" id="dateBtn">검색</button>
			<button class="btn btn-success" id="week">1주</button>
			<button class="btn btn-success" id="month">1개월</button>
			<button class="btn btn-success" id="threeMonth">3개월</button>
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
						<%
							if (buyList == null || buyList.size() == 0) {
						%>
						<tr>
							<td colspan="9999">내역이 없습니다.</td>
						</tr>
					</table>

				</form>

			</div>

		</div>

		<div>
			<table>

				<%
					} else {

						for (int i = 0; i < buyList.size(); i++) {
				%>

				<tr height="30px">
					<td class="boardone" rowspan="2"><a href="detail.mib?PRO_SEQ=<%=buyList.get(i).getPRO_SEQ()%>"><img alt="not found"
						<%=buyList.get(i).getSTORED_NAME()%> style="width: 100px; height: 100px"></a></td>
					<td class="boardone" rowspan="2" valign="middle"><%=buyList.get(i).getSUB_ITEM()%></td>
					<td><a href="detail.mib?PRO_SEQ=<%=buyList.get(i).getPRO_SEQ()%>"><%=buyList.get(i).getPRO_NAME()%></a></td>
					<td class="boardone" rowspan="2" valign="middle"><%=buyList.get(i).getSEL_NUM()%></td>
					<th class="boardtwo" rowspan="2" valign="middle"><%=buyList.get(i).getPRO_PRICE()%></th>
					<th class="boardtwo" rowspan="2" valign="middle"><%=buyList.get(i).getCOUPON()%></th>
					<th class="boardtwo" rowspan="2" valign="middle"><%=buyList.get(i).getPOINT()%></th>
					<td rowspan="2" valign="middle"><%=buyList.get(i).getFINAL_PRICE()%></td>
					<th class="#boardthree" rowspan="2" valign="middle"><%=buyList.get(i).getSEL_TIME()%></th>
					<%
						if (buyList.get(i).getDEL_STEP().equals("배송완료")) {
					%>
					<td rowspan="1" valign="middle"><%=buyList.get(i).getDEL_STEP()%>

						<input type="button" value=" 반품 & 교환 " id="cancle<%=buyList.get(i).getDEL_SEQ()%>" onclick="open_win(<%=buyList.get(i).getDEL_SEQ()%>)">
					</td>
				</tr>
				<tr>
					<td><%=buyList.get(i).getSEL_SIZE()%> : <%=buyList.get(i).getSEL_COLOR()%></td>
					<td><input type="hidden" value="<%=buyList.get(i).getPRO_SEQ()%>" id="proseqg">
					<input type="hidden" value="<%=buyList.get(i).getDEL_SEQ()%>" id="delseqg"> 
					<input type="button" value="구매확정" id="btn<%=buyList.get(i).getDEL_SEQ()%>" onclick="change(<%=buyList.get(i).getDEL_SEQ()%>)"></td>
				</tr>

				<%
					} else if (buyList.get(i).getDEL_STEP().equals("구매확정")) {
				%>
				
				
				<td rowspan="1" valign="middle"><%=buyList.get(i).getDEL_STEP()%></td>
				</tr>
				<tr>
					<td><%=buyList.get(i).getSEL_SIZE()%> : <%=buyList.get(i).getSEL_COLOR()%></td>
					<td><input type="hidden"
						value="<%=buyList.get(i).getPRO_SEQ()%>" id="proseqg"> <input
						type="button" value="리뷰쓰기" id="btn"
						onclick="go(<%=buyList.get(i).getPRO_SEQ()%>,<%=buyList.get(i).getDEL_SEQ()%> )"></td>
				</tr>


				<%
				} else if (buyList.get(i).getDEL_STEP().equals("배송준비중")) {
				%>
				<td rowspan="1" valign="middle"><%=buyList.get(i).getDEL_STEP()%>


				</tr>
				<tr>
					<td><%=buyList.get(i).getSEL_SIZE()%> : <%=buyList.get(i).getSEL_COLOR()%></td>
					<td><input type="button" value="취소" id="cancle"
							   onclick="open_win(<%=buyList.get(i).getDEL_SEQ()%>)"></td>
				</tr>
						<%
				} else if (buyList.get(i).getDEL_STEP().equals("변경사항 처리중")) {
				%>
				<td rowspan="1" valign="middle"><%=buyList.get(i).getDEL_STEP()%>


					</tr>
				<tr>
					<td><%=buyList.get(i).getSEL_SIZE()%> : <%=buyList.get(i).getSEL_COLOR()%></td>
				</tr>
				<%
					} else {
				%>



				<td rowspan="2" valign="middle">구매확정</td>
				</tr>
				<tr>
					<td><%=buyList.get(i).getSEL_SIZE()%> : <%=buyList.get(i).getSEL_COLOR()%></td>

				</tr>

				<%
					}
						}
				%>

			</table>



		</div>

	</div>

	<%
		// 페이징 및 날짜 선택 
			String PAGE_NUM = (request.getParameter("PAGE_NUM") == null || request.getParameter("PAGE_NUM") == "")
					? "1" : request.getParameter("PAGE_NUM");
			String PAGE_SIZE = (request.getParameter("PAGE_SIZE") == null
					|| request.getParameter("PAGE_SIZE") == "") ? "10" : request.getParameter("PAGE_SIZE");

			int page_num = Integer.parseInt(PAGE_NUM);
			int page_size = Integer.parseInt(PAGE_SIZE);

			int pageCount = buyList.get(0).getTOT_CNT() % page_size == 0 ? buyList.get(0).getTOT_CNT() / page_size
					: (buyList.get(0).getTOT_CNT() / page_size) + 1;
	%>
	<div class="row" align="center">
		<p>
			<%
				START_DATE = START_DATE.substring(2, 4) + START_DATE.substring(5, 7) + START_DATE.substring(8, 10);

					END_DATE = END_DATE.substring(2, 4) + END_DATE.substring(5, 7) + END_DATE.substring(8, 10);

					for (int i = 1; i <= pageCount; i++) {
			%>
			<a
				href="buylist.mib?PAGE_NUM=<%=i%>&START_DATE=<%=START_DATE%>&END_DATE=<%=END_DATE%>"
				class="btn btn-default" role="button"><%=i%></a>
			<%
				}
			%>
		</p>
	</div>

	<%
		}
	%>
</body>
</html>