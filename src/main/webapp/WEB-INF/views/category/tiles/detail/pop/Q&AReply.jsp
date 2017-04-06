<%@page import="com.eagle.men_in_black.model.MainDto"%>
<%@ page import="com.eagle.men_in_black.model.UserMypageDto"%>
<%@ page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%
	MainDto dto = (MainDto) request.getSession().getAttribute("LoginInfo");
	UserMypageDto qnaDto = (UserMypageDto) request.getAttribute("qnaDto");
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">

<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.2.0/css/bootstrap.min.css">
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.1.1/jquery.min.js"></script>
<title>:::Q&ADetail:::</title>
<style type="text/css">
.layout {
	width: 790px;
	height: 390px;
	position: relative;
	margin-top: 10px;
	margin-left: 10px;
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
		<div class="thumbnail">
			<div align="center" style="height: 15%;">
				<h3>Q&A</h3>
			</div>

			<div style="width: 100%">
				<!-- 전체 -->
				<div style="width: 45%; float: left" align="left">
					<!-- 왼쪽  -->
					<p>
						공개설정 : <select name=secret size=1 disabled="disabled"
							style="width: 100%">
							<option value="" selected="selected"><%=qnaDto.getQNA_OPEN()%></option>
							<option value="공개">공개</option>
							<option value="비공개">비공개</option>
						</select>
					</p>
					<p>
						문의설정 : <select name=secret size=1 disabled="disabled"
							style="width: 100%">
							<option value="" selected="selected"><%=qnaDto.getQNA_TYPE()%></option>
							<option value="배송문의">배송문의</option>
							<option value="상품/교환/환불문의">상품/교환/환불문의</option>
						</select>
					</p>
					<p>
						작성자 : <input type="text" value="<%=qnaDto.getUSER_ID()%>"
							readonly="readonly" style="width: 100%">
					</p>
					<p>
						작성일 : <input type="text" value="<%=qnaDto.getQNA_TIME()%>"
							readonly="readonly" style="width: 100%">
					</p>
					<p>
						제목 : <input type="text" value="<%=qnaDto.getQNA_TITLE()%>"
							readonly="readonly" style="width: 100%"> <input
							type="hidden" id="QNA_SEQ" name="QNA_SEQ"
							value="<%=qnaDto.getQNA_SEQ()%>">

					</p>
					<p>
						내용

						<textarea style="width: 100%" rows="5px" cols="50px"
							readonly="readonly"><%=qnaDto.getQNA_CONTENT()%></textarea>
					</p>



				</div>
				<div style="width: 45%; float: left;margin-left: 5%" align="left" >
					<!-- 오른쪽  -->
					<p>
						공개설정 : <select name=secret size=1 style="width: 100%">
							<option value="" selected="selected" style="width: 100%"></option>
							<option value="공개">공개</option>
							<option value="비공개">비공개</option>
						</select>
					</p>
					<p>
						문의설정 : <select name=secret size=1 style="width: 100%">
							<option value="" selected="selected" style="width: 100%"></option>
							<option value="배송문의">배송문의</option>
							<option value="상품/교환/환불문의">상품/교환/환불문의</option>
						</select>
					</p>
					<p>
						작성자 : <input type="text" value="<%=dto.getUSER_ID()%>>" style="width: 100%" >
					</p>
					<p>
						작성일 : <input type="text" value="" style="width: 100%">
					</p>
					<p>
						제목 : <input type="text" value="" style="width: 100%"> <input
							type="hidden" id="QNA_SEQ" name="QNA_REF"
							value="<%=qnaDto.getQNA_REF()%>">
					</p>
					<p>내용
					<textarea style="width: 100%" rows="5px" cols="50px"></textarea>
					</p>


				</div>

			</div>


			<script type="text/javascript">
				function update(QNA_SEQ) {
							location.href = "qnaup.mib?QNA_SEQ=" + QNA_SEQ,
							"pop",
							"width=810 height=420 resizable=no location=no screenX=400 screenY=300 scrollbars=no";
					window.colse();
				};
				function rep(QNA_SEQ) {
							location.href = "qnarep.mib?QNA_SEQ=" + QNA_SEQ,
							"pop",
							"width=810 height=420 resizable=no location=no screenX=400 screenY=300 scrollbars=no";
					window.colse();
				};

				function del() {
					var QNA_SEQ = $("#QNA_SEQ").val();

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
							if (flag.result == 'success') {
								opener.parent.location.reload();
								windowClose();
							}
							;
						},
						complete : function(data) {
						},
						error : function(xhr, status, error) {
							alert("에러발생");
						}
					});
				};

				function windowClose() {
					window.close();
				}
			</script>
</body>
</html>