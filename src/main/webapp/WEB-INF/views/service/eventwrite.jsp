<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>:::EVENT REGISTER:::</title>
<style type="text/css">
section {
  width: 95%;
  max-width: 750px;
  position: absolute;
  top: 50%;
  left: 50%;
  transform: translate(-50%, -50%);
  text-align: center;
  padding: 3.5em .75em;
  border: 1px solid #e8e8e8;
  border-radius: 6px;
  background: #fff;
}

.btn {
  text-align: center;
  padding: .5em .75em;
  background: #3FBF7F;
  background: linear-gradient(to right, #1CCEB0, #3FBF7F);
  border: none;
  font-weight: 300;
  font-size: 1.25EM;
  color: #fff;
  border-radius: 4px;
  transition: all 500ms;
}
.btn:hover {
  border-radius: 12px;
}

input[type=file] {
  width: 0;
  height: 0;
  overflow: hidden;
  visibility: hidden;
}

.fileName {
  padding-top: 10px;
  font-weight: 300;
}

.preview {
  position: relative;
  width: 250px;
  height: 250px;
  background: #f2f2f2;
  border-radius: 100%;
  margin: 0 auto 25px auto;
  overflow: hidden;
  border: 8px solid #E0E0E0;
}
.preview img {
  width: 250px;
  height: 250px;
  object-fit: contain;
}
.preview .loadingLogo {
  position: absolute;
  top: 50%;
  left: 50%;
  margin-left: -35px;
  margin-top: -35px;
  width: 70px;
  height: 70px;
  border: 5px solid #69CD9B;
  border-top: 5px solid #2FDEC1;
  border-radius: 100%;
  animation: spin 500ms linear infinite;
}

@keyframes spin {
  from {
    transform: rotate(0deg);
  }
  to {
    transform: rotate(360deg);
  }
}
body {
  background: #f6f6f6;
}

</style>
<script src="../js/ckeditor/ckeditor.js"></script>
</head>
<body>
	<center>
		<div id="eventhead">
			<h4 align="right" style="margin-right: 100px">
				<a href="meninblack.mib">홈</a> > <a href="event.mib">이벤트</a>
			</h4>
		</div>
	</center>
	<h3>이벤트를 등록해주세요</h3>
	<br>
	<br>
	<br>
	
	
<form>
	<div class="preview"></div>
	<div align="center">
	<button id="triggerUpload" class="btn">이미지업로드</button>
	<input type="file" id="filePicker" />
	</div>
	<div class="fileName"></div>

	
<!-- Editor -->
	<textarea rows="10" cols="80" name="editor" id="editor1">
			
	</textarea>
	<script>
		CKEDITOR.replace("editor", {

			/* 이미파일 저장할 경로 */
			filebrowserImageUploadUrl : 'CkeditorImgUpload.mib',

			filebrowserWindowWidth : '500',

			filebrowserWindowHeight : '380',

			height : '600px'

		});
	</script>
		<p align="right">
			<input type="submit" class="btn btn-primary" value="등록"> <a
				class="btn btn-primary" href="event.mib" role="button">취소</a>
		</p>
</form>



	<script type="text/javascript">
		// 이미지 업로드	
		var triggerUpload = document.getElementById('triggerUpload'), upInput = document
				.getElementById('filePicker'), preview = document
				.querySelector('.preview');

		//업로드 실행
		triggerUpload.onclick = function() {
			upInput.click();
		};

		upInput.onchange = function(e) {

			var uploaded = this.value, ext = uploaded.substring(uploaded
					.lastIndexOf('.') + 1), ext = ext.toLowerCase(), fileName = uploaded
					.substring(uploaded.lastIndexOf("\\") + 1), accepted = [
					"jpg", "png", "gif", "jpeg" ];

			function showPreview() {
				preview.innerHTML = "<div class='loadingLogo'></div>";
				preview.innerHTML += '<img id="img-preview" />';
				var reader = new FileReader();
				reader.onload = function() {
					var img = document.getElementById('img-preview');
					img.src = reader.result;
				};
				reader.readAsDataURL(e.target.files[0]);
				preview.removeChild(document.querySelector('.loadingLogo'));
				document.querySelector('.fileName').innerHTML = fileName
						+ "<b> Uploaded!</b>";
			}
			;

			//only do if supported image file
			if (new RegExp(accepted.join("|")).test(ext)) {
				showPreview();
			} else {
				preview.innerHTML = "";
				document.querySelector('.fileName').innerHTML = "업로드"
						+ ext + "</b> file!";
			}

		}
	</script>
</body>
</html>