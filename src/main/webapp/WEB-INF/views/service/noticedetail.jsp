<%@page import="com.eagle.men_in_black.model.ServiceDto"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%
	ServiceDto serviceDto = (ServiceDto) request.getAttribute("detail");
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>::NOTICEDETAIL::</title>
</head>
<body>
	<center>
		<div id="mypagehead">
			<h4 align="right" style="margin-right: 100px">
				<a href="meninblack.mib">홈</a> > <a href="servicenotice.mib">고객센터</a>
			</h4>
			<h3>고객센터</h3>
			<h4>MIB 공지사항입니다</h4>
		</div>
	</center>
	<h3>NOTICEDETAIL</h3>


	<div class="jumbotron">
		<h3><%=serviceDto.getNOTICE_TITLE() %></h3>
		<br><br>
		<div style="width: 80%" align="center" >
		<h4><%=serviceDto.getNOTICE_CONTENT() %></h4>
		</div>
		<p align="right">
			<a  class="btn btn-primary btn-sm" href="serviceupdate.mib?seq=<%=serviceDto.getNOTICE_SEQ() %>" role="button">수정</a>
			<a  class="btn btn-primary btn-sm" href="" role="button">삭제</a>
			<a  class="btn btn-primary btn-sm" href="servicenotice.mib" role="button">목록으로</a>
			<!-- <a  class="btn btn-primary btn-sm" href="servicenotice.mib" role="button">목록으로</a> -->
		</p>
	
	</div>

</body>
</html>