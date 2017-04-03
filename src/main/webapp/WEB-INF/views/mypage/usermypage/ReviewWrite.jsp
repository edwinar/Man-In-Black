<%@page import="com.eagle.men_in_black.model.MainDto"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
	
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.2.0/css/bootstrap.min.css">
<title>:::Review:::</title>

<style type="text/css">
.layout {
	width: 790px;
	height: 390px;
	position: relative;
	margin-top: 10px;
}

.leftLayout {
	float: left;
	width: 49.5%;
	height: 100%;
	position: relative;
	margin-left: 5px;
}

.rightLayout {
	float: right;
	width: 49.5%;
	height: 100%;
	position: relative;
}

.thumbnail {
	width: 100%;
	height: 100%;
	text-align: center;
}
</style>
</head>
<body>

	<div class="layout">
		<div class="leftLayout">

			<div>
				<span class="glyphicon glyphicon-paperclip" aria-hidden="true"></span>
				<a class="panel-title" style="margin-left: 10px; margin-bottom: 5px">파일
					업로드</a>
			</div>
			<div class="panel panel-default"
				style="margin-left: 40px; margin-bottom: 30px">
				<div class="panel-body">
					<input type="file" name="uploadFile">
				</div>
			</div>

		</div>
		<div class="rightLayout">
			<div class="thumbnail">
				<div class="score" align="center" style="height: 20%">
					평점 <img alt="..." src="../images/scoreEmpty.png" id="star1"
						onclick="star1()"> <img alt="..."
						src="../images/scoreEmpty.png" id="star2" onclick="star2()">
					<img alt="..." src="../images/scoreEmpty.png" id="star3"
						onclick="star3()"> <img alt="..."
						src="../images/scoreEmpty.png" id="star4" onclick="star4()">
					<img alt="..." src="../images/scoreEmpty.png" id="star5"
						onclick="star5()">

					<hr style="border: solid black 1px; width: 70%;">
				</div>



				<div class="title" align="center" style="height: 20%; width: 100%;">
					<input type="text" id="title">
				</div>
				<div class="info"
					style="height: 15%; width: 100%; text-align: right;">
					작성자 :  작성일 :
					
				</div>
				<div class="content" align="center"
					style="height: 28%; width: 100%; text-align: left;">
					<input type="text" id="content" style="width: 100%; height: 100px">
				</div>
				<div class="btn" align="center" style="height: 10%; width: 100%;">
					<button style="width: 50%; height: 100%;"
						onclick="insrt()">리뷰달기</button>
				</div>
			</div>
		</div>
	</div>




	<script type="text/javascript">
		var score = 0;
		$(function() {
			$("#star1").click(function() {

				$("#star1").attr("src", "../images/scoreFull.png");
				$("#star2").attr("src", "../images/scoreEmpty.png");
				$("#star3").attr("src", "../images/scoreEmpty.png");
				$("#star4").attr("src", "../images/scoreEmpty.png");
				$("#star5").attr("src", "../images/scoreEmpty.png");
				score = 1;
				alert(score);
			});

			$("#star2").click(function() {
				$("#star1").attr("src", "../images/scoreFull.png");
				$("#star2").attr("src", "../images/scoreFull.png");
				$("#star3").attr("src", "../images/scoreEmpty.png");
				$("#star4").attr("src", "../images/scoreEmpty.png");
				$("#star5").attr("src", "../images/scoreEmpty.png");
				score = 2;
				alert(score);
			});
			$("#star3").click(function() {
				$("#star1").attr("src", "../images/scoreFull.png");
				$("#star2").attr("src", "../images/scoreFull.png");
				$("#star3").attr("src", "../images/scoreFull.png");
				$("#star4").attr("src", "../images/scoreEmpty.png");
				$("#star5").attr("src", "../images/scoreEmpty.png");
				score = 3;
				alert(score);
			});
			$("#star4").click(function() {
				$("#star1").attr("src", "../images/scoreFull.png");
				$("#star2").attr("src", "../images/scoreFull.png");
				$("#star3").attr("src", "../images/scoreFull.png");
				$("#star4").attr("src", "../images/scoreFull.png");
				$("#star5").attr("src", "../images/scoreEmpty.png");
				score = 4;
				alert(score);
			});
			$("#star5").click(function() {

				$("#star1").attr("src", "../images/scoreFull.png");
				$("#star2").attr("src", "../images/scoreFull.png");
				$("#star3").attr("src", "../images/scoreFull.png");
				$("#star4").attr("src", "../images/scoreFull.png");
				$("#star5").attr("src", "../images/scoreFull.png");
				score = 5;
				alert(score);
			});

		})
	function insrt() {
			
			ocument.location.href='basketdelete.mib?BAS_SEQ='+BAS_SEQ+'?';
		
	}	
		
		
		       
	</script>
</body>
</html>