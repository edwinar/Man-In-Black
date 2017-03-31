<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
	
<%

%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<script src="../js/ckeditor/ckeditor.js"></script>
<style type="text/css">
body {
	margin-top: 5%;
}
</style>

<body>


	<form enctype="multipart/form-data">
		<textarea rows="10" cols="80" name="editor" id="editor1">
		텍스트 아레아 
	</textarea>
		<script>
			CKEDITOR
					.replace(
							"editor",
							{

								/* 이미파일 저장할 경로 */
								filebrowserImageUploadUrl : 'ckeditorImageUpload.mib',

								filebrowserWindowWidth : '650',

								filebrowserWindowHeight : '480',

								height : '600px'

							});
		</script>
	</form>


</body>
</html>