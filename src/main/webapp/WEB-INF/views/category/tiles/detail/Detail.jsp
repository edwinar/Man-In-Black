<%@page import="java.util.List"%>
<%@page import="com.eagle.men_in_black.model.DetailDto"%>
<%@page import="com.eagle.men_in_black.model.MainDto"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	MainDto dto = (MainDto)request.getSession().getAttribute("LoginInfo");
	int PRO_SEQ = Integer.parseInt(request.getParameter("PRO_SEQ"));
	List<DetailDto> list = (List<DetailDto>)request.getAttribute("list");
	List<DetailDto> listColor = (List<DetailDto>)request.getAttribute("listColor");
	List<DetailDto> listSize = (List<DetailDto>)request.getAttribute("listSize");
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>:::Detail:::</title>
<style type="text/css">
#outerH1{
margin-top: 150px;
}
.productExplain{
  margin-top : 130px;
  position: relative;
  width: 40%;
  height: 700px;
  float: right;
}
.slide-container{
  margin-top : 130px;
  position: relative;
  width: 60%;
  height: 700px;
  float: left;
}
.sub-slide{
	float: left;
	width: 30%;
	height: 95%;
	border-top: double gray 0.1px;
	border-left: double gray 0.1px;
}
.sub-photo{
	width: 100%;
	height: 33.333333333333333%;
	opacity: 1;
	border-bottom: double gray 0.1px;
}
.sub-photo:hover{
	opacity: 0.5;
}
.slide{
  width: 70%;
  height: 95%;
  float: right;
  border: double gray 0.1px;
}

.content, .content1, .content2, .content3{
	width: 100%;
	height: 100%;
}

/*작아졌을때*/
@media (max-width: 80em){
#outerH1{
margin-top: 150px;
}
.productExplain{
  margin:auto;
  position: relative;
  width: 100%;
  height: 600px;
  float: none;
}
.slide-container{
  position: relative;
  width: 100%;
  height: 200px;
  margin: auto;
  float: none;
}
.sub-slide{
	/* float: none; */
	width: auto;
	height: auto;
}
.sub-photo{
	width: auto;
	height: 50;
	opacity: 1;
	border: double gray 0.1px;
	float: none;
}
.slide{
  width: auto;
  height: auto;
}

}

/* 베스트 상품 부분 스타일*/
.thumbnail{
 width: 90%;
 height: 100%;
 float: right;
}
/* /////////////////////////////상세/리뷰/Q&A/////////////////////////// */
/* .tab__content{
	width: 100%;
	text-align: center;
} */
.tab-wrap {
  -webkit-transition: 0.3s box-shadow ease;
  transition: 0.3s box-shadow ease;
  border-radius: 6px;
  max-width: 100%;
  display: -webkit-box;
  display: -ms-flexbox;
  display: flex;
  -ms-flex-wrap: wrap;
      flex-wrap: wrap;
  position: relative;
  list-style: none;
  background-color: #fff;
  margin: 40px 0;
  box-shadow: 0 1px 3px rgba(0, 0, 0, 0.12), 0 1px 2px rgba(0, 0, 0, 0.24);
  width: 100%
}
.tab-wrap:hover {
  box-shadow: 0 12px 23px rgba(0, 0, 0, 0.23), 0 10px 10px rgba(0, 0, 0, 0.19);
}

