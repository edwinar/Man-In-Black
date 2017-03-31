<%@page import="com.eagle.men_in_black.model.MainDto"%>
<%@ page pageEncoding="UTF-8" %>
<%@ page contentType="text/html; charset=UTF-8" %>
<%@ page trimDirectiveWhitespaces="true" %>
<%
request.setCharacterEncoding("UTF-8");
%>
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
</head>
<body>
<%
MainDto dto = (MainDto)request.getSession().getAttribute("LoginInfo");

%>
<nav class="side-menusize" >
<img src="../images/mymenu.PNG" width="100%" height="100%" style="cursor: pointer;">
</nav>
<div class="mypage-side-menu mypage-side-menu-click">
 <span class="mypage-logo"><a href="mymain.mib">MyPage</a></span>
  <%if(dto.getUSER_ID().equals("adm")){ %>
 <ul>
    
    <li onclick="location.href='register_Good.mib'">제품등록</li>
    
    <li onclick="location.href='ceoMypage_Main.mib'">판매내역</li>
   
    <li onclick="location.href='register_MainBanner.mib'">메인 배너등록</li>
    
    <li onclick="location.href='qnA_Administer.mib'">문의게시판 관리</li>
          
    <li onclick="location.href='coupon_Administer.mib'">쿠폰관리</li>
    
    <li onclick="location.href='reiview_Administer.mib'">리뷰관리</li>
    
  </ul>
  <%}else{ %>
  <ul>
    
    <li onclick="location.href='userup.mib'">정보수정</li>
    
    <li onclick="location.href='buylist.mib'"> 구매내역</li>
   
    <li onclick="location.href='basketlist.mib'"> 장바구니</li>
    
    <li onclick="movegoods()"> 오늘본 상품</li>
      
    <li onclick="location.href='myboard.mib'"> 내가 쓴 게시물</li>
     
    <li onclick="location.href='coupon_Mileage.mib'">쿠폰 & 적립금</li>
   
  </ul>
  <%} %>
  
  
</div>

<script>
$(function() {
   //Side MENU
      var $sidebarWidth = $('.mypage-side-menu').width();
      $('.mypage-side-menu').toggleClass('active');
});

$(document).ready(function () {
   $(".side-menusize").click(function(){
	  $(".mypage-side-menu").toggleClass('mypage-side-menu-click');
   });
});

function movegoods() {


    var pro_seq = getCookie('recentitems');
    alert(pro_seq);
    pro_seq = pro_seq.substring(1);
    alert(pro_seq);
    location.href='todayGoods.mib?pro_seq='+pro_seq;
}



function getCookie(cookie_name) {
    alert("get = " + document.cookie)

    var i, x, y, z = document.cookie.split(";");

    for (i = 0; i < z.length; i++) {
        x = z[i].substr(0, z[i].indexOf("="));
        y = z[i].substr(z[i].indexOf("=") + 1);
        x = x.replace(/^s+|s+$/g, "");
        x = x + 's'
        if (x == cookie_name) {
            alert("ret = " + unescape(y))
            return unescape(y);
        }
    }
}
</script>

</body>
</html>