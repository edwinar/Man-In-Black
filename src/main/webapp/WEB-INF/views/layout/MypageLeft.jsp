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
<div class="mypage-side-menu wrap">
 <span class="mypage-logo">MyPage</span>
  <%if(dto.getUSER_ID().equals("adm")){ %>
 <ul>
    
    <li onclick="location.href='userup.mib'">제품등록</li>
    
    <li onclick="location.href='buylist.mib'">판매내역</li>
   
    <li onclick="location.href='basketlist.mib'">메인 배너등록</li>
    
    <li onclick="location.href='todayGoods.mib'">문의게시판 관리</li>
      
    <li onclick="location.href='myboard.mib'">공지글 작성</li>
     
    <li onclick="location.href='coupon_Mileage.mib'">쿠폰관리</li>
    
    <li onclick="location.href='coupon_Mileage.mib'">리뷰관리</li>
   
  </ul>
  <%}else{ %>
  <ul>
    
    <li onclick="location.href='userup.mib'">정보수정</li>
    
    <li onclick="location.href='buylist.mib'"> 구매내역</li>
   
    <li onclick="location.href='basketlist.mib'"> 장바구니</li>
    
    <li onclick="location.href='todayGoods.mib'"> 오늘본 상품</li>
      
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
/* 
$(document).ready(function () {
    $("li").each(function () {
        $(this).click(function () {        	
            $(this).addClass("active");                //클릭된 부분을 상단에 정의된 CCS인 selected클래스로 적용
            $(this).siblings().removeClass("active");  //siblings:형제요소들,removeClass:선택된 클래스의 특성을 없앰
        });
    });
}); */
</script>

</body>
</html>