.tab {
  display: none;
}
.tab:checked:nth-of-type(1) ~ .tab__content:nth-of-type(1) {
  opacity: 1;
  -webkit-transition: 0.5s opacity ease-in, 0.8s -webkit-transform ease;
  transition: 0.5s opacity ease-in, 0.8s -webkit-transform ease;
  transition: 0.5s opacity ease-in, 0.8s transform ease;
  transition: 0.5s opacity ease-in, 0.8s transform ease, 0.8s -webkit-transform ease;
  position: relative;
  top: 0;
  z-index: 100;
  -webkit-transform: translateY(0px);
          transform: translateY(0px);
  text-shadow: 0 0 0;
}
.tab:checked:nth-of-type(2) ~ .tab__content:nth-of-type(2) {
  opacity: 1;
  -webkit-transition: 0.5s opacity ease-in, 0.8s -webkit-transform ease;
  transition: 0.5s opacity ease-in, 0.8s -webkit-transform ease;
  transition: 0.5s opacity ease-in, 0.8s transform ease;
  transition: 0.5s opacity ease-in, 0.8s transform ease, 0.8s -webkit-transform ease;
  position: relative;
  top: 0;
  z-index: 100;
  -webkit-transform: translateY(0px);
          transform: translateY(0px);
  text-shadow: 0 0 0;
}
.tab:checked:nth-of-type(3) ~ .tab__content:nth-of-type(3) {
  opacity: 1;
  -webkit-transition: 0.5s opacity ease-in, 0.8s -webkit-transform ease;
  transition: 0.5s opacity ease-in, 0.8s -webkit-transform ease;
  transition: 0.5s opacity ease-in, 0.8s transform ease;
  transition: 0.5s opacity ease-in, 0.8s transform ease, 0.8s -webkit-transform ease;
  position: relative;
  top: 0;
  z-index: 100;
  -webkit-transform: translateY(0px);
          transform: translateY(0px);
  text-shadow: 0 0 0;
}
.tab:checked:nth-of-type(4) ~ .tab__content:nth-of-type(4) {
  opacity: 1;
  -webkit-transition: 0.5s opacity ease-in, 0.8s -webkit-transform ease;
  transition: 0.5s opacity ease-in, 0.8s -webkit-transform ease;
  transition: 0.5s opacity ease-in, 0.8s transform ease;
  transition: 0.5s opacity ease-in, 0.8s transform ease, 0.8s -webkit-transform ease;
  position: relative;
  top: 0;
  z-index: 100;
  -webkit-transform: translateY(0px);
          transform: translateY(0px);
  text-shadow: 0 0 0;
}
.tab:checked:nth-of-type(5) ~ .tab__content:nth-of-type(5) {
  opacity: 1;
  -webkit-transition: 0.5s opacity ease-in, 0.8s -webkit-transform ease;
  transition: 0.5s opacity ease-in, 0.8s -webkit-transform ease;
  transition: 0.5s opacity ease-in, 0.8s transform ease;
  transition: 0.5s opacity ease-in, 0.8s transform ease, 0.8s -webkit-transform ease;
  position: relative;
  top: 0;
  z-index: 100;
  -webkit-transform: translateY(0px);
          transform: translateY(0px);
  text-shadow: 0 0 0;
}
.tab:first-of-type:not(:last-of-type) + label {
  border-top-right-radius: 0;
  border-bottom-right-radius: 0;
}
.tab:not(:first-of-type):not(:last-of-type) + label {
  border-radius: 0;
}
.tab:last-of-type:not(:first-of-type) + label {
  border-top-left-radius: 0;
  border-bottom-left-radius: 0;
}
.tab:checked + label {
  background-color: #fff;
  box-shadow: 0 -1px 0 #fff inset;
  cursor: default;
}
.tab:checked + label:hover {
  box-shadow: 0 -1px 0 #fff inset;
  background-color: #fff;
}
.tab + label {
  box-shadow: 0 -1px 0 #eee inset;
  border-radius: 6px 6px 0 0;
  cursor: pointer;
  display: block;
  text-decoration: none;
  color: #333;
  -webkit-box-flex: 3;
      -ms-flex-positive: 3;
          flex-grow: 3;
  text-align: center;
  background-color: #f2f2f2;
  -webkit-user-select: none;
     -moz-user-select: none;
      -ms-user-select: none;
          user-select: none;
  text-align: center;
  -webkit-transition: 0.3s background-color ease, 0.3s box-shadow ease;
  transition: 0.3s background-color ease, 0.3s box-shadow ease;
  height: 50px;
  box-sizing: border-box;
  padding: 15px;
}
.tab + label:hover {
  background-color: #f9f9f9;
  box-shadow: 0 1px 0 #f4f4f4 inset;
}
.tab__content {
  padding: 10px 25px;
  background-color: transparent;
  position: absolute;
  width: 100%;
  z-index: -1;
  opacity: 0;
  left: 0;
  -webkit-transform: translateY(-3px);
          transform: translateY(-3px);
  border-radius: 6px;
}

/*이게 전체 크기 */
/* .container {
  margin: 0 auto;
  display: block;
  max-width: 1920px;
} */
.container > *:not(.tab-wrap) {
  padding: 0 80px;
}
a{
   color: black;
   cursor: pointer;
   text-decoration: none;
}
a:hover{
   text-decoration: underline;
}
table td{
  text-align: center;
}
td.organisationname{
	text-align: left;
}
td.actions{
	text-align: left;
}
table.layout{
  width: 100%;
  border-collapse: collapse;
}
table.display{
  margin: 1em 0;
}
table.display th,
table.display td{
  border-bottom: 1px solid #B3BFAA;
  padding: .5em 1em;
}

