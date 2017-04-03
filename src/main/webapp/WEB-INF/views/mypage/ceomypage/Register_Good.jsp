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

.mat-input-color{
  position: relative;
  background: transparent;
  width: 80%;
  border: none;
  outline: none;
  padding: 8px 0;
  font-size: 16px;
}

.mat-div {
  padding: 30px 0 0 0;
  position: relative;
}

.mat-div-color{
  padding: 30px 0 0 0;
  position: relative;
}

.mat-div-color:after, .mat-div-color:before {
  content: "";
  position: absolute;
  display: block;
  width: 80%;
  height: 2px;
  background-color: #e2e2e2; 
  bottom: 0;
  left: 0;
  transition: all 0.5s;
}

.mat-div-color::after {
  background-color: #8E8DBE;
  transform: scaleX(0);
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
 	
 	<div class="mat-label-check" style="font-weight: bold;">카테고리 분류&nbsp;
 	<select name="item">
 	<option value="none">카테고리</option>
 	<option value="OUTER">OUTER</option>	
 	</select>
    &nbsp;
    <select name="sub_item">
    <option value="none">서브 카테고리</option>
    <option value="COAT">COAT</option>				
 	</select>
 	&nbsp;&nbsp;&nbsp;&nbsp;NEW카테고리 적용 <input type="checkbox" style="height: 20px; width: 20px;" value="Y" name="new_item">
 	</div>
    <br><br><br>
    <div class="mat-label-check" style="font-weight: bold;"><p align="center">메인 사진 등록</p>
  	<div style="float: left; width: 25%; height: " >메인<input type="file" name="onefile" id="onefile"></div>	
  	<div style="width: 12.5%; height:100px; float:left; " ></div>		
    <div style="width:25%; float: left;">서브메인<input type="file" name="twofile" id="twofile"></div>	
  	<div style="width: 12.5%; height:100px;  float:left; " ></div>		
    <div style="width:25%; float: left;">서브메인<input type="file" name="threefile" id="threefile"></div>
    </div>
	<div style="clear: left; ">
    	<div style="width: 25%; height: 200px; float:left; ;" id="imgone-div" ></div>
    	<div style="width: 12.5%; height: 200px; float:left; " ></div>		
    	<div style="width: 25%; height: 200px; float:left; " id="imgtwo-div"></div>
    	<div style="width: 12.5%; height: 200px; float:left; " ></div>		
    	<div style="width: 25%; height: 200px; float:left;" id="imgthree-div"></div>	
    </div>
    
    <button type="button" onclick="addDetail()">추가</button>
    <div style="clear: left; width: 100%; height: 300px;" id="add" >
    
    <div style="float:left; width: 20%; height: 300px;" id="addDt">
     <div class="mat-div-color">
    <label  class="mat-label">제품색상</label>
    <input type="text" class="mat-input-color" id="제품색상" name="color" >
 	 </div>
 	 <div class="mat-div-color">
    <label  class="mat-label">사이즈</label>
    <input type="text" class="mat-input-color" id="사이즈" name="size">
 	 </div>
 	 <div class="mat-div-color">
    <label  class="mat-label">재고</label>
    <input type="text" class="mat-input-color" id="재고" name="stock">
 	 </div>
 	</div>

    </div>
    
    <br><br>
    
    <div class="mat-div" style="clear:left">
    <label  class="mat-label">상품이름</label>
    <input type="text" class="mat-input" id="상품이름" name="pro_name"> 
 	</div>
  
    <div class="mat-div">
    <label  class="mat-label">상품가격</label>
    <input type="text" class="mat-input" id="상품가격" name="pro_price" >
 	 </div>
  
    <div class="mat-div">
    <label  class="mat-label">소재</label>
    <input type="text" class="mat-input" id="소재" name="material">
 	 </div>
  
    <div class="mat-div">
    <label  class="mat-label">세탁방법</label>
    <input type="text" class="mat-input" id="세탁방법" name="wash">
 	 </div>
  
    <div class="mat-div">
    <label  class="mat-label">모델체형</label>
    <input type="text" class="mat-input" id="모델체형" name="bodytype">
  	</div>
  
    <div class="mat-div">
    <label  class="mat-label">간단설명</label>
    <input type="text" class="mat-input" id="간단설명" name="pro_content">
  	</div>
  
  
    <br>
    
  	</div>
 
   
		
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
var num = 0;

$(".mat-input").focus(function(){
	  $(this).parent().addClass("is-active is-completed");
	});

	$(".mat-input").focusout(function(){
	  if($(this).val() === "")
	    $(this).parent().removeClass("is-completed");
	  $(this).parent().removeClass("is-active");
	});
$(".mat-input-color").focus(function(){
		  $(this).parent().addClass("is-active is-completed");
		});

		$(".mat-input-color").focusout(function(){
		  if($(this).val() === "")
		    $(this).parent().removeClass("is-completed");
		  $(this).parent().removeClass("is-active");
		});	

// 파일 업로드 이미지 미리보기 	
$(function() {
        $("#onefile").on('change', function(){
            readURL(this,'one');
        });
        $("#twofile").on('change', function(){
            readURL(this,'two');
        });
        $("#threefile").on('change', function(){
            readURL(this,'three');
        });
    });

    function readURL(input,num) {
    	if(num=='one'){
    		$("#imgone-div").html('<img id="oneblah" src="#" width="100%" height="100%"/>')	
    	if (input.files && input.files[0]) {
        var reader = new FileReader();
	    reader.onload = function (e) {
        		
                $('#oneblah').attr('src', e.target.result);
            }

          reader.readAsDataURL(input.files[0]);
        }
        }else if(num=='two'){
        	$("#imgtwo-div").html('<img id="twoblah" src="#" width="100%" height="100%"/>')	
        	if (input.files && input.files[0]) {
            var reader = new FileReader();
    	    reader.onload = function (e) {
        	
                $('#twoblah').attr('src', e.target.result);
            }

          reader.readAsDataURL(input.files[0]);
        }        	
        }else if(num=='three'){
        	$("#imgthree-div").html('<img id="threeblah" src="#" width="100%" height="100%"/>')	
        	if (input.files && input.files[0]) {
            var reader = new FileReader();
    	    reader.onload = function (e) {
         		
                 $('#threeblah').attr('src', e.target.result);
             }

           reader.readAsDataURL(input.files[0]);
        }
    }
    }

function addDetail() {
	num++;
	
	alert("num="+num);
	
	 var cloneElements = $('#addDt').clone(true).find("input[name^=color]").attr("name", "color"+num).end()
	 											.find("input[name^=size]").attr("name", "size"+num).end()
	 											.find("input[name^=stock]").attr("name", "stock"+num).end();
	// 변수 cloneElements를 만들어 복사된 요소들을 저장

	cloneElements .appendTo('#add');
	// 복사한 요소들을 buttons2 클래스명의 자식요소로 넣기
	
	 
	    
}
    
	
</script>


</body>

</html>