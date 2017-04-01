<%@page import="com.eagle.men_in_black.model.MainDto"%>
<%@page import="com.eagle.men_in_black.model.UserMypageDto"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
	<%
	MainDto userinfo  =(MainDto)session.getAttribute("LoginInfo");
	%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>::회원정보 수정::</title>
<style>
#Registration{font-size:1em;color:black;text-align:center;font-weight:normal;}

#signupdiv
{
width:500px;
height:auto;
margin:1% auto;
}

#inputlbl{padding:0px 0px 0px 20px;
background:rgba(255,255,255,0.8);
border-radius:5px;

}

#signupdiv .inputsnlables:last-child{border-bottom:none;}

.inputsnlables
{
overflow:auto;
border-bottom:1px solid #dedede;
}

#MIBsignupform label
{
display:block;
font-size:0.9em;
color:#767676;
padding:20px 0px;
width:100px;
float:left;
font-weight:bold;
}

#MIBsignupform input
{
border:none;
padding:20px 0px;
background:transparent;
width:230px;
font-size:0.9em;
}


#MIBsignupform input[type=button]
{
background:#fff;
text-align:center;
width:100%;
border-radius:10px;
border-style:groove;
border-color:#f2f2f2;
font-size:1.2em;
color:black;
margin-top:10px;
cursor:pointer;
-webkit-transition:0.5s ease;-moz-transition:0.5s ease;transition:0.5s ease;
height: 15px;

}
#MIBsignupform button{
background:#fff;
text-align:center;
border-radius:5px;
font-size:1em;
color:black;
margin-top:10px;
cursor:pointer;
-webkit-transition:0.5s ease;-moz-transition:0.5s ease;transition:0.5s ease;
height: 30px;
}
#MIBsignupform button:hover{
background:black;
color:white;
-webkit-transition:0.5s ease;-moz-transition:0.5s ease;transition:0.5s ease;}
</style>
</head>
<body>
<center>
<div id="mypagehead">
<h4 align="right" style="margin-right: 100px"><a href="meninblack.mib">홈</a> > 
<a href="mymain.mib">MY PAGE</a> > 
<a href="userup.mib">회원정보수정</a></h4>
<h3>MY Order</h3>
<h4>회원님의 정보를 수정하세요</h4>
</div>
</center>

<script type="text/javascript">
$(document).ready(function() {
	
	$("#signA-div").hide();
	
	$("#checkbtn").click(function() {
		var pwd = $("#pw").val();
		
		$.ajax({
 			type : "POST",
 			url : "pwdCheck.mib",
 			async : true,
 			dataType : "html",
 			data : {
 				"pwd" : pwd
 			},
 			success : function(data) {
 				//alert("success " + data);
 				var flag = $.parseJSON(data);
 				
 				if(flag.success==='success'){
 					$('#pwdCheck').hide();  
 				}else{
 					alert(flag.check); 	
 				}
 			},
 			complete : function(data) {
 			},
 			error : function(xhr, status, error) {
 				alert("에러발생");
 			}
 		});		
 
	});
});
</script>

	<div style="width: 100%; height: 700px; " id="pwdCheck" >
		<center>
			<form style="margin-top: 200px">
				비밀 번호 확인 <br>
				<input type="password" size="30" style="background-color: white;" class="" name="pw" id="pw"><br>
				<input type="button" value="확인" class="checkbtn" id="checkbtn">
			</form>
		</center>
	</div>


<form id="MIBsignupform" action="userup.mib" method="post">
<div id="signupdiv">
<h1 id="Registration">회원 가입</h1>
<div id="inputlbl">
<div class="inputsnlables"><label>EMAIL</label><input type="email" placeholder="EMAIL" name="sign_email" id="sign_email" value="<%=userinfo.getEMAIL()%>" readonly="readonly" value="<%=userinfo.getEMAIL()%>"/> </div> 
<div id="signB-div">
<a href="" id="signB" data-toggle="modal" data-target="" class="btn btn-default" >EMAIL바꾸기</a>
</div>
<div id="signA-div">
<a href="" id="signA" data-toggle="modal" data-target="" class="btn btn-default" >EMAIL인증</a>
</div>

<div class="inputsnlables"><label>ID</label><input type="text" placeholder="ID" name="id" id="id" class="lock" readonly="readonly" value="<%=userinfo.getUSER_ID()%>"/></div>
<div class="inputsnlables"><label>PassWord</label><input type="password" placeholder="PassWord" id="password" name="password" /></div>
<div class="inputsnlables"><label>Name</label><input type="text" placeholder="Name" id="name" name="name" readonly="readonly" value="<%=userinfo.getUSER_NAME()%>"/></div>
<div class="inputsnlables"><label>TEL</label><input type="text" placeholder="TEL" id="tel" name="tel" value="<%=userinfo.getTEL()%>"/></div>
<div class="inputsnlables"><label>POSTCODE</label><input type="text" placeholder="POSTCODE" id="postcode" name="postcode" readonly="readonly" class="lock"/>
<button onclick="Postcode()" type="button" >우편번호 찾기</button></div>
<div class="inputsnlables" id="roadAddressdiv"></div>
<div class="inputsnlables" id="jibunAddressdiv"></div>
<div class="inputsnlables" id="detailAddressdiv"></div>
<div class="inputsnlables"><label>SEX</label><input type="text" placeholder="SEX" name="sex"; id="sex"; readonly="readonly" value="<%=userinfo.getSEX()%>"/></div>
<div class="inputsnlables"><label>BIRTH</label><input type="text" placeholder="19900411" name="birth"; id="birth"; readonly="readonly" value="<%=userinfo.getBIRTH()%>" /></div>


