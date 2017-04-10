<%@ page import="com.eagle.men_in_black.model.UserMypageDto" %>
<%@ page import="java.util.List" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
		 pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%
	List<UserMypageDto> goodslist= (List<UserMypageDto>)request.getAttribute("goodslist");
%>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>::오늘본 상품::</title>
<style>
.thumbnail {
	width: 100%;
}
.thumbnail {
	opacity: 1;
}
.thumbnail:hover {
	opacity: 0.5;
}
#mypageheada{
margin-right: 100px
}
@media ( max-width : 1200px) { 
.ty{
margin-top: 30px;
}
#mypagehead{
width: 94.5%
}
#mypageheada{
margin-right: -50px
}
}
</style>
</head>
<body>
<div style="width: 90%; margin-left: 5%" class="ty">
	<center>
		<div id="mypagehead">
			<h4 id="mypageheada" align="right">
				<a href="meninblack.mib">홈</a> > <a href="mymain.mib">MY PAGE</a> >
				<a href="todayGoods.mib">오늘본 상품</a>
			</h4>
			<h3>MY Order</h3>
			<h4>회원님이 M.I.B에서 오늘 보신 상품입니다.</h4>
		</div>
	</center>
	<div class="row" align="center" style="margin-top: 70px">

		<%
			if (goodslist == null || goodslist.size() == 0) {
		%>
		<p style="height: 300px">내역이 없습니다.</p>
		
		
		
		
		
		<%
		} else {
		%>
			<%
				for (int i = 0; i < goodslist.size(); i++) {
			%>

		<div class="col-xs-12 col-lg-4" onclick="location.href='detail.mib?PRO_SEQ=<%=goodslist.get(i).getPRO_SEQ()%>'">
			<div class="thumbnail">
				<img src="<%=goodslist.get(i).getSTORED_NAME()%>" alt="<%=goodslist.get(i).getSTORED_NAME()%>">
				<div class="caption">
					<h5><%=goodslist.get(i).getPRO_NAME()%></h5>
					<p><%=goodslist.get(i).getPRO_PRICE()%></p>
				</div>
			</div>
		</div>
			<%
						}
				}
			%>

				</div>
				</div>
				
</body>
</html>
