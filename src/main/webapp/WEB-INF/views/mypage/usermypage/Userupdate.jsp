<%@page import="com.eagle.men_in_black.model.MainDto"%>
<%@page import="com.eagle.men_in_black.model.UserMypageDto"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
	<%
	MainDto userinfo  =(MainDto)session.getAttribute("LoginInfo");
	%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>::회원정보 수정::</title>
</head>
<body>
<center>
<div id="mypagehead">
<h4 align="right" style="margin-right: 100px"><a href="MenInBlack.jsp">홈</a> > 
<a href="mymain.mib">MY PAGE</a> > 
<a href="userup.mib">회원정보수정</a></h4>
<h3>MY Order</h3>
<h4>회원님의 정보를 수정하세요</h4>
</div>
</center>
	<div style="width: 100%; height: 700px;">
		<center>
			<form style="margin-top: 200px">
				<input type="password" size="30" style="background-color: white;" class="" name="pw"><br>
				<input type="button" value="확인" class="checkbtn" >
				
			</form>
		</center>
	</div>
	<div>
<%-- <input type="hidden" class="ppw" value="<%=userinfo.getUSER_PW()%>">
<script type="text/javascript">
	$(function() {
		$(".checkbtn").click(function() {
		if(($(".pw").val).equals($(".ppw").val)){
			location.href ="UserupdateAfter.jsp";
			}else{
				alert("ㅗㅗ");
			}
		}
		)
	})
</script> --%>
</body>
</html>