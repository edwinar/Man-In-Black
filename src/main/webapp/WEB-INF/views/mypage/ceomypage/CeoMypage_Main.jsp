<%@page import="java.util.Calendar"%>
<%@page import="com.eagle.men_in_black.model.CeoMypageDto"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
	<%
		List<CeoMypageDto> list = (List<CeoMypageDto>)request.getAttribute("list");
	
	String START_DATE = (request.getParameter("START_DATE")==null||request.getParameter("START_DATE")=="")?"":request.getParameter("START_DATE");
	String END_DATE = (request.getParameter("END_DATE")==null || request.getParameter("END_DATE")=="")?"":request.getParameter("END_DATE");
	
		Calendar cal = Calendar.getInstance();
		int tyear = cal.get(Calendar.YEAR);
		int tmonth = cal.get(Calendar.MONTH)+1;
		int tday = cal.get(Calendar.DATE);
	
	if(START_DATE.equals("")){
	
		if(tmonth<10){
			if(tday<10){
				START_DATE = tyear+"-0"+tmonth+"-0"+tday;
				END_DATE = tyear+"-0"+tmonth+"-0"+tday;
			}else{
				START_DATE = tyear+"-0"+tmonth+"-"+tday;
				END_DATE = tyear+"-0"+tmonth+"-"+tday;
			}
		}else{
			if(tday<10){
				START_DATE = tyear+"-"+tmonth+"-0"+tday;
				END_DATE = tyear+"-"+tmonth+"-0"+tday;
			}else{
				START_DATE = tyear+"-"+tmonth+"-"+tday;
				END_DATE = tyear+"-"+tmonth+"-"+tday;
			}
		}
	}else{
		START_DATE = tyear +"-"+ START_DATE.substring(2,4) +"-"+ START_DATE.substring(4, 6);

		END_DATE = tyear +"-"+ END_DATE.substring(2,4) +"-"+ END_DATE.substring(4, 6);
	}
	
	%>
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

/*작은화면*/
@media screen and (max-width: 50em) {
	.datediv input {
		height: 30px;
		width: 150px;
	}
}

.search {
	width: 500px;
	height: 40px;
	margin: 0px auto;
	background: #f3ffec;
	border-radius: 3px;
	border: 1px solid #fff;
}

.search input {
	width: 370px;
	padding: 10px 5px;
	float: left;
	color: #ccc;
	border: 0;
	background: transparent;
	border-radius: 3px 0 0 3px;
}

.search input:focus {
	outline: 0;
	background: transparent;
}

.search button {
	position: relative;
	float: right;
	border: 0;
	padding: 0;
	cursor: pointer;
	height: 40px;
	width: 120px;
	color: #fff;
	background: #6ac56d;
	border-left: 15px solid #fff;
	border-radius: 0 3px 3px 0;
}



.search button:active {
	box-shadow: 0px 0px 12px 0px rgba(225, 225, 225, 1);
}

