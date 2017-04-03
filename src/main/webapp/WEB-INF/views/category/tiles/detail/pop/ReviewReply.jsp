<%@page import="java.util.Calendar"%>
<%@page import="com.eagle.men_in_black.model.MainDto"%>
<%@page import="com.eagle.men_in_black.model.DetailDto"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%
	MainDto dto = (MainDto)request.getSession().getAttribute("LoginInfo");
	DetailDto detailDto = (DetailDto)request.getAttribute("detailDto");
	
	Calendar cal = Calendar.getInstance();
	int tyear = cal.get(Calendar.YEAR);
	int tmonth = cal.get(Calendar.MONTH)+1;
	int tday = cal.get(Calendar.DATE);
	String today = "";

	if(tmonth<10){
		if(tday<10){
			today = tyear+"-0"+tmonth+"-0"+tday;
		}else{
			today = tyear+"-0"+tmonth+"-"+tday;
		}
	}else{
		if(tday<10){
			today = tyear+"-"+tmonth+"-0"+tday;
		}else{
			today = tyear+"-"+tmonth+"-"+tday;
		}
	}
%>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.2.0/css/bootstrap.min.css">
<title>:::ReviewReply:::</title>
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
<script type="text/javascript">
function closePop(){
	var title = document.getElementById("review_title").value;
	var content = document.getElementById("review_content").value;
	
	location.href("reviewReply.mib?REV_TITLE="+title+"&REV_CONTENT="+content+
			"&REV_REF=<%=detailDto.getREV_REF()%>
			&USER_ID=<%=detailDto.getUSER_ID()%>
			&PRO_SEQ=<%=detailDto.getPRO_SEQ()%>");
	
	window.close();
}
</script>
<div class="layout">
	<div class="leftLayout">
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
			</div>
		</div>
	</div>
	<div class="rightLayout">
		<div class="thumbnail">
			<div class="score" align="center" style="height: 20%"> 
			<h4>< 답글 ></h4>
				<hr style="border: solid black 1px; width: 70%;">
			</div>
			<div class="title" align="center" style="height: 20%; width: 100%;">
				제목 : <input type="text" id="review_title" size="30px"/>
			</div>
			<div class="info" style="height: 15%; width: 100%; text-align: right;">
				<h5>작성자:<%=dto.getUSER_ID() %><br/>작성날짜:<%=today %></h5>
			</div>
			<div class="content" align="center" style="height: 28%; width: 100%; text-align: left;">
				<textarea id="review_content" rows="5px" cols="50px"></textarea>
			</div>
			<div class="btn" align="center" style="height: 10%; width:100%;">
				<button style="width: 50%; height: 100%;" onclick="closePop()">답글달기</button>
			</div>
		</div>
	</div>
</div>

</body>
</html>