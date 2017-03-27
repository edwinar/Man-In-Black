<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<style type="text/css">
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
.container {
  margin: 0 auto;
  display: block;
  max-width: 1200px;
}
.container > *:not(.tab-wrap) {
  padding: 0 80px;
}

/* 테이블 쪽 스타일 */
body{
  padding: 1em;
  
  margin-top: 500px;
 }
a{
   color: black;
   cursor: pointer;
   text-decoration: none;
}
a:hover{
   text-decoration: underline;
}
.page{
  max-width: 60em;
  margin: 0 auto;
}
/* table th{
   text-align: center;
   height: 100px;
} */
table td{
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
     <h1>상품상세</h1>
    </div>

    <div class="tab__content">
      <table class="layout display responsive-table">
    <thead>
        <tr>
            <th colspan="3" style="text-align: center; height: 100px;">평점 
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
            <td class="organisationnumber">
            	<img alt="" src="123.jpg" class="imgr">            
         	</td>
            <td class="organisationname">
            	<a href="#">
	            <img alt="" src="별.png" class="star">
	            <img alt="" src="별.png" class="star">
	            <img alt="" src="별.png" class="star">
	            <img alt="" src="별.png" class="star">
	            <img alt="" src="별.png" class="star"> <br><br>
	            Stet clita kasd gubergren, no sea takimata sanctus est
	            </a>
	        </td>
            <td class="actions">
                        	작성자 : 전창건<br>
                         	작성일 : 2017-03-24
            </td>
        </tr>
        <tr>
            <td class="organisationnumber">            
               <img alt="" src="77.png" class="imgr">            
         	</td>
            <td class="organisationname">
	            <a href="#">
	            <img alt="" src="별.png" class="star">
	            <img alt="" src="별.png">
	            <img alt="" src="별.png">
	            <img alt="" src="별.png">
	            <img alt="" src="별.png"> 
	            <br/><br/>Duis autem vel eum iriure dolor in hendrerit in vulputate velit esse molestie consequat
	            </a>
	        </td>
            <td class="actions">
                        	작성자 : 전창건<br>
                       	작성일 : 2017-03-24
            </td>
        </tr>
        <tr>
            <td class="organisationnumber">            
               <img alt="" src="77.png" class="imgr">            
         	</td>
            <td class="organisationname">
	            <a href="#">
	            <img alt="" src="별.png">
	            <img alt="" src="별.png">
	            <img alt="" src="별.png">
	            <img alt="" src="별.png">
	            <img alt="" src="별.png"> <br><br>
	            Vel illum dolore eu feugiat nulla facilisis at vero eros
	            </a>
	        </td>
            <td class="actions">
                        	작성자 : 전창건<br>
                        	작성일 : 2017-03-24
            </td>
        </tr>
        <tr>
            <td class="organisationnumber">            
               <img alt="" src="77.png" class="imgr">            
         	</td>
            <td class="organisationname">
	            <a href="#"><img alt="" src="별.png">
	            <img alt="" src="별.png">
	            <img alt="" src="별.png">
	            <img alt="" src="별.png">
	            <img alt="" src="별.png"> <br><br>
	            Iusto odio dignissim qui blandit praesent luptatum zzril delenit
	            </a>
	        </td>
            <td class="actions">
                        	작성자 : 전창건<br>
                        	작성일 : 2017-03-24
            </td>
        </tr>
        <tr>
            <td class="organisationnumber">            
               <img alt="" src="77.png" class="imgr">            
         	</td>
            <td class="organisationname">
	            <a href="#">
	            <img alt="" src="별.png">
	            <img alt="" src="별.png">
	            <img alt="" src="별.png">
	            <img alt="" src="별.png">
	            <img alt="" src="별.png"> <br><br>
	            Lorem ipsum dolor sit amet, consetetur sadipscing elitr, At accusam aliquyam diam
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
            <th>공개/비공개</th>
            <th>구분</th>
            <th>제목</th>
            <th>작성자</th>
            <th>작성일</th>
        </tr>
    </thead>
    <tbody>
        <tr>
            <td class="organisationnumber">비공개</td>
            <td>상품문의</td>
            <td class="organisationname">
            	<a href="#">그래서 사이즈 뭐입어?</a>
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
    </div>
	</div>
</div>
</body>
</html>