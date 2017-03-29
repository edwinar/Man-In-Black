<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
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
	<div>
		<div class="col-xs-8 col-xs-offset-2 MyPost">
			<table class="table" onclick="location.href='myboardreview.mib'">
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
					<tr>
						<td>1</td>
						<td>상품리뷰</td>
						<td>제몸에 딱이에요!!</td>
						<td>2017-01-01</td>
						<td>211</td>
					</tr>
					<tr>
						<td>2</td>
						<td>상품리뷰</td>
						<td>정말...</td>
						<td>2017-01-01</td>
						<td>211</td>
					</tr>
					<tr>
						<td>3</td>
						<td>상품리뷰</td>
						<td>광고 아닙니다 정말 최고..</td>
						<td>2017-01-01</td>
						<td>211</td>
					</tr>
				</tbody>

			</table>
				<br><br><br><br>


			<table class="table" onclick="location.href='myboardqna.mib'">
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
					<tr>
						<td>1</td>
						<td>제품상세</td>
						<td>제몸에 딱이에요!!</td>
						<td>2017-01-01</td>
						<td>211</td>
					</tr>
					<tr>
						<td>2</td>
						<td>제품상세</td>
						<td>정말...</td>
						<td>2017-01-01</td>
						<td>211</td>
					</tr>
					<tr>
						<td>3</td>
						<td>제품상세</td>
						<td>광고 아닙니다 정말 최고..</td>
						<td>2017-01-01</td>
						<td>211</td>
					</tr>
				</tbody>

			</table>



		</div>
	</div>
</body>
</html>
