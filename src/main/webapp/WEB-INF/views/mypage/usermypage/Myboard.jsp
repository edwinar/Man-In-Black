<%@ page import="com.eagle.men_in_black.model.UserMypageDto" %>
<%@ page import="java.util.List" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
		 pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%
	List<UserMypageDto> qnaList= (List<UserMypageDto>)request.getAttribute("qna");
	List<UserMypageDto> reviewlist= (List<UserMypageDto>)request.getAttribute("review");
%>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link rel="stylesheet"
	href="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/css/bootstrap.min.css">
<title>::내가쓴 게시물::</title>
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
	<div class="row">
		<div class="col-xs-8 col-xs-offset-2 MyPost">
			<span class="mypage-link" style="font-size: 19px;"><a href='myboardreview.mib'>My Review</a></span>
			<table class="table">
				<tfoot>
				<td colspan="5" align="center">
					<span class="mypage-link"><a href='myboardreview.mib'>더 보기</a></span>
				</td>
				</tfoot>
				<thead>
				<tr>
					<th>글번호</th>
					<th>상품명</th>
					<th>글제목</th>
					<th>날짜</th>
					<th>추천</th>
				</tr>
				</thead>

				<tbody id="board">

				<%for(int i = 0; i < reviewlist.size(); i++){ %>
				<tr>
					<td><%=reviewlist.get(i).getREV_SEQ() %></td>
					<td><%=reviewlist.get(i).getPRO_NAME() %></td>
					<td><%=reviewlist.get(i).getREV_TITLE()%></td>
					<td><%=reviewlist.get(i).getREV_TIME()%></td>
					<td><%=reviewlist.get(i).getSCORE()%></td>
				</tr>
				<%} %>

				</tbody>

			</table>

				<br><br><br><br>


			<table class="table">
				<tfoot>
				<td colspan="5" align="center">
					<span class="mypage-link"><a href='myboardqna.mib'>더 보기</a></span>
				</td>
				</tfoot>


				<span class="mypage-link" style="font-size: 19px;"><a href='myboardqna.mib'>My Q&A</a></span>
				<thead  >
				<tr>
					<th>글번호</th>
					<th>상품명</th>
					<th>글제목</th>
					<th>날짜</th>
					<th>추천</th>
				</tr>
				</thead>
				<tbody>
				<%for(int i = 0; i < qnaList.size(); i++){ %>
				<tr>
					<td><%=i+1%></td>
					<td><%=qnaList.get(i).getPRO_NAME() %></td>
					<td><%=qnaList.get(i).getQNA_TITLE()%></td>
					<td><%=qnaList.get(i).getQNA_TIME()%></td>
					<%if(qnaList.get(i).getQNA_STEP()=="Y"){ %>
					<td>답변완료</td>
					<%}else{ %>
					<td>답변중</td>
					<%} %>
				</tr>
				<%} %>
				</tbody>

			</table>



		</div>
	</div>



</body>
</html>