.search button:focus {
	outline: 0;
}
</style>
<script type="text/javascript">
$(document).ready(function(){
    $('#start_date').change(function(){
    	var date1 = $('#start_date').val();
    	var date2 = $('#end_date').val();
    	
    	$("#end_date").attr( 'min', date1 );
    	$("#start_date").attr( 'max', date2 );
    	
	}); 
	
    $('#dateBtn').click(function(){
    	var date1 = $('#start_date').val();
    	var date2 = $('#end_date').val();
    	
    	strat_date = date1.split('-').join('').substring(2,8);
    	end_date = date2.split('-').join('').substring(2,8);
    	
    	location.href='ceoMypage_Main.mib?START_DATE='+strat_date+"&END_DATE="+end_date;
    });  
    
    
	$('#week').click(function(){
    	var now = new Date();
        var year= now.getFullYear();
        var mon = (now.getMonth()+1)>9 ? ''+(now.getMonth()+1) : '0'+(now.getMonth()+1);
        var day = now.getDate()>9 ? ''+now.getDate() : '0'+now.getDate();
              
        var fullDate = year + mon + day;
        
        var weekDate = year+''+mon+''+(day-7);
		
        // 오늘날짜가 7일보다 작을때 
		for(i=1;i<=7;i++){
			if(day==i){
				var lastDay = ( new Date( year, (mon-1), 0) ).getDate();
				lastDay = lastDay-i;
				weekDate = year+''+(mon-1)+''+lastDay;
				if(mon<10){
					weekDate = year+'0'+(mon-1)+''+lastDay;
				}
				
			}
		}
		
		fullDate = fullDate.substring(2,8);
		weekDate = weekDate.substring(2,8);
		
		alert(fullDate);
		alert(weekDate);
		
		location.href='ceoMypage_Main.mib?START_DATE='+weekDate+"&END_DATE="+fullDate;
		
	});
	
	$('#month').click(function(){
		var now = new Date();
		var year= now.getFullYear();
		var mon = (now.getMonth()+1)>9 ? ''+(now.getMonth()+1) : '0'+(now.getMonth()+1);
        var monthdate_mon = (now.getMonth()+1)>9 ? ''+(now.getMonth()) : '0'+(now.getMonth());
        var day = now.getDate()>9 ? ''+now.getDate() : '0'+now.getDate();
        
        var fullDate = year + mon + day;
        var monthDate = year+monthdate_mon+day;
		
		var monthdate_lastDay = ( new Date( year, (monthdate_mon), 0) ).getDate();
		
		// 전에 한달의 마지막 날보다 지금 날이 클경우 년도 도 고려 
		if(monthdate_lastDay<day){
			monthDate = year+monthdate_mon+monthdate_lastDay;
		}
		
		fullDate = fullDate.substring(2,8);
		monthDate = monthDate.substring(2,8);
				
		location.href='ceoMypage_Main.mib?START_DATE='+monthDate+"&END_DATE="+fullDate;
        
	});
	$('#threeMonth').click(function(){
		var now = new Date();
		var year= now.getFullYear();
		var mon = (now.getMonth()+1)>9 ? ''+(now.getMonth()+1) : '0'+(now.getMonth()+1);
        var monthdate_mon = (now.getMonth()+1)>9 ? ''+(now.getMonth()-2) : '0'+(now.getMonth()-2);
        var day = now.getDate()>9 ? ''+now.getDate() : '0'+now.getDate();
        
        var fullDate = year + mon + day;
        var monthDate = year+monthdate_mon+day;
		alert(fullDate);
		alert(monthDate);
		var monthdate_lastDay = ( new Date( year, (monthdate_mon), 0) ).getDate();
		
		alert(monthdate_lastDay);
		
		// 전에 한달의 마지막 날보다 지금 날이 클경우  // 년도 월 일 추가 
		if(monthdate_lastDay<day){
			monthDate = year+monthdate_mon+monthdate_lastDay;
		}
		
		fullDate = fullDate.substring(2,8);
		monthDate = monthDate.substring(2,8);
		alert(fullDate);
		alert(monthDate);	
		//location.href='ceoMypage_Main.mib?START_DATE='+monthDate+"&END_DATE="+fullDate;
	});
});
</script>
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


		<div class="datediv">
			<p>
			<br><br>
				<h5>날짜별 검색</h5>
				<button class="btn btn-success" id="week">1주</button> 
				<button class="btn btn-success" id="month">1개월</button> 
				<button class="btn btn-success" id="threeMonth">3개월</button> <br> <br> 
		<input type="date" name="start_date" id="start_date" height="50px" value="<%=START_DATE %>" max="<%=START_DATE%>"> ~ <input type="date" 		name="end_date" id="end_date" value="<%=END_DATE %>" min="<%=END_DATE%>" > <button type="button" id="dateBtn">검색</button>
				<br>
			</p>
		</div>


	</center>
	<!--엑셀로 다운받기-->
	<div align="right">
		<button type="button" class="btn btn-success">
			엑셀 다운로드 <span class="glyphicon glyphicon-download-alt"
				aria-hidden="true"></span>
		</button>
	</div>


	<!--검색(유저ID,상품이름)-->
	<form class="search" action="">
		<input type="search" placeholder="유저ID,상품이름" required>
		<button type="submit">검색</button>
	</form>

	<!--수량 총매출액 순이익 -->

	<div style="width: 100%; padding-left: 1044px">

		<table class="table table-condensed">
			<tr>
				<th>수량</th>
				<th>총매출액</th>
				<th>순이익</th>
			</tr>
			<!--데이터 받아오는부분  -->
			<tr>
				<th>5</th>
				<td>500000원</td>
				<td>200000원</td>
			</tr>
		</table>
	</div>


	<!--판매내역 테이블  -->
	<div id="total" style="margin-top: 50px">
		<div id="table" style="width: 100%">
			<form name="f1">
				<table class="table">
					<col width="5%">
					<col width="9%">
					<col width="50%">
					<col width="10%">
					<tr>
						<th>상품</th>
						<th>분류</th>
						<th>상품이름</th>
						<th>수량</th>
						<th>재고</th>
						<th>가격</th>
						<th>판매일</th>
						<th>상태</th>
					</tr>

				<%
				if(list!=null){
				for(int i=0; i<list.size(); i++){ %>
					<tr>
						<td><img alt="not found" src="../images/LOVE.jpg"
							style="width: 100px; height: 100px"></td>
						<td><%=list.get(i).getITEM() %></td>
						<td>컬러-<%=list.get(i).getSEL_COLOR() %>,사이즈-<%=list.get(i).getSEL_SIZE() %></td>
						<td><%=list.get(i).getSEL_NUM() %></td>
						<td>재고까먹음</td>
						<td><%=list.get(i).getFINAL_PRICE() %></td>
						<td><%=list.get(i).getSELTIME() %></td>
						<td>배송완료</td>
					</tr>
				<%}
				}else{
				%>	
				<tr>
					<td colspan="999999">내역이 없습니다.</td>
				</tr>
				<%} %>
				</table>

			</form>

		</div>

	</div>

<%  
				// 페이징 및 날짜 선택 
	String PAGE_NUM = (request.getParameter("PAGE_NUM")==null || request.getParameter("PAGE_NUM")=="")?"1":request.getParameter("PAGE_NUM");
	String PAGE_SIZE = (request.getParameter("PAGE_SIZE")==null || request.getParameter("PAGE_SIZE")=="")?"10":request.getParameter("PAGE_SIZE");

	
	int page_num = Integer.parseInt(PAGE_NUM);
	int page_size = Integer.parseInt(PAGE_SIZE);
	
	
	int pageCount = list.get(0).getTOT_CNT()/page_size==0?list.get(0).getTOT_CNT()/page_size:(list.get(0).getTOT_CNT()/page_size)+1; 
	
%>
	<div class="row" align="center">
		<p>
			
			
			
			<%
			if(list!=null){
			START_DATE = START_DATE.substring(2,4) + START_DATE.substring(5,7) + START_DATE.substring(8, 10);

			END_DATE = END_DATE.substring(2,4) + END_DATE.substring(5,7) + END_DATE.substring(8, 10);
			
			
			for(int i=1; i<=pageCount; i++){  %>
			<a href="ceoMypage_Main.mib?PAGE_NUM=<%=i%>&START_DATE=<%=START_DATE %>&END_DATE=<%=END_DATE %>" class="btn btn-default" role="button"><%=i %></a> 
			<%} 
			}%>
			
		</p>
	</div>
	

</body>
</html>