<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<script src="../js/ckeditor/ckeditor.js"></script>
<style type="text/css">
.wrap {
  width: 100%;
  }

.mat-label {
  display: block;
  font-size: 16px;
  transform: translateY(25px);
  color: #e2e2e2;
  transition: all 0.5s;
}
.mat-label-check{
  display: block;
  font-size: 16px;
  transform: translateY(25px);
  color: #black;
  transition: all 0.5s;
}
.mat-input {
  position: relative;
  background: transparent;
  width: 100%;
  border: none;
  outline: none;
  padding: 8px 0;
  font-size: 16px;
}

.mat-div {
  padding: 30px 0 0 0;
  position: relative;
}

.mat-div:after, .mat-div:before {
  content: "";
  position: absolute;
  display: block;
  width: 100%;
  height: 2px;
  background-color: #e2e2e2; 
  bottom: 0;
  left: 0;
  transition: all 0.5s;
}

.mat-div::after {
  background-color: #8E8DBE;
  transform: scaleX(0);
}

.is-active::after {
  transform: scaleX(1);
}

.is-active .mat-label {
  color: #8E8DBE;
}

.is-completed .mat-label {
  font-size: 12px;
  transform: translateY(0);
}

 .reg_good {

} 
</style>

<body>

	<form action="writeGood.mib" id="writeform" method="post" enctype="multipart/form-data">

	<div class="wrap">
 	
 	<label class="mat-label-check">카테고리 분류 <select>
 	<option>OUTER</option>
 	<option>TOP</option>
 	<option>PANTS</option>
 	<option>SHOES</option>
 	<option>BAG&ACC</option>					
 	</select></label>
    
    
    <label class="mat-label-check">카테고리  소분류<select><option>COAT</option></select> </label>
    <label class="mat-label-check">NEW카테고리 적용      <input type="checkbox" style="height: 20px; width: 20px;"></label>
    
 	
 	<div class="mat-div">
    <label  class="mat-label">상품이름</label>
    <input type="text" class="mat-input" id="상품이름"> 
 	</div>
  
    <div class="mat-div">
    <label  class="mat-label">상품가격</label>
    <input type="text" class="mat-input" id="상품가격" >
 	 </div>
  
    <div class="mat-div">
    <label  class="mat-label">소재</label>
    <input type="text" class="mat-input" id="소재">
 	 </div>
  
    <div class="mat-div">
    <label  class="mat-label">세탁방법</label>
    <input type="text" class="mat-input" id="세탁방법">
 	 </div>
  
    <div class="mat-div">
    <label  class="mat-label">모델체형</label>
    <input type="text" class="mat-input" id="모델체형">
  	</div>
  
    <div class="mat-div">
    <label  class="mat-label">간단설명</label>
    <input type="text" class="mat-input" id="간단설명">
  	</div>
  
  
    <br>
    
  	</div>
 
  	메인1<input type="file" name="onefile">	
  	메인2<input type="file" name="twofile">	
  	메인3<input type="file" name="threefile">
   
		
    <label  class="mat-label">제품 상세 설명</label>
  
  	<br>
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
		
		<input type="submit" value="글올리기" class="reg_good" >
		<input type="button" value="취소" class="reg_good">
	</form>



<script type="text/javascript">
$(".mat-input").focus(function(){
	  $(this).parent().addClass("is-active is-completed");
	});

	$(".mat-input").focusout(function(){
	  if($(this).val() === "")
	    $(this).parent().removeClass("is-completed");
	  $(this).parent().removeClass("is-active");
	});
</script>


</body>

</html>