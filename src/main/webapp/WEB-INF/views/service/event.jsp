<%@page import="com.eagle.men_in_black.model.MainDto"%>
<%@page import="com.eagle.men_in_black.model.ServiceDto"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%
	MainDto dto = (MainDto) request.getSession().getAttribute("LoginInfo");
	List<ServiceDto> eventlist = (List<ServiceDto>) request.getAttribute("eventlist");
%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<style type="text/css">
*, *:before, *:after {
	-moz-box-sizing: border-box;
	-webkit-box-sizing: border-box;
	box-sizing: border-box;
}

body {
	background: #333;
	font-family: 'Georgia', sans-serif;
}

h1 {
	position: absolute;
	top: 150px;
	left: -125px;
	font-size: 1.25em;
	color: #fff;
	-webkit-transform: rotate(-90deg);
	-moz-transform: rotate(-90deg);
	-ms-transform: rotate(-90deg);
	-o-transform: rotate(-90deg);
	transform: rotate(-90deg);
}

/* REUSABLE CSS3 "PLUGIN" CODE IF YOU WILL */
.cards * {
	width: 100%;
}

.cards__axis {
	position: relative;
}

.cards__axis:before {
	content: "";
	display: block;
	padding-top: 100%;
}

.cards__front, .cards__back {
	position: absolute;
	top: 0;
	left: 0;
	bottom: 0;
	right: 0;
	margin: 0;
	-webkit-transition: 0.5s ease-in-out;
	-moz-transition: 0.5s ease-in-out;
	-ms-transition: 0.5s ease-in-out;
	-o-transition: 0.5s ease-in-out;
	transition: 0.5s ease-in-out;
}

.cards__front {
	-webkit-backface-visibility: hidden;
	-moz-backface-visibility: hidden;
	-ms-backface-visibility: hidden;
	-o-backface-visibility: hidden;
	backface-visibility: hidden;
	-webkit-transform: perspective(1000px) rotateX(40deg) rotateY(0deg);
	-moz-transform: perspective(1000px) rotateX(40deg) rotateY(0deg);
	-ms-transform: perspective(1000px) rotateX(40deg) rotateY(0deg);
	-o-transform: perspective(1000px) rotateX(40deg) rotateY(0deg);
	transform: perspective(1000px) rotateX(40deg) rotateY(0deg);
}

.cards__axis:hover .cards__front {
	-webkit-transform: perspective(1000px) rotateX(0deg) rotateY(-180deg);
	-moz-transform: perspective(1000px) rotateX(0deg) rotateY(-180deg);
	-ms-transform: perspective(1000px) rotateX(0deg) rotateY(-180deg);
	-o-transform: perspective(1000px) rotateX(0deg) rotateY(-180deg);
	transform: perspective(1000px) rotateX(0deg) rotateY(-180deg);
}

.cards__back {
	-webkit-backface-visibility: hidden;
	-moz-backface-visibility: hidden;
	-ms-backface-visibility: hidden;
	-o-backface-visibility: hidden;
	backface-visibility: hidden;
	-webkit-transform: perspective(1000px) rotateY(180deg);
	-moz-transform: perspective(1000px) rotateY(180deg);
	-ms-transform: perspective(1000px) rotateY(180deg);
	-o-transform: perspective(1000px) rotateY(180deg);
	transform: perspective(1000px) rotateY(180deg);
}

.cards__axis:hover .cards__back {
	-webkit-transform: perspective(1000px) rotateY(0);
	-moz-transform: perspective(1000px) rotateY(0);
	-ms-transform: perspective(1000px) rotateY(0);
	-o-transform: perspective(1000px) rotateY(0);
	transform: perspective(1000px) rotateY(0);
}

/* CUSTOM STYLES FOR THIS UNORDERED LIST */
.cards {
	width: 100%;
	margin: 0 0%;
}

.cards {
	list-style-type: none;
	padding-left: none;
}

.cards:after {
	content: "";
	display: table;
	clear: both;
}

.cards__axis {
	float: left;
	margin-left: 2.5%;
	width: 20%;
}

.cards__axis img {
	border: 1px solid #fff;
	border-bottom-width: 45px;
	box-shadow: 5px 5px 15px #000;
}
/* CONTENT STYLES */
.cards__description--front {
	position: absolute;
	bottom: -45px;
	width: 100%;
	text-align: center;
}

.cards__description--front {
	font-size: 1.5em;
}

.cards__description--back {
	position: absolute;
	top: 0;
	left: 0;
	width: 100%;
	height: 100%;
	background: rgba(255, 255, 255, 0.9);
}

.cards__description--back p {
	position: relative;
	width: 100%;
	top: 20%;
	margin-top: -1em;
	text-align: center;
	font-size: 2em;
	font-family: 'Impact', sans-serif;
	color: #000000;
}
</style>
</head>
<body>
	<center>
		<div id="noticehead">
			<h4 align="right" style="margin-right: 100px">
				<a href="meninblack.mib">홈</a> > <a href="event.mib">이벤트</a>
			</h4>
			<h3>고객센터</h3>
			<h4>MIB 이벤트입니다</h4>
		</div>
	</center>
	<h3>EVENT</h3>

	<!-- CEO 글쓰기 버튼  -->
	<%
		if (dto != null) {
			if (dto.getUSER_ID().equals("adm")) {
	%>
	<p align="right">
		<a class="btn btn-primary" href="CkeditorNoticeUpload.mib"
			role="button">이벤트등록</a>
	</p>
	<%
		}
		}
	%>


	<div>
		<%
			for(int i=0; i<eventlist.size(); i++){
		%>
		
		<ul class="cards">
			<li class="cards__axis"><figure class="cards__front"> <img
					src="../images/event1.jpg" alt="" /> <figcaption
					class="cards__description--front">
				<p><%=eventlist.get(i).getEVENT_TITLE() %></p>
				</figcaption> </figure> <figure class="cards__back"> <img
					src="//placebear.com/g/300/300" alt="" /> <figcaption
					class="cards__description--back">
				<p><%=eventlist.get(i).getEVENT_CONTENT() %></p>
				</figcaption> </figure></li>
		</ul>
	<%
			}
	%>

	</div>
	<br>
	<br>
 	
 	<%-- 
 	<%
		// 페이징 및 날짜 선택 
		String PAGE_NUM = (request.getParameter("PAGE_NUM") == null || request.getParameter("PAGE_NUM") == "") ? "1"
				: request.getParameter("PAGE_NUM");
		String PAGE_SIZE = (request.getParameter("PAGE_SIZE") == null || request.getParameter("PAGE_SIZE") == "")
				? "10" : request.getParameter("PAGE_SIZE");

		int page_num = Integer.parseInt(PAGE_NUM);
		int page_size = Integer.parseInt(PAGE_SIZE);

		int pageCount = (eventlist.get(0).getTOT_CNT() % page_size) == 0
				? eventlist.get(0).getTOT_CNT() / page_size : (eventlist.get(0).getTOT_CNT() / page_size) + 1;
	%>

		<div class="row" align="center">
		<p>
			<%
				for (int i = 1; i <= pageCount; i++) {
			%>
			<a href="event.mib?PAGE_NUM=<%=i%>" class="btn btn-default"
				role="button"><%=i%></a>
			<%
				}
			%>
		</p>
	</div>  --%>
	

</body>
</html>