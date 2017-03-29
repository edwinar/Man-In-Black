<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.2.0/css/bootstrap.min.css">
<title>:::Q&ADetail:::</title>
<style type="text/css">
.layout{
	width: 790px;
	height: 390px;
	position: relative;
	margin-top: 10px;
	margin-left: 10px;
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
function windowClose(){
	window.close();
}
</script>

<div class="layout">
	<div class="thumbnail">
		<div align="center" style="height: 15%;">
			<h3>Q&A</h3>
		</div>
		<div align="center" style="height: 10%; width: 100%;">
			<div style="float: left; width: 50%; height: 100%;" align="left">
				<p style="margin-left: 30px;">
				공개설정 : 
				<select name=secret size=1>
			        <option value="" selected="selected">공개/비공개</option>
			        <option value="공개">공개</option>
			        <option value="비공개">비공개</option>
		    	</select>
		    	</p>
			</div>
			<div style="float: right; width: 50%; height: 100%;" align="left">
				<p style="margin-left: 30px;">
				문의설정 : 
				<select name=secret size=1>
			        <option value="" selected="selected">문의구분</option>
			        <option value="배송문의">배송문의</option>
			        <option value="상품/교환/환불문의">상품/교환/환불문의</option>
		    	</select>
		    	</p>
			</div>
		</div>
		<div style="height: 10%; width: 100%;">
			<div style="height: 100%; width: 50%; float: left;">
				<p align="left" style="margin-left: 30px;">
					작성자 : <input type="text" value="급식창건" readonly="readonly">
				</p>
			</div>
			<div style="height: 100%; width: 50%; float: right;">
				<p align="left" style="margin-left: 30px;">
					작성일 : <input type="text" value="시스데이트" readonly="readonly">
				</p>
			</div>
		</div>
		<div style="height: 10%; width: 100%;">
			<p align="left" style="margin-left: 30px;">
				제목 : <input type="text">
			</p>
		</div>
		<div style="height: 35%; width: 100%;">
			<p><h5 align="left" style="margin-left: 30px;">내용</h5></p>
			<textarea rows="5px" cols="100px"></textarea>
		</div>
		<div class="btn" align="center" style="height: 10%; width:100%;">
			<div style="float: left; width: 50%;">
				<button style="width: 50%; height: 100%;">등록하기</button>
			</div>
			<div style="float: right; width: 50%;">
				<button style="width: 50%; height: 100%;" onclick="windowClose()">취소하기</button>
			</div>
		</div>
	</div>
</div>

</body>
</html>