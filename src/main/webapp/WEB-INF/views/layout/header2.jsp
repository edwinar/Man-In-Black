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
</script>
<style>

/* General Styles for Menu  */
.menuBackground {
	background: yellow;
	text-align: center;
	height: 81px;
	top: 0;
	position: fixed;
	width: 100%;
	z-index: 100;
}
.dropDownMenu,
.cate {
	list-style: none;
	margin: 0;
	padding: 0;
	margin-top: 10px;
}
.cate {
	width: 130px;
	position: relative;
	background-color: green;
	margin-left: 15px;
	margin-right: 15px;
}
/*a링크들 글자색 */
.cateA {
	padding: 10px 20px;
	display: block;
	text-decoration: none;
	color: red;
}

.cateA:hover {
	background: #000;
	text-decoration: none;
}

.subA{
	padding : 10px 25px 5px 0;
}

.subA:hover{
	background: black;
	color: white;
	text-decoration: none;
}


/* Level 1 Drop Down */
/* 카테고리 부분  */
.cate {
	margin-top:15px;
	display: inline-block;
	vertical-align: top;
	margin-left: 20px; 
	
	/* solve the 4 pixels spacing between list-items */
}
/* NEW 아이템 부분 */
.dropDownMenu > li:first-child {
	margin-top:15px;
	margin-left: 20px;
}

/* Level 2 */
.dropDownMenu ul {
	box-shadow: 2px 2px 15px 0 rgba(0,0,0, 0.5);
}
/*서브메뉴*/
.dropDownMenu > li > ul {
	
	display: none;
	/* background:transparent; */
	position: absolute;
	top:100%;
	z-index: 999999; /* if you have YouTube iframes, is good to have a bigger z-index so the video can appear above the video */
	padding-top: 0px; 
	margin-top: 0px; 
	padding-bottom: 0px; 
	margin-bottom: 0px;
	background-color: olive;
	list-style: none;
	width: 150px;	
	height: 200px;
}



</style>
</head>
<body>

<div class="menuBackground">
<div style="text-align: right; width: 100%; background-color: blue;"> 
	<div style="background-color: navy; float: right;">
		<div style="background-color: fuchsia; margin-right: 50px; float: left;">
			<li style="list-style: none; " ><a href="login.mib" data-toggle="modal" data-target="#modal-login">로그인</a></li> 
		</div>
		<div style="float: left; background-color: cyan; margin-right: 80px;">
			<li style="list-style: none;"><a href="mymain.mib">회원가입</a></li>
		</div>
	</div>
</div>
<div style="width: 150px; height: 80px; float: left; background-color: purple;" >
<img alt="" src="../images/zu.jpg" style="float: left; margin-left: 20px;" width="100%" height="100%">
</div>
<div class="center myMenu">
<nav>

<ul class="dropDownMenu">
			<li class="cate"><a href="#" class="cateA">NEW</a></li>
			<li class="cate"><a href="#" class="cateA">OUTER</a>
				<ul style="">
					<li class="sub"><a href="#" class="subA">HTML</a></li>
					<li class="sub"><a href="#" class="subA">CSS</a></li>
					<li class="sub"><a href="#" class="subA">JS</a></li>
				</ul>
			</li>
			<li class="cate"><a href="#" class="cateA">TOP</a>
				<ul style="display: none; ">
					<li class="sub"><a href="#" class="subA">C++</a></li>
					<li class="sub"><a href="#" class="subA">WordPress</a>
					</li>
					<li class="sub"><a href="#" class="subA">PHP</a></li>
					<li class="sub"><a href="#" class="subA">jQuery</a></li>
				</ul>
			</li>
			<li class="cate"><a href="#" class="cateA">PANTS</a>
				<ul>
					<li class="sub"><a href="#" class="subA">Icons</a></li>
					<li class="sub"><a href="#" class="subA">Fonts</a></li>
					<li class="sub"><a href="#" class="subA">Wallpapers</a></li>
				</ul>
			</li>
			<li class="cate"><a href="#" class="cateA">SHOES</a></li>
			
			<li class="cate"><a href="#" class="cateA">BAG&ACC</a></li>
			
		</ul>
	</nav>
		
	</div>
</div>

	<!-- Modal Login -->
	<div class="modal fade bs-example-modal-sm" id="modal-login"
		tabindex="-1" role="dialog" aria-labelledby="myModalLabel"
		aria-hidden="true">
		<div class="modal-dialog modal-sm">
			<div class="modal-content"></div>
			<!-- /.modal-content -->
		</div>
		<!-- /.modal-dialog -->
	</div>
	<!-- /.modal -->

	<!-- Modal signup -->
	<div class="modal fade bs-example-modal-sm" id="modal-signup"
		tabindex="-1" role="dialog" aria-labelledby="myModalLabel"
		aria-hidden="true">
		<div class="modal-dialog modal-sm">
			<div class="modal-content"></div>
			<!-- /.modal-content -->
		</div>
		<!-- /.modal-dialog -->
	</div>
	<!-- /.modal -->

	<!-- Modal signup -->
	<div class="modal fade bs-example-modal-sm" id="modal-email"
		tabindex="-1" role="dialog" aria-labelledby="myModalLabel"
		aria-hidden="true">
		<div class="modal-dialog modal-sm">
			<div class="modal-content"></div>
			<!-- /.modal-content -->
		</div>
		<!-- /.modal-dialog -->
	</div>
	<!-- /.modal -->


<script type="text/javascript">
$(document).ready(function() {
    $('nav .dropDownMenu li').hover(function() {
       $(this).children('ul').addClass('fadeInUp animated ').css({'display' : 'block'});
    },function() {
       $(this).children('ul').removeClass('fadeInUp animated ').css({'display' : 'none'});
			
    });
}); 
</script>
</body>
</html>