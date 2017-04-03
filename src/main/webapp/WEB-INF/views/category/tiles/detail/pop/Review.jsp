<%@page import="com.eagle.men_in_black.model.MainDto"%>
<%@page import="com.eagle.men_in_black.model.DetailDto"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%
	MainDto dto = (MainDto)request.getSession().getAttribute("LoginInfo");
	int REV_SEQ = Integer.parseInt(request.getParameter("REV_SEQ"));
	DetailDto detailDto = (DetailDto)request.getAttribute("detaildto");
%>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.2.0/css/bootstrap.min.css">
<title>:::Review:::</title>

<style type="text/css">
.layout{
	width: 790px;
	height: 390px;
	position: relative;
	margin-top: 10px;
}
.leftLayout{
	float: left;
	width: 49.5%;
	height: 100%;
	position: relative;
	margin-left: 5px;
}
.rightLayout{
	float: right;
	width: 49.5%;
	height: 100%;
	position: relative;
}
.thumbnail{
 width: 100%;
 height: 100%;
 text-align: center;
}
</style>
</head>
<body>

<div class="layout">
	<div class="leftLayout">
		<img alt="..." src="../images/LOVE.jpg" width="100%">
	</div>
	<div class="rightLayout">
		<div class="thumbnail">
			<div class="score" align="center" style="height: 20%"> 평점 
				<%
	        		if(detailDto.getSCORE()==1){
	        	%>
	        		<img alt="..." src="../images/scoreFull.png">
	        		<img alt="..." src="../images/scoreEmpty.png">
	        		<img alt="..." src="../images/scoreEmpty.png">
	        		<img alt="..." src="../images/scoreEmpty.png">
	        		<img alt="..." src="../images/scoreEmpty.png">
        		<%
	        		}else if(detailDto.getSCORE()==2){
        		%>
        			<img alt="..." src="../images/scoreFull.png">
	        		<img alt="..." src="../images/scoreFull.png">
	        		<img alt="..." src="../images/scoreEmpty.png">
	        		<img alt="..." src="../images/scoreEmpty.png">
	        		<img alt="..." src="../images/scoreEmpty.png">
        		<%
	        		}else if(detailDto.getSCORE()==3){
        		%>
        			<img alt="..." src="../images/scoreFull.png">
	        		<img alt="..." src="../images/scoreFull.png">
	        		<img alt="..." src="../images/scoreFull.png">
	        		<img alt="..." src="../images/scoreEmpty.png">
	        		<img alt="..." src="../images/scoreEmpty.png">
        		<%
	        		}else if(detailDto.getSCORE()==4){
        		%>
        			<img alt="..." src="../images/scoreFull.png">
	        		<img alt="..." src="../images/scoreFull.png">
	        		<img alt="..." src="../images/scoreFull.png">
	        		<img alt="..." src="../images/scoreFull.png">
	        		<img alt="..." src="../images/scoreEmpty.png">
        		<%
	        		}else if(detailDto.getSCORE()==5){
        		%>
        			<img alt="..." src="../images/scoreFull.png">
	        		<img alt="..." src="../images/scoreFull.png">
	        		<img alt="..." src="../images/scoreFull.png">
	        		<img alt="..." src="../images/scoreFull.png">
	        		<img alt="..." src="../images/scoreFull.png">
	        	<%
	        		}else{
        		%>
        			<h4>평점 데이터가 없습니다.</h4>
        		<%
	        		}
        		%>
				<hr style="border: solid black 1px; width: 70%;">
			</div>
			<div class="title" align="center" style="height: 20%; width: 100%;">
				<h3><%=detailDto.getREV_TITLE() %></h3>
			</div>
			<div class="info" style="height: 15%; width: 100%; text-align: right;">
				<h5>작성자:<%=detailDto.getUSER_ID() %><br/>작성날짜:<%=detailDto.getREV_TIME() %></h5>
			</div>
			<div class="content" align="center" style="height: 28%; width: 100%; text-align: left;">
				<textarea rows="5px" cols="50px" readonly="readonly"><%=detailDto.getREV_CONTENT() %></textarea>
			</div>
			<div class="btn" align="center" style="height: 10%; width:100%;">
				<%
					if(dto!=null&&dto.getUSER_ID().equalsIgnoreCase("adm")){
				%>
				<button style="width: 50%; height: 100%;" onclick="reviewReplyPop(<%=detailDto.getREV_SEQ() %>)">답글달기</button>
				<%
					}
				%>
			</div>
		</div>
	</div>
</div>
<script type="text/javascript">
function reviewReplyPop(REV_SEQ){
	window.open("reviewReply.mib?REV_SEQ="+REV_SEQ,"pop","width=810 height=420 resizable=no location=no screenX=400 screenY=300 scrollbars=no");
}
</script>
</body>
</html>