<input type="button" id="complete" value="정보수정하기">
</div>
</div>

</form>

<script type="text/javascript">
function cl() {
	var email1 = $("#sign_email").val();
	$("#modal-email").modal({
        remote : 'mail.mib?sign_email='+email1,
        backdrop: 'static' // 배경누르고 닫힘 방지 
    });
}

$(document).ready(function() {
	
	$("#signB").click(function(){
		var email = $("#sign_email").val();
		document.getElementById("signB").innerHTML = "EMAIL인증";
		$("#sign_email").attr('readonly',false);
	
	});	

		
$("#complete").click(function() {
	
	var tel           = $("#tel").val();
	var postcode      = $("#postcode").val();
	var password      = $("#password").val();
	var jibunAddress  = $("#jibunAddress").val();
	var roadAddress   = $("#roadAddress").val();
	var detailAddress = $("#detailAddress").val();
	
	if(password      == "") {alert("PASSWORD을 작성해주세요");  }
	else if(tel           == "") {alert("TEL을 작성해주세요");       }
	else if(postcode      == "") {alert("POSTCODE을 작성해주세요");  }
	else if(detailAddress == "") {alert("주소정보를 입력해주세요");      }
	else{
		
		$("#MIBsignupform").submit();
	}


});
});

function Postcode() {
    new daum.Postcode({
        oncomplete: function(data) {
            // 팝업에서 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분.

            // 도로명 주소의 노출 규칙에 따라 주소를 조합한다.
            // 내려오는 변수가 값이 없는 경우엔 공백('')값을 가지므로, 이를 참고하여 분기 한다.
            var fullRoadAddr = data.roadAddress; // 도로명 주소 변수
            var extraRoadAddr = ''; // 도로명 조합형 주소 변수

            // 법정동명이 있을 경우 추가한다. (법정리는 제외)
            // 법정동의 경우 마지막 문자가 "동/로/가"로 끝난다.
            if(data.bname !== '' && /[동|로|가]$/g.test(data.bname)){
                extraRoadAddr += data.bname;
            }
            // 건물명이 있고, 공동주택일 경우 추가한다.
            if(data.buildingName !== '' && data.apartment === 'Y'){
               extraRoadAddr += (extraRoadAddr !== '' ? ', ' + data.buildingName : data.buildingName);
            }
            // 도로명, 지번 조합형 주소가 있을 경우, 괄호까지 추가한 최종 문자열을 만든다.
            if(extraRoadAddr !== ''){
                extraRoadAddr = ' (' + extraRoadAddr + ')';
            }
            // 도로명, 지번 주소의 유무에 따라 해당 조합형 주소를 추가한다.
            if(fullRoadAddr !== ''){
                fullRoadAddr += extraRoadAddr;
            }

            // 우편번호와 주소 정보를 해당 필드에 넣는다.
            document.getElementById('postcode').value = data.zonecode; //5자리 새우편번호 사용
            
            if(fullRoadAddr!=null&&fullRoadAddr!=""){
            	document.getElementById('jibunAddressdiv').innerHTML = '';
            	document.getElementById('roadAddressdiv').innerHTML = '<label>도로명주소</label><input type="text" placeholder="RoadADDRESS" id="roadAddress" name="roadAddress" readonly="readonly" />';
                document.getElementById('roadAddress').value = fullRoadAddr;
                document.getElementById('detailAddressdiv').innerHTML = '<label>나머지주소</label><input type="text" placeholder="ADDRESS" id="detailAddress" name="detailAddress"/>';
               
            }
            if(data.jibunAddress!=null&&data.jibunAddress!=""){
          
            document.getElementById('roadAddressdiv').innerHTML ='';
            document.getElementById('jibunAddressdiv').innerHTML = '<label>지번주소</label><input type="text" placeholder="ADDRESS" id="jibunAddress" name="jibunAddress" readonly="readonly"/>';
            document.getElementById('jibunAddress').value = data.jibunAddress;
            document.getElementById('detailAddressdiv').innerHTML = '<label>나머지주소</label><input type="text" placeholder="ADDRESS" id="detailAddress" name="detailAddress" />';
            }
            // 사용자가 '선택 안함'을 클릭한 경우, 예상 주소라는 표시를 해준다.
            if(data.autoRoadAddress) {
                //예상되는 도로명 주소에 조합형 주소를 추가한다.
                var expRoadAddr = data.autoRoadAddress + extraRoadAddr;
               // document.getElementById('guide').innerHTML = '(예상 도로명 주소 : ' + expRoadAddr + ')';

            } else if(data.autoJibunAddress) {
                var expJibunAddr = data.autoJibunAddress;
                //document.getElementById('guide').innerHTML = '(예상 지번 주소 : ' + expJibunAddr + ')';

            } else {
               // document.getElementById('guide').innerHTML = '';
            }
        }

    }).open();
}

</script>

</body>
</html>