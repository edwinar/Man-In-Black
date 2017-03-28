<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
   <script type="text/javascript" src="http://wcs.naver.net/wcslog.js">
      
   </script>
   <form id="signinForm">
      <h1>MEN IN BLACK</h1>

      <div class="signup-container">
         <input type="submit" name="signup" id="singup" value="MIB 회원가입">
      </div>
      <div class="social-login-types">
         <div>
         <a href="#"
            onclick="Common.hcLogTrace(208, 532); Common.openWindow('https://www.happycampus.com/oAuth/auth/?authType=naver&amp;parent=main', 444, 478, 'oAuth'); return false;">
            <img alt="네이버 아이디로 로그인" src="../images/naver.png">
         </a>
         </div>
         <br>
      <div>
         <a href="#"
            onclick="Common.hcLogTrace(208, 532); Common.openWindow('https://www.happycampus.com/oAuth/auth/?authType=naver&amp;parent=main', 444, 478, 'oAuth'); return false;">
            <img alt="카카오톡 아이디로 로그인" src="../images/Kakao.png">
         </a>
      </div>
      <br>
      <div>
         <a href="#"
            onclick="Common.hcLogTrace(208, 532); Common.openWindow('https://www.happycampus.com/oAuth/auth/?authType=naver&amp;parent=main', 444, 478, 'oAuth'); return false;">
            <img alt="페이스북" src="../images/face.png">
         </a>
         </div>
      </div>
   </form>
</body>
</html>