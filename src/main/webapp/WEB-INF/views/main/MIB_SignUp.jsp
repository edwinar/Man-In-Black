<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<script src="http://dmaps.daum.net/map_js_init/postcode.v2.js"></script>
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

#signupform label
{
display:block;
font-size:0.9em;
color:#767676;
padding:20px 0px;
width:100px;
float:left;
font-weight:bold;
}

#signupform input
{
border:none;
padding:20px 0px;
background:transparent;
width:230px;
font-size:0.9em;
}


#signupform button[type=submit]
{
background:#fff;
text-align:center;
width:100%;
border-radius:5px;
font-size:1.2em;
color:black;
margin-top:10px;
cursor:pointer;
-webkit-transition:0.5s ease;-moz-transition:0.5s ease;transition:0.5s ease;
height: 50px;
}
#signupform button{
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
#signupform button:hover{
background:black;
color:white;
-webkit-transition:0.5s ease;-moz-transition:0.5s ease;transition:0.5s ease;}
</style>
</head>
<body>
<script type="text/javascript">

$(document).ready(function() {
	$("#emailBtn").click(function(){
    	
	var email = $("#email").val();
	$("#signA").attr('href','mail.mib?email='+email);
        	
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
            	document.getElementById('roadAddressdiv').innerHTML = '<label>도로명주소</label><input type="text" placeholder="RoadADDRESS" id="roadAddress" name="roadAddress"/>';
                document.getElementById('roadAddress').value = fullRoadAddr;
                document.getElementById('detailAddressdiv').innerHTML = '<label>나머지주소</label><input type="text" placeholder="ADDRESS" id="detailAddress" name="detailAddress"/>';
               
            }
            if(data.jibunAddress!=null&&data.jibunAddress!=""){
          
            document.getElementById('roadAddressdiv').innerHTML ='';
            document.getElementById('jibunAddressdiv').innerHTML = '<label>지번주소</label><input type="text" placeholder="ADDRESS" id="jibunAddress" name="jibunAddress"/>';
            document.getElementById('jibunAddress').value = data.jibunAddress;
            document.getElementById('detailAddressdiv').innerHTML = '<label>나머지주소</label><input type="text" placeholder="ADDRESS" id="detailAddress" name="detailAddress"/>';
            }
            // 사용자가 '선택 안함'을 클릭한 경우, 예상 주소라는 표시를 해준다.
            if(data.autoRoadAddress) {
                //예상되는 도로명 주소에 조합형 주소를 추가한다.
                var expRoadAddr = data.autoRoadAddress + extraRoadAddr;
                document.getElementById('guide').innerHTML = '(예상 도로명 주소 : ' + expRoadAddr + ')';

            } else if(data.autoJibunAddress) {
                var expJibunAddr = data.autoJibunAddress;
                document.getElementById('guide').innerHTML = '(예상 지번 주소 : ' + expJibunAddr + ')';

            } else {
                document.getElementById('guide').innerHTML = '';
            }
        }

    }).open();
}
</script>
<form id="signupform" action="mail.mib">
<div id="signupdiv">
<h1 id="Registration">회원 가입</h1>
<div id="inputlbl">
<div class="inputsnlables"><label>EMAIL</label><input type="email" placeholder="EMAIL" name="email" id="email" /> 
<a href="" id="signA" data-toggle="modal" data-target="#modal-email">
<button type="button" id="emailBtn" name="emailBtn">EMAIL인증</button></div> 
</a>
<div class="inputsnlables"><label>ID</label><input type="text" placeholder="ID" /></div>
<div class="inputsnlables"><label>PassWord</label><input type="password" placeholder="PassWord" id="password" name="password"/></div>
<div class="inputsnlables"><label>PassWord</label><input type="password" placeholder="Confirm PassWord" /></div>
<div class="inputsnlables"><label>Name</label><input type="text" placeholder="Name" id="name" name="name"/></div>
<div class="inputsnlables"><label>TEL</label><input type="text" placeholder="TEL" id="tel" name="tel" /></div>
<div class="inputsnlables"><label>POSTCODE</label><input type="text" placeholder="POSTCODE" id="postcode" name="postcode" />
<button onclick="Postcode()" type="button">우편번호 찾기</button></div>
<div class="inputsnlables" id="roadAddressdiv"></div>
<div class="inputsnlables" id="jibunAddressdiv"></div>
<div class="inputsnlables" id="detailAddressdiv"></div>
<div class="inputsnlables"><label>SEX</label><input type="text" placeholder="SEX" /></div>
<div class="inputsnlables"><label>BIRTH</label><input type="text" placeholder="19900411" /></div>

</div>
<button type="submit">회원가입하기</button>
</div>
</form>
</body>
</html>