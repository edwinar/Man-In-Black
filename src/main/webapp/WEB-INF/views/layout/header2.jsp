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
	height: 70px;
	margin-top: -100px;
}
.dropDownMenu,
.dropDownMenu ul {
	list-style: none;
	margin: 0;
	padding: 0;
}
.dropDownMenu li {
	position: relative;
}
/*a링크들 글자색 */
.dropDownMenu a {
	padding: 10px 20px;
	display: block;
	text-decoration: none;
	color: red;
}
.dropDownMenu a:hover {
	background: #000;
}


/* Level 1 Drop Down */
/* 카테고리 부분  */
.dropDownMenu > li {
	margin-top:15px;
	display: inline-block;
	vertical-align: top;
	margin-left: 20px; /* solve the 4 pixels spacing between list-items */
}
/* NEW 아이템 부분 */
.dropDownMenu > li:first-child {
	margin-top:15px;
	margin-left: 250px;
}

/* Level 2 */
.dropDownMenu ul {
	box-shadow: 2px 2px 15px 0 rgba(0,0,0, 0.5);
}
.dropDownMenu > li > ul {
	text-align: left;
	display: none;
	background:transparent;
	position: absolute;
	top: 100%;
	left: 0;
	width: 240px;
	z-index: 999999; /* if you have YouTube iframes, is good to have a bigger z-index so the video can appear above the video */
}

/* Level 3 */
.dropDownMenu > li > ul > li > ul {
	text-align: left;
	display: none;
	background: darkcyan;
	position: absolute;
	left: 100%;
	top: 0;
	z-index: 9999999;
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
	<div class="center myMenu">
<nav>
<ul class="dropDownMenu">
			<li><a href="#">NEW</a></li>
			<li><a href="#">OUTER</a>
				<ul style="display: none;">
					<li><a href="#">HTML</a></li>
					<li><a href="#">CSS</a></li>
					<li><a href="#">JS</a></li>
				</ul>
			</li>
			<li><a href="#">TOP</a>
				<ul style="display: none; height: 164px; padding-top: 0px; margin-top: 0px; padding-bottom: 0px; margin-bottom: 0px;">
					<li><a href="#">C++</a></li>
					<li><a href="#">WordPress</a>
						<ul>
							<li><a href="#">Hacks</a></li>
							<li><a href="#">Plugins</a></li>
							<li><a href="#">Shortcodes</a></li>
						</ul>
					</li>
					<li><a href="#">PHP</a></li>
					<li><a href="#">jQuery</a></li>
				</ul>
			</li>
			<li><a href="#">PANTS</a>
				<ul>
					<li><a href="#">Icons</a></li>
					<li><a href="#">Fonts</a></li>
					<li><a href="#">Wallpapers</a></li>
				</ul>
			</li>
			<li><a href="#">SHOES</a></li>
			
			<li><a href="#">BAG&ACC</a></li>
			
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