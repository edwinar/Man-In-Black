<%@page import="java.util.HashMap"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%
HashMap<String,String> map = (HashMap<String,String>)request.getAttribute("map");

String success = map.get("success");
System.out.println(success);

%>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">

<title>Insert title here</title>
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
<input type="hidden" name="success" id="success" value="<%=success %>">

<form id="MIBsignupform" action="compl.mib" method="post">
<div id="signupdiv">
<h1 id="Registration">회원 가입</h1>
<div id="inputlbl">
<div class="inputsnlables"><label>EMAIL</label><input type="email" placeholder="EMAIL" name="sign_email" id="sign_email" value="<%=map.get("sign_email") %>" /> 
<a href="" id="signA" data-toggle="modal" data-target="" class="btn btn-default" >
 EMAIL인증</a></div> 


<div class="inputsnlables"><label>ID</label><input type="text" placeholder="ID" name="id" id="id" class="lock"/>
	<button type="button" id="IDBtn">ID중복확인</button>
</div>
<div class="inputsnlables"><label>PassWord</label><input type="password" placeholder="PassWord" id="password" name="password" class="lock"/></div>
<div class="inputsnlables"><label>Name</label><input type="text" placeholder="Name" id="name" name="name" class="lock"/></div>
<div class="inputsnlables"><label>TEL</label><input type="text" placeholder="TEL" id="tel" name="tel" class="lock"/></div>
<div class="inputsnlables"><label>POSTCODE</label><input type="text" placeholder="POSTCODE" id="postcode" name="postcode" readonly="readonly" class="lock"/>
<button onclick="Postcode()" type="button" >우편번호 찾기</button></div>
<div class="inputsnlables" id="roadAddressdiv"></div>
<div class="inputsnlables" id="jibunAddressdiv"></div>
<div class="inputsnlables" id="detailAddressdiv"></div>
<div class="inputsnlables"><label>SEX</label><input type="text" placeholder="SEX" name="sex"; id="sex"; class="lock"/></div>
<div class="inputsnlables"><label>BIRTH</label><input type="text" placeholder="19900411" name="birth"; id="birth"; class="lock" /></div>


<input type="button" id="complete" value="회원가입하기">
</div></div>

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
	
	var lock = $("#success").val();
	if(lock=='fail'){
		$(".lock").attr('disabled',true);
	}else{
		$(".lock").attr('disabled',false);
	}
	
	
	$("#complete").click(function() {
		
		var sign_email    = $("#sign_email").val();
		var id            = $("#id").val();
		var name          = $("#name").val();
		var tel           = $("#tel").val();
		var sex           = $("#sex").val();
		var birth         = $("#birth").val();
		var postcode      = $("#postcode").val();
		var password      = $("#password").val();
		var jibunAddress  = $("#jibunAddress").val();
		var roadAddress   = $("#roadAddress").val();
		var detailAddress = $("#detailAddress").val();
		
		if(sign_email == "") {alert("EMAIL을 작성해주세요"); }   
		else if(id            == "") {alert("ID를 작성해주세요"); }
		else if(password      == "") {alert("PASSWORD을 작성해주세요");  }
		else if(name          == "") {alert("NAME을 작성해주세요");      }
		else if(tel           == "") {alert("TEL을 작성해주세요");       }
		else if(postcode      == "") {alert("POSTCODE을 작성해주세요");  }
		else if(detailAddress == "") {alert("주소정보를 입력해주세요");      }
		else if(sex           == "") {alert("SEX을 작성해주세요");       }
		else if(birth         == "") {alert("BIRTH을 작성해주세요");     }
		else{
			
			$("#MIBsignupform").submit();
		}
	
	
	});
	
	
	$("#IDBtn").click(function() {
		
		var id = $('#id').val();
		
		$.ajax({
			 			type : "POST",
			 			url : "idCheck.mib",
			 			async : true,
			 			dataType : "html",
			 			data : {
			 				"id" : id
			 			},
			 			success : function(data) {
			 				//alert("success " + data);
			 				var flag = $.parseJSON(data);
			 				alert(flag.check); 	
			 				if(flag.result=='NO'){
			 					$("#id").val('');
			 				}
			 			},
			 			complete : function(data) {
			 			},
			 			error : function(xhr, status, error) {
			 				alert("에러발생");
			 			}
			 		});		
			 
	});
	
	$("#signA").click(function(){
		var email = $("#sign_email").val();
		alert(email);
		$.ajax({
		 			type : "POST",
		 			url : "emailCheck.mib",
		 			async : true,
		 			dataType : "html",
		 			data : {
		 				"email" : email
		 			},
		 			success : function(data) {
		 				//alert("success " + data);
		 				var flag = $.parseJSON(data);
		 				alert(flag.success);
		 				if(flag.success==='success'){
		 					
		 					//$("#signA").attr('data-target','#modal-email');
		 					//$("#signA").attr('href','mail.mib?sign_email='+email);
		 					cl();
		 					//return false;
		 				}else{

		 					$("#sign_email").val('');
		 					alert(flag.check); 
		 					//return false;
		 					
		 				
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