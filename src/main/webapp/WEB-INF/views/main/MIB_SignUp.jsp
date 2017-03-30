<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
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
<form id="signupform">
<div id="signupdiv">
<h1 id="Registration">회원 가입</h1>
<div id="inputlbl">
<div class="inputsnlables"><label>EMAIL</label><input type="email" placeholder="EMAIL" /> 
<a href="mail.mib" data-toggle="modal" data-target="#modal-email">
<button type="button">EMAIL인증</button></div> 
</a>
<div class="inputsnlables"><label>ID</label><input type="text" placeholder="ID" /></div>
<div class="inputsnlables"><label>PassWord</label><input type="password" placeholder="PassWord" /></div>
<div class="inputsnlables"><label>PassWord</label><input type="password" placeholder="Confirm PassWord" /></div>
<div class="inputsnlables"><label>Name</label><input type="text" placeholder="Name" /></div>
<div class="inputsnlables"><label>TEL</label><input type="text" placeholder="TEL" /></div>
<div class="inputsnlables"><label>POSTCODE</label><input type="text" placeholder="POSTCODE" /></div>
<div class="inputsnlables"><label>ADDRESS</label><input type="text" placeholder="ADDRESS" /></div>
<div class="inputsnlables"><label>SEX</label><input type="text" placeholder="SEX" /></div>
<div class="inputsnlables"><label>BIRTH</label><input type="text" placeholder="19900411" /></div>

</div>
<button type="submit">회원가입하기</button>
</div>
</form>
</body>
</html>