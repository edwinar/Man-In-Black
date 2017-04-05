<%@page import="com.eagle.men_in_black.model.MainDto"%>
<%@page import="com.eagle.men_in_black.model.ServiceDto"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%
	MainDto dto = (MainDto) request.getSession().getAttribute("LoginInfo");
	List<ServiceDto> eventlist = (List<ServiceDto>) request.getAttribute("eventlist");
%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>:::EVENT:::</title>
<style type="text/css">
.preview {
	position: relative;
	width: 250px;
	height: 250px;
	background: #f2f2f2;
	border-radius: 100%;
	margin: 0 auto 25px auto;
	overflow: hidden;
	border: 8px solid #E0E0E0;
}

</style>
</head>
<body>

<!-- detail로 seq 보내기 -->
<script type="text/javascript">
function eventdetail(seq) {
    location.href='eventdetail.mib?SEQ='+seq;
}

</script>
	<center>
		<div id="noticehead">
			<h4 align="right" style="margin-right: 100px">
				<a href="meninblack.mib">홈</a> > <a href="event.mib">이벤트</a>
			</h4>
			<h3>고객센터</h3>
			<h4>MIB 이벤트입니다</h4>
		</div>
	</center>
	<h3>EVENT</h3>

	<!-- CEO 글쓰기 버튼  -->
	<%
		if (dto != null) {
			if (dto.getUSER_ID().equals("adm")) {
	%>
	<p align="right">
		<a class="btn btn-primary" href="eventwrite.mib"
			role="button">이벤트등록</a>
	</p>
	<%
		}
		}
	%>
	<!-- list 뿌리기 -->
<div>
	<%
		for(int i=0; i<eventlist.size();i++){
	%>
	<div class="preview" style="margin-left: 20px; float: left"  
	onclick="eventdetail(<%=eventlist.get(i).getEVENT_SEQ() %>)" >
		
	</div>
	<%
		}
	%>
</div>
	

	<br>
	<br>
 	
 	
 	<%
		// 페이징 및 날짜 선택 
		String PAGE_NUM = (request.getParameter("PAGE_NUM") == null || request.getParameter("PAGE_NUM") == "") ? "1"
				: request.getParameter("PAGE_NUM");
		String PAGE_SIZE = (request.getParameter("PAGE_SIZE") == null || request.getParameter("PAGE_SIZE") == "")
				? "10" : request.getParameter("PAGE_SIZE");

		int page_num = Integer.parseInt(PAGE_NUM);
		int page_size = Integer.parseInt(PAGE_SIZE);

		int pageCount = (eventlist.get(0).getTOT_CNT() % page_size) == 0
				? eventlist.get(0).getTOT_CNT() / page_size : (eventlist.get(0).getTOT_CNT() / page_size) + 1;
	%>

		<div class="row" style="margin-top: 300px" align="center">
		<p>
			<%
				for (int i = 1; i <= pageCount; i++) {
			%>
			<a href="event.mib?PAGE_NUM=<%=i%>" class="btn btn-default"
				role="button"><%=i%></a>
			<%
				}
			%>
		</p>
	</div>  
	

</body>
</html>