/* 클때 th,td색상 */
table.display th{ background: #D5E0CC; }
table.display td{ background: #fff; }

table.responsive-table{
  box-shadow: 0 1px 10px rgba(0, 0, 0, 0.2);
}

@media (max-width: 80em){
    table.responsive-table{
      box-shadow: none;  
    }
    table.responsive-table thead{
      display: none; 
    }
  table.display th,
  table.display td{
    padding: .5em;
  }
    
  .imgr{
     margin-top: 50px;
     width: 30%;
     height: 40%;
     
  } 
  .star{
  width: 6%;
  }
  
  table.responsive-table td:nth-child(1){
     text-align: center;
     
  }
  
  table.responsive-table td:nth-child(1):before,
  table.responsive-table td:nth-child(2):before,
  table.responsive-table td:nth-child(3):before{
    position: absolute;
    left: .5em;
    font-weight: bold;
  }
  
    table.responsive-table tr,
    table.responsive-table td{
        display: block;
    }
    table.responsive-table tr{
        position: relative;
        margin-bottom: 1em;
    box-shadow: 0 1px 10px rgba(0, 0, 0, 0.2);
    }
    table.responsive-table td{
        border-top: none;
    }
    /* 작아졌을때 색상  */
    table.responsive-table th.organisationnumber{
        background: #D5E0CC;
        border-top: 1px solid #B3BFAA;
    }
    table.responsive-table td.actions{
        position: absolute;
        top: 0;
        right: 0;
        border: none;
        background: none;
    }
}

@media (max-width: 30em){
    table.responsive-table{
      box-shadow: none;  
    }
    table.responsive-table thead{
      display: none; 
    }
  table.display th,
  table.display td{
    padding: .5em;
  }
    
  .imgr{
     margin-top: 50px;
     width: 50%;
     
  } 
  .star{
  width: 10%;
  }
  
  table.responsive-table td:nth-child(1){
     text-align: center;
     
  }
  
  table.responsive-table td:nth-child(1):before,
  table.responsive-table td:nth-child(2):before,
  table.responsive-table td:nth-child(3):before{
    position: absolute;
    left: .5em;
    font-weight: bold;
  }
  
    table.responsive-table tr,
    table.responsive-table td{
        display: block;
    }
    table.responsive-table tr{
        position: relative;
        margin-bottom: 1em;
    box-shadow: 0 1px 10px rgba(0, 0, 0, 0.2);
    }
    table.responsive-table td{
        border-top: none;
    }
    /* 작아졌을때 색상  */
    table.responsive-table th.organisationnumber{
        background: #D5E0CC;
        border-top: 1px solid #B3BFAA;
    }
    table.responsive-table td.actions{
        position: absolute;
        top: 0;
        right: 0;
        border: none;
        background: none;
    }
}
</style>
</head>
<body>
<script type="text/javascript">
$(document).ready(function () {
    $('.content1').hover(function () {
        $('#mainImage').attr("src", "../images/aa.jpg");
    });
    $('.content2').hover(function () {
        $('#mainImage').attr("src", "../images/dd.jpg");
    });
    $('.content3').hover(function () {
        $('#mainImage').attr("src", "../images/ss.jpg");
    });
});
function popup(){
	window.open("review.mib","pop","width=820 height=420 resizable=no location=no screenX=400 screenY=300 scrollbars=no");
}
function QnADetail(){
	window.open("QnADetail.mib","pop","width=820 height=420 resizable=no location=no screenX=400 screenY=300 scrollbars=no");
}
function QnAWrite(){
	window.open("QnAWrite.mib","pop","width=820 height=420 resizable=no location=no screenX=400 screenY=300 scrollbars=no");
}
</script>
<div>
<div>
	<div class="slide-container">
		<div class="sub-slide visible-lg">
			<div class="sub-photo">
				<div class="content1">
		    		<img src="../images/aa.jpg" height="100%" width="100%">
		    	</div>
			</div>
			<div class="sub-photo">
				<div class="content2">
		    		<img src="../images/dd.jpg" height="100%" width="100%">
		    	</div>
			</div>
			<div class="sub-photo">
				<div class="content3">
		    		<img src="../images/ss.jpg" height="100%" width="100%">
		    	</div>
			</div>
		</div>
	  	<div class="slide">
		    <div class="content">
		    	<img src="../images/aa.jpg" height="100%" width="100%" id="mainImage">
		    </div>
	  	</div>	
	</div>

	<div class="productExplain" align="center">
		<div class="" >
		    <div class="thumbnail">
		      <!-- <img src="../images/LOVE.jpg" alt="..."> -->
		      <div class="caption">
		      	<div class="productName" style="height: 20%;">
					<h2><b><%=list.get(0).getPRO_NAME() %></b></h2>
				</div>
				<div class="productDeail" style="width: 80%; height: 80%;" align="left">
			        <h4><%=list.get(0).getPRO_CONTENT() %></h4>
			        <hr style="width: 100%;border: solid black 1px;">
			        <p><h3 align="center">판매가</h3></p>
			        <p><h4 align="center"><%=list.get(0).getPRO_PRICE() %> Won</h4></p>
			        <br/>
		        	<p><ul>
		        	<li><h4>모델체형 : <%=list.get(0).getBODYTYPE() %></h4></li>
		        	<li><h4>색상 : 
		        	<%
		        		for(int i=0; i<listColor.size();i++){
		        	%>
		        		<%=listColor.get(i).getCOLOR() %>
		        	<%
		        			if(i!=listColor.size()-1){
		        	%>
		        		/
		        	<%
		        			}
		        		}
		        	%>
		        	</h4></li>
		        	<li><h4>사이즈 : 
		        	<%
		        		for(int i=0; i<listSize.size();i++){
		        	%>
		        		<%=listSize.get(i).getPRO_SIZE() %>
		        	<%
		        			if(i!=listSize.size()-1){
		        	%>
		        		/
		        	<%
		        			}
		        		}
		        	%>
		        	</h4></li>
		        	<li><h4>소재 : <%=list.get(0).getMATERIAL() %></h4></li>
		        	<li><h4>세탁방법 : <%=list.get(0).getWASH() %></h4></li>
		        	</ul></p>
			        <hr style="width: 100%;border: solid black 1px;">
			        <div class="score" align="center">
		        		<h4>평점</h4>
	        		<%
		        		if(list.get(0).getAVG_SCORE()==1){
		        	%>
		        		<img alt="..." src="../images/scoreFull.png">
		        		<img alt="..." src="../images/scoreEmpty.png">
		        		<img alt="..." src="../images/scoreEmpty.png">
		        		<img alt="..." src="../images/scoreEmpty.png">
		        		<img alt="..." src="../images/scoreEmpty.png">
	        		<%
		        		}else if(list.get(0).getAVG_SCORE()==2){
	        		%>
	        			<img alt="..." src="../images/scoreFull.png">
		        		<img alt="..." src="../images/scoreFull.png">
		        		<img alt="..." src="../images/scoreEmpty.png">
		        		<img alt="..." src="../images/scoreEmpty.png">
		        		<img alt="..." src="../images/scoreEmpty.png">
	        		<%
		        		}else if(list.get(0).getAVG_SCORE()==3){
	        		%>
	        			<img alt="..." src="../images/scoreFull.png">
		        		<img alt="..." src="../images/scoreFull.png">
		        		<img alt="..." src="../images/scoreFull.png">
		        		<img alt="..." src="../images/scoreEmpty.png">
		        		<img alt="..." src="../images/scoreEmpty.png">
	        		<%
		        		}else if(list.get(0).getAVG_SCORE()==4){
	        		%>
	        			<img alt="..." src="../images/scoreFull.png">
		        		<img alt="..." src="../images/scoreFull.png">
		        		<img alt="..." src="../images/scoreFull.png">
		        		<img alt="..." src="../images/scoreFull.png">
		        		<img alt="..." src="../images/scoreEmpty.png">
	        		<%
		        		}else if(list.get(0).getAVG_SCORE()==5){
	        		%>
	        			<img alt="..." src="../images/scoreFull.png">
		        		<img alt="..." src="../images/scoreFull.png">
		        		<img alt="..." src="../images/scoreFull.png">
		        		<img alt="..." src="../images/scoreFull.png">
		        		<img alt="..." src="../images/scoreFull.png">
		        	<%
		        		}
	        		%>
		        	</div>
		        	<div class="buy" align="center">
		        	<% 	 
					if(dto!=null){
					%>
		        		<button style="width: 80%; height: 50px; margin-top: 15px; margin-bottom: 15px;" onclick="location.href='basketlist.mib'">구매하기</button>
		        	<%
		        	}else{ 
		        	%>
		        		<a href="login.mib" data-toggle="modal" data-target="#modal-signup">
		        		<button style="width: 80%; height: 50px; margin-top: 15px; margin-bottom: 15px;">
		        		구매하기
		        		</button>	
		        		</a>
		        	<%
		        	}
		        	%>
		        	</div>
		        </div>
		      </div>
		    </div>
	  	</div>
	</div>
</div>

<div>
<h1> </h1>
<br></br>
<hr style="border: solid black 1px; width: 100%;">
<br></br>
</div>

<div class="container">
	
  <div class="tab-wrap">
    <!-- active tab on page load gets checked attribute -->
    <input type="radio" id="tab1" name="tabGroup1" class="tab" checked>
    <label for="tab1">상품상세</label>

    <input type="radio" id="tab2" name="tabGroup1" class="tab">
    <label for="tab2">리뷰</label>

    <input type="radio" id="tab3" name="tabGroup1" class="tab">
    <label for="tab3">Q&A</label>

    <div class="tab__content">
     <center>
     <h1>상품상세 TEST</h1>
     <img alt="..." src="../images/LOVE.jpg" class="detailPhto col-xs-12 col-lg-12"><br/>
     <img alt="..." src="../images/LOVE.jpg" class="detailPhto col-xs-12 col-lg-12"><br/>
     <img alt="..." src="../images/LOVE.jpg" class="detailPhto col-xs-12 col-lg-12"><br/>
     <img alt="..." src="../images/LOVE.jpg" class="detailPhto col-xs-12 col-lg-12"><br/>
     <img alt="..." src="../images/LOVE.jpg" class="detailPhto col-xs-12 col-lg-12"><br/>
     </center>
    </div>

    <div class="tab__content">
      <table class="layout display responsive-table">
      <col width="20%"/><col width="60%"/><col width="20%"/>
    <thead>
        <tr>
            <th colspan="3" style="text-align: center; height: 100px;">평점 : 
            <img alt="" src="../images/scoreFull.png">
            <img alt="" src="../images/scoreFull.png">
            <img alt="" src="../images/scoreFull.png">
            <img alt="" src="../images/scoreFull.png">
            <img alt="" src="../images/scoreEmpty.png">
            </th>
        </tr>
    </thead>
    <tbody>
        <tr>
            <td class="organisationnumber" width="20%">
            	<img alt="" src="../images/LOVE.jpg" class="imgr" width="200px">            
         	</td>
            <td class="organisationname" width="60%">
            	<a href="javascript:popup()">
	            <img alt="" src="../images/scoreFull.png" class="star">
	            <img alt="" src="../images/scoreFull.png" class="star">
	            <img alt="" src="../images/scoreFull.png" class="star">
	            <img alt="" src="../images/scoreFull.png" class="star">
	            <img alt="" src="../images/scoreEmpty.png" class="star"> <br><br>
	            <h4>Stet clita kasd gubergren, no sea takimata sanctus est</h4>
	            </a>
	        </td>
            <td class="actions" width="20%">
                        	작성자 : 전창건<br>
                         	작성일 : 2017-03-24
            </td>
        </tr>
        <tr>
            <td class="organisationnumber">            
               <img alt="" src="../images/LOVE.jpg" class="imgr" width="200px">           
         	</td>
            <td class="organisationname">
	            <a href="#">
	            <img alt="" src="../images/scoreFull.png" class="star">
	            <img alt="" src="../images/scoreFull.png">
	            <img alt="" src="../images/scoreFull.png">
	            <img alt="" src="../images/scoreFull.png">
	            <img alt="" src="../images/scoreEmpty.png"> 
	            <br/><br/>
	            <h4>Duis autem vel eum iriure dolor in hendrerit in vulputate velit esse molestie consequat</h4>
	            </a>
	        </td>
            <td class="actions">
                        	작성자 : 전창건<br>
                       	작성일 : 2017-03-24
            </td>
        </tr>
        <tr>
            <td class="organisationnumber">            
               <img alt="" src="../images/LOVE.jpg" class="imgr" width="200px">            
         	</td>
            <td class="organisationname">
	            <a href="#">
	            <img alt="" src="../images/scoreFull.png">
	            <img alt="" src="../images/scoreFull.png">
	            <img alt="" src="../images/scoreFull.png">
	            <img alt="" src="../images/scoreFull.png">
	            <img alt="" src="../images/scoreEmpty.png"> <br><br>
	            <h4>Vel illum dolore eu feugiat nulla facilisis at vero eros</h4>
	            </a>
	        </td>
            <td class="actions">
                        	작성자 : 전창건<br>
                        	작성일 : 2017-03-24
            </td>
        </tr>
        <tr>
            <td class="organisationnumber">            
               <img alt="" src="../images/LOVE.jpg" class="imgr" width="200px">           
         	</td>
            <td class="organisationname">
	            <a href="#">
	            <img alt="" src="../images/scoreFull.png">
	            <img alt="" src="../images/scoreFull.png">
	            <img alt="" src="../images/scoreFull.png">
	            <img alt="" src="../images/scoreFull.png">
	            <img alt="" src="../images/scoreEmpty.png"> <br><br>
	            <h4>Iusto odio dignissim qui blandit praesent luptatum zzril delenit</h4>
	            </a>
	        </td>
            <td class="actions">
                        	작성자 : 전창건<br>
                        	작성일 : 2017-03-24
            </td>
        </tr>
        <tr>
            <td class="organisationnumber">            
               <img alt="" src="../images/LOVE.jpg" class="imgr" width="200px">            
         	</td>
            <td class="organisationname">
	            <a href="#">
	            <img alt="" src="../images/scoreFull.png">
	            <img alt="" src="../images/scoreFull.png">
	            <img alt="" src="../images/scoreFull.png">
	            <img alt="" src="../images/scoreFull.png">
	            <img alt="" src="../images/scoreEmpty.png"> <br><br>
	            <h4>Lorem ipsum dolor sit amet, consetetur sadipscing elitr, At accusam aliquyam diam</h4>
	            </a>
            </td>
            <td class="actions">
                       	작성자 : 전창건<br>
                      	작성일 : 2017-03-24
            </td>
        </tr>
    </tbody>
	</table>
	</div>
	
    <!-- QNA -->
    <div class="tab__content">
     <table class="layout display responsive-table">
       <col width="15%"/><col width="15%"/><col width="40%"/><col width="15%"/><col width="15%"/>
    <thead>
        <tr>
            <th style="text-align: center;">공개/비공개</th>
            <th style="text-align: center;">구분</th>
            <th style="text-align: center;">제목</th>
            <th style="text-align: center;">작성자</th>
            <th style="text-align: center;">작성일</th>
        </tr>
    </thead>
    <tbody>
        <tr>
            <td class="organisationnumber">비공개</td>
            <td>상품문의</td>
            <td class="organisationname">
            	<a href="javascript:QnADetail()">그래서 사이즈 뭐입어?</a>
            </td>
         	<td>전창건</td>
            <td>
               2017-03-24
            </td>
        </tr>

        <tr>
            <td class="organisationnumber">비공개</td>
            <td>배송문의</td>
            <td class="organisationname">
            	<a href="#">배솧ㅇ언제와요?</a>
            </td>
         	<td>전창건</td>
            <td>
               2017-03-24
            </td>
        </tr>

        <tr>
            <td class="organisationnumber">비공개</td>
            <td>결제문의</td>
            <td class="organisationname">
            	<a href="#">삼성카드 결제 왜안됨??</a>
            </td>
         	<td>전창건</td>
            <td>
               2017-03-24
            </td>
        </tr>
          
       <tr>
            <td class="organisationnumber">비공개</td>
            <td>상품문의</td>
            <td class="organisationname">
            	<a href="#">Stet clita kasd gubergren, no sea takimata sanctus est</a>
            </td>
         	<td>전창건</td>
            <td>
               2017-03-24
            </td>
        </tr>

        <tr>
            <td class="organisationnumber">비공개</td>
            <td>상품문의</td>
            <td class="organisationname">
            	<a href="#">Stet clita kasd gubergren, no sea takimata sanctus est</a>
            </td>
         	<td>전창건</td>
            <td>
               2017-03-24
            </td>
        </tr>
    </tbody>
	</table>
		<p align="right" style="margin-right: 30px;">
			<button class="writeBtn" style="width: 10%;" onclick="QnAWrite()">글쓰기</button>
		</p>
    </div>
	</div>
</div>
</div>
</body>
</html>