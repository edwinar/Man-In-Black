<%@ page import="com.eagle.men_in_black.model.UserMypageDto" %>
<%@ page import="java.util.List" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
		 pageEncoding="UTF-8"%>
<%

	UserMypageDto qnaDto = (UserMypageDto)request.getAttribute("qnaDto");
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">

<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.2.0/css/bootstrap.min.css">
<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.1.1/jquery.min.js"></script>
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

<div class="layout">
	<div class="thumbnail">
		<div align="center" style="height: 15%;">
			<h3>Q&A</h3>
		</div>
		<div align="center" style="height: 10%; width: 100%;">
			<div style="float: left; width: 50%; height: 100%;" align="left">
				<p style="margin-left: 30px;">
				공개설정 : 
				<select name=secret size=1 disabled="disabled">
			        <option value="" selected="selected"><%=qnaDto.getQNA_OPEN()%></option>
			        <option value="공개">공개</option>
			        <option value="비공개">비공개</option>
		    	</select>
		    	</p>
			</div>
			<div style="float: right; width: 50%; height: 100%;" align="left">
				<p style="margin-left: 30px;">
				문의설정 : 
				<select name=secret size=1 disabled="disabled">
			        <option value="" selected="selected"><%=qnaDto.getQNA_TYPE()%></option>
			        <option value="배송문의">배송문의</option>
			        <option value="상품/교환/환불문의">상품/교환/환불문의</option>
		    	</select>
		    	</p>
			</div>
		</div>
		<div style="height: 10%; width: 100%;">
			<div style="height: 100%; width: 50%; float: left;">
				<p align="left" style="margin-left: 30px;">
					작성자 : <input type="text" value="<%=qnaDto.getUSER_ID()%>" readonly="readonly">
				</p>
			</div>
			<div style="height: 100%; width: 50%; float: right;">
				<p align="left" style="margin-left: 30px;">
					작성일 : <input type="text" value="<%=qnaDto.getQNA_TIME()%>" readonly="readonly">
				</p>
			</div>
		</div>
		<div style="height: 10%; width: 100%;">
			<p align="left" style="margin-left: 30px;">
				제목 : <input type="text" value="<%=qnaDto.getQNA_TITLE()%>" readonly="readonly">
					<input type="hidden" id="QNA_SEQ" name="QNA_SEQ" value="<%=qnaDto.getQNA_SEQ()%>" >
			</p>
		</div>
		<div style="height: 35%; width: 100%;">
			<p><h5 align="left" style="margin-left: 30px;">내용</h5></p>
			<textarea rows="5px" cols="100px" readonly="readonly"><%=qnaDto.getQNA_CONTENT()%></textarea>
		</div>
		<div class="btn" align="center" style="height: 10%; width:100%;">
			<div style="float: left; width: 50%;">
				<button style="width: 50%; height: 100%;" onclick="update(<%=qnaDto.getQNA_SEQ()%>)">수정하기</button>
			</div>
			<div style="float: right; width: 50%;">
				<button style="width: 50%; height: 100%;" onclick="del()">삭제하기</button>
			</div>
		</div>
	</div>
</div>
<script type="text/javascript">
function update(QNA_SEQ){
	location.href="qnaup.mib?QNA_SEQ="+QNA_SEQ,"pop","width=810 height=420 resizable=no location=no screenX=400 screenY=300 scrollbars=no";
	window.colse();
};

function del() {
	var QNA_SEQ =$("#QNA_SEQ").val();

	$.ajax({
			type : "POST",
			url : "qnadel.mib",
			async : true,
			dataType : "html",
			data : {
				"QNA_SEQ" : QNA_SEQ
			},
			success : function(data) {
				//alert("success " + data);
				var flag = $.parseJSON(data);
				if(flag.result=='success'){
					opener.parent.location.reload();
					windowClose();	
				}; 		
			},
			complete : function(data) {
			},
			error : function(xhr, status, error) {
				alert("에러발생");
			}
		});	
	};

	function windowClose(){
		window.close();
		}


</script>


</body>
</html>