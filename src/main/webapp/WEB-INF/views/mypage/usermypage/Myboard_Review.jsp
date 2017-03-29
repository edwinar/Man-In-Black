<%@ page import="com.eagle.men_in_black.model.UserMypageDto" %>
<%@ page import="java.util.List" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<%
    List<UserMypageDto> reviewlist= (List<UserMypageDto>)request.getAttribute("reviewlist");
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>::리뷰::</title>
</head>

<body>
	<center>
		<div id="mypagehead">
			<h4 align="right" style="margin-right: 100px">
				<a href="meninblack.mib">홈</a> > <a href="mymain.mib">MY PAGE</a> >
				<a href="myboard.mib">내가 쓴 게시물</a>
			</h4>
			<h3>My Post</h3>
			<h4>회원님님의 게시물 작성 리스트 입니다</h4>
		</div>
	</center>

<h3>상품 리뷰</h3>
 <table class="table">
            <thead>
            <tr>
                <th>글번호</th>
                <th>게시판</th>
                <th>글제목</th>
                <th>날짜</th>
                <th>추천</th>
            </tr>
            </thead>
            <tbody>
            <%for(int i = 0; i < reviewlist.size(); i++){ %>
            <tr>
                <td><%=reviewlist.get(i).getREV_SEQ() %></td>
                <td>리뷰</td>
                <td><%=reviewlist.get(i).getREV_TITLE()%></td>
                <td><%=reviewlist.get(i).getREV_TIME()%></td>
                <td><%=reviewlist.get(i).getSCORE()%></td>
            </tr>
            <%} %>
            </tbody>
        </table>
	<div class="row" align="center">
			<p>
				<a href="#" class="btn btn-default" role="button"><</a> 
				<a href="#"class="btn btn-default" role="button">1</a> 
					<a href="#"class="btn btn-default" role="button">2</a> 
					<a href="#"class="btn btn-default" role="button">3</a> 
					<a href="#"class="btn btn-default" role="button">4</a> 
					<a href="#"class="btn btn-default" role="button">></a>
			</p>
		</div>
</body>
</html>