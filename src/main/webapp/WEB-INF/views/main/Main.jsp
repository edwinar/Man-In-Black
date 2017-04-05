<%@page import="com.eagle.men_in_black.model.MainDto"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%> 
<%
	
String loginInfo = (String)request.getAttribute("LoginInfo")==null?"":(String)request.getAttribute("LoginInfo");
String insert = (String)request.getAttribute("insert")==null?"noinsert":(String)request.getAttribute("insert");
List<MainDto> list = (List<MainDto>)request.getAttribute("list");

%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<style type="text/css">
/* 베스트 상품 부분, 카테고리부분 */
.thumbnail{
 width: 100%;
}
.thumbnail{
	opacity: 1;
}
.thumbnail:hover{
	opacity: 0.5;
}
</style>
</head>
<body>
<% if(insert.equals("insert")){ %>
<script type="text/javascript"> alert("회원가입 성공!") </script>
 <%} %> 


<% if(loginInfo.equals("success")){ %>
	<script type="text/javascript"> alert("로그인성공"); </script>
<%}else if(loginInfo.equals("NotPwd")){ %>
	<script type="text/javascript"> alert("비밀번호틀림"); </script>
<%}else if(loginInfo.equals("NoMember")){ %>
	<script type="text/javascript"> alert("ID가없음"); </script>
<%}else if(loginInfo.equals("logout")){ %>
<script type="text/javascript"> alert("로그아웃"); </script>
<%} %>

<div class="main-slide-container">
  
    
<%if(list!=null){ 
	for(int i=0; i<3;i++){
%>
	<div class="main-slide">
	<div class="main-slide-content">
    <img src="../images/<%=list.get(i).getSTORED_NAME() %>" height="100%" width="100%">
    </div>
    </div>
<%}
	}%>
  
  <div class="prev" onclick="plus(-1)">&#10094;</div>
  <div class="next" onclick="plus(1)">&#10095;</div>

  <div class="main-pagers">
    <div class="main-pagers-active" onclick="current(0)"></div>
    <div onclick="current(1)"></div>
    <div onclick="current(2)"></div>
  </div>
</div>

<h1 style="font-size: 50px; font-weight: bold; " id="main-best-h1"  > OUTER </h1>
<div class="row" align="center">
  <div class="col-xs-12 col-lg-4" onclick="location.href='detail.mib'">
    <div class="thumbnail">
      <img src="../images/7960d01b40644950beb90f0486f4bcc9.jpg" alt="...">
      <div class="caption">
        <h3>창거니가 어제 입던 소매티</h3>
        <p>19000 Won</p>
      </div>
    </div>
  </div>
  <div class="col-xs-12 col-lg-4" onclick="location.href='detail.mib'">
    <div class="thumbnail">
      <img src="../images/LOVE.jpg" alt="...">
      <div class="caption">
        <h3>창거니가 어제 입던 소매티</h3>
        <p>19000 Won</p>
      </div>
    </div>
  </div>
  <div class="col-xs-12 col-lg-4" onclick="location.href='detail.mib'">
    <div class="thumbnail">
      <img src="../images/LOVE.jpg" alt="...">
      <div class="caption">
        <h3>창거니가 어제 입던 소매티</h3>
        <p>19000 Won</p>
      </div>
    </div>
  </div>
</div>

<hr style="border: solid black 2px;">

<h1 style="font-size: 50px; font-weight: bold; " > TOP </h1>
<div class="row" align="center">
  <div class="col-xs-12 col-lg-4" onclick="location.href='detail.mib'">
    <div class="thumbnail">
      <img src="../images/LOVE.jpg" alt="...">
      <div class="caption">
        <h3>창거니가 어제 입던 소매티</h3>
        <p>19000 Won</p>
      </div>
    </div>
  </div>
  <div class="col-xs-12 col-lg-4" onclick="location.href='detail.mib'">
    <div class="thumbnail">
      <img src="../images/LOVE.jpg" alt="...">
      <div class="caption">
        <h3>창거니가 어제 입던 소매티</h3>
        <p>19000 Won</p>
      </div>
    </div>
  </div>
  <div class="col-xs-12 col-lg-4" onclick="location.href='detail.mib'">
    <div class="thumbnail">
      <img src="../images/LOVE.jpg" alt="...">
      <div class="caption">
        <h3>창거니가 어제 입던 소매티</h3>
        <p>19000 Won</p>
      </div>
    </div>
  </div>
</div>

<hr style="border: solid black 2px;">

<h1 style="font-size: 50px; font-weight: bold; " > PANTS </h1>
<div class="row" align="center">
  <div class="col-xs-12 col-lg-4" onclick="location.href='detail.mib'">
    <div class="thumbnail">
      <img src="../images/LOVE.jpg" alt="...">
      <div class="caption">
        <h3>창거니가 어제 입던 소매티</h3>
        <p>19000 Won</p>
      </div>
    </div>
  </div>
  <div class="col-xs-12 col-lg-4" onclick="location.href='detail.mib'">
    <div class="thumbnail">
      <img src="../images/LOVE.jpg" alt="...">
      <div class="caption">
        <h3>창거니가 어제 입던 소매티</h3>
        <p>19000 Won</p>
      </div>
    </div>
  </div>
  <div class="col-xs-12 col-lg-4" onclick="location.href='detail.mib'">
    <div class="thumbnail">
      <img src="../images/LOVE.jpg" alt="...">
      <div class="caption">
        <h3>창거니가 어제 입던 소매티</h3>
        <p>19000 Won</p>
      </div>
    </div>
  </div>
</div>

<hr style="border: solid black 2px;">


<script type="text/javascript">
var slide = document.getElementsByClassName('main-slide'),
pager = document.querySelectorAll('.main-pagers div'),
i,
slideIndex = 0;
/* for (i = 0; i < slide.length; i = i + 1) {
slide[i].style.background = "#94" + i;
} */

//auto slide
function showSlide() {
"use strict";
for (i = 0; i < slide.length; i = i + 1) {
slide[i].style.display = "none";
pager[i].classList.remove('main-pagers-active');
}

if (slideIndex >= slide.length) {slideIndex = 0; }
slide[slideIndex].style.display = "block";
pager[slideIndex].classList.add('main-pagers-active');
slideIndex = slideIndex + 1;

}

showSlide();
setInterval(showSlide,2000);
function clickshow(n) {
"use strict";
var slide = document.getElementsByClassName('main-slide'),
  pager = document.querySelectorAll('.main-pagers div');
for (i = 0; i < slide.length; i = i + 1) {
slide[i].style.display = "none";
pager[i].classList.remove("main-pagers-active");
}
if (slideIndex >= slide.length) {slideIndex = 0; }
if (slideIndex < 0) {slideIndex = slide.length - 1; }
slide[slideIndex].style.display = "block";
pager[slideIndex].classList.add("main-pagers-active");
}

function plus(n) {
"use strict";
clickshow(slideIndex += n);
}
function current(n) {
"use strict";
clickshow(slideIndex = n);
}

</script>
</body>
</html>