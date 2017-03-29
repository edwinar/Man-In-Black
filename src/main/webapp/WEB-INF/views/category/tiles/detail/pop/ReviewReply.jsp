<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
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
	window.close();
}
</script>
<div class="layout">
	<div class="leftLayout">
		<div class="thumbnail">
			<div class="score" align="center" style="height: 20%"> 평점 
				<img alt="..." src="../images/scoreFull.png">
				<img alt="..." src="../images/scoreFull.png">
				<img alt="..." src="../images/scoreFull.png">
				<img alt="..." src="../images/scoreFull.png">
				<img alt="..." src="../images/scoreEmpty.png">
				<hr style="border: solid black 1px; width: 70%;">
			</div>
			<div class="title" align="center" style="height: 20%; width: 100%;">
				<h3>니가 게맛을 알아?</h3>
			</div>
			<div class="info" style="height: 15%; width: 100%; text-align: right;">
				<h5>작성자:급식창건<br/>작성날짜:시스데이트</h5>
			</div>
			<div class="content" align="center" style="height: 28%; width: 100%; text-align: left;">
				<textarea rows="5px" cols="50px" readonly="readonly">니들이 게맛을 알아?</textarea>
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
				제목 : <input type="text" id="title" size="30px"/>
			</div>
			<div class="info" style="height: 15%; width: 100%; text-align: right;">
				<h5>작성자:나사장<br/>작성날짜:시스데이트</h5>
			</div>
			<div class="content" align="center" style="height: 28%; width: 100%; text-align: left;">
				<textarea rows="5px" cols="50px"></textarea>
			</div>
			<div class="btn" align="center" style="height: 10%; width:100%;">
				<button style="width: 50%; height: 100%;" onclick="closePop()">답글달기</button>
			</div>
		</div>
	</div>
</div>


</body>
</html>