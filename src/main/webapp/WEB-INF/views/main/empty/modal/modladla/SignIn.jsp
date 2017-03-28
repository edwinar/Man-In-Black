<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
<form action="loginCheck.mib" id="signinForm">
  <h1>MEN IN BLACK</h1>
  <div class="inset">
  <p style="margin-bottom: -13px; margin-top: 20px">
    <input type="text" placeholder="아이디" name="id" id="email">
  </p>
  <p>
    <input type="password" placeholder="비밀번호" name="pwd" id="pwd">
  </p>
  </div>
  <p class="signin-container">
    <input type="submit" name="go" id="go" value="로그인">
  </p>
 
</form>
 
         <div>
         <a href="#"
            onclick="Common.hcLogTrace(208, 532); Common.openWindow('https://www.happycampus.com/oAuth/auth/?authType=naver&amp;parent=main', 444, 478, 'oAuth'); return false;">
            <img alt="네이버 아이디로 로그인" src="../images/navermini.png">
         </a>
         </div>
         <br>
      <div>
         <a href="#"
            onclick="Common.hcLogTrace(208, 532); Common.openWindow('https://www.happycampus.com/oAuth/auth/?authType=naver&amp;parent=main', 444, 478, 'oAuth'); return false;">
            <img alt="카카오톡 아이디로 로그인" src="../images/kakaomini.png">
         </a>
      </div>
      <br>
      	<div>
         <a href="#"
            onclick="Common.hcLogTrace(208, 532); Common.openWindow('https://www.happycampus.com/oAuth/auth/?authType=naver&amp;parent=main', 444, 478, 'oAuth'); return false;">
            <img alt="페이스북" src="../images/facemini.png">
         </a>
        </div>
      
</body>
</html>