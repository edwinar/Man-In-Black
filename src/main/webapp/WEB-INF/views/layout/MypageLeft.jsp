<%@ page pageEncoding="UTF-8" %>
<%@ page contentType="text/html; charset=UTF-8" %>
<%@ page trimDirectiveWhitespaces="true" %>
<%
request.setCharacterEncoding("UTF-8");
%>
<%!//
//%>
<%//
//%>
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.1.1/jquery.min.js"></script>
<script>
$(function() {
   //Side MENU
      var $sidebarWidth = $('.side-menu').width();
      $('.side-menu').toggleClass('active');
});

$(document).ready(function () {
    $("li").each(function () {
        $(this).click(function () {
            $(this).addClass("active");                //클릭된 부분을 상단에 정의된 CCS인 selected클래스로 적용
            $(this).siblings().removeClass("active");  //siblings:형제요소들,removeClass:선택된 클래스의 특성을 없앰
        });
    });
});
</script>
<style>
*,
:before,
:after {
  box-sizing: border-box;
  margin: 0;
  padding: 0;
  -webkit-tap-highlight-color: transparent;
}

body {
  background: #F5F5F5;
  font-family: "Roboto", "Helvetica", "sans-serif";
}

header,
{
  display: flex;
  flex-wrap: wrap;
  width: 100%;
  min-width: 300px;
  top: 0;
  right: 0;
  will-change: width;
  transform: translateZ(0);
  transition: .3s;
}

button,
input {
  background: transparent;
  border: none;
  outline: none;
  font-family: "Roboto", "Helvetica", "sans-serif";
  -webkit-appearance: none;
}

.menu {
  width: 40px;
  height: 40px;
  border-radius: 50%;
  margin: 12px;
  transition: background-color .2s;
}

.mobile-only {
  display: none;
}

.ripple {
  overflow: hidden;
  position: relative;
  -webkit-transform: translateZ(0);
}
.ripple .rippling {
  position: absolute;
  border-radius: 50%;
  background-color: #FFF;
  pointer-events: none;
  opacity: .4;
  transform: translate3d(-50%, -50%, 0);
}

header {
  align-items: center;
  background: #FF5722;
  color: #FFF;
  position: fixed;
  z-index: 5;
}
header.shadow {
  box-shadow: 0 3px 12px rgba(0, 0, 0, 0.23), 0 3px 12px rgba(0, 0, 0, 0.16);
}

.side-menu {
  justify-content: center;
  flex-wrap: wrap;
  background: #FFF;
  height: 100%;
  width: 225px;
  position: fixed;
  top: 0;
  left: 0;
  z-index: 10;
  transform: translateX(-100%) translateZ(0);
  transition: .3s;
  overflow-y: auto;
  will-change: transform;
  -webkit-overflow-scrolling: touch;
}
.side-menu.active {
  transform: translateX(0) translateZ(0);
}
.side-menu.active ~ header .menu {
  width: 0px;
  margin: 12px 8px;
}
.side-menu .menu-holder {
  display: flex;
  align-items: center;
}
.side-menu .menu-holder span {
  color: black;
  font-weight: bold;
}

.side-menu {
  background-color: #EEE;
}
.side-menu li {
  list-style: none;
  color: #212121;
  font-size: 13px;
  font-weight: 500;
  padding: 10px 0 10px 18px;
  cursor: pointer;
  white-space: nowrap;
  line-height: 24px;
  transition: .2s;
}
.side-menu li:hover {
  background: #EEE;
}
.side-menu li.active {
  color: red;
  background: #F5F5F5;
}
/*메뉴에 나오는 글씨색 배경색등 */
.side-menu{
  display: block;
  background: #eee;
  color: #FFF;
  font-size: 16px;
  text-transform: uppercase;
 padding-left:35px;
  border-radius: 3px;
  
  margin: 150px auto;
}

@media (max-width: 1000px) {
  .side-menu.active ~ header input {
    width: calc(50vw - 100px);
  }
}
@media (max-width: 767px) {
  .side-menu.active ~ header .menu {
    margin: 12px;
    width: 40px;
  }
  .side-menu.active ~ header,
  .side-menu.active ~ main {
    width: 100% !important;
  }
  .side-menu.active ~ header input {
    width: 50vw;
  }
  .side-menu.active ~ .side-menu-overlay {
    visibility: visible;
    opacity: 1;
  }

  .card {
    flex-basis: 165px;
  }
}
@media (max-width: 599px) {
  .desktop-only {
    display: none;
  }

  .mobile-only {
    display: inherit;
  }

  .profile {
    margin: 16px !important;
  }

  header input {
    display: none;
    padding: 0px 12px;
    font: 400 16px/18px Roboto !important;
    width: calc(100vw - 130px);
  }

  .mobile-input header h1,
  .mobile-input header .menu {
    display: none;
  }
  .mobile-input input {
    display: initial;
  }
}

</style>
</head>
<body>


<div class="side-menu">
  <div class="menu-holder">
    <nav class="menu" ></nav>
   <span>MyPage</span>
  </div>
  <ul>
    <li></li>
    <li>
  	<a href="userup.mib">  
   	 정보수정
    </a>
    </li>
    <li>
    <a href="buylist.mib">  
          구매내역
    </a>
    </li>
    <li>
  	<a href="basketlist.mib">    
  	  장바구니
  	</a> 
  	</li>
    <li>
 	<a href="todayGoods.mib">    
  	  오늘본 상품
    </a>
    </li>
    <li>
 	<a href="myboard.mib">    
   	 내가 쓴 게시물
    </a>
    </li>
    <li>
  	<a href="coupon_Mileage.mib">    
         쿠폰 & 적립금
    </a>
    </li>
  </ul>
  
</div>



</body>
</html>