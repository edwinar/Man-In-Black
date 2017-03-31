<%@page import="com.eagle.men_in_black.model.CategoryDto"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%
	List<CategoryDto> list = (List<CategoryDto>)request.getAttribute("list");
%>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>:::NEW:::</title>
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
<script type="text/javascript">
function movedetail(pd_no) {
    var pro_seq = pd_no;
         addCookie(pro_seq);
     location.href='detail.mib?PRO_SEQ='+pro_seq;
}
/*-------------------------------------------------쿠키만들기*/
function setCookie(cookie_name, value, exdays) {
    var exdate = new Date();
    exdate.setDate(exdate.getDate() + exdays);
    var cookie_value = escape(value) + ((exdays == null) ? "" : "; expires=" + exdate.toUTCString());
    document.cookie = cookie_name + "=" + cookie_value;
}
/*------------------------------------------------겟쿠키*/
function getCookie(cookie_name) {
    var i, x, y, z = document.cookie.split(";");
    for (i = 0; i < z.length; i++) {
        x = z[i].substr(0, z[i].indexOf("="));
        y = z[i].substr(z[i].indexOf("=") + 1);
        x = x.replace(/^s+|s+$/g, "");
        if (x == cookie_name) {
            return unescape(y);
        }
    }
}
/* ----------------------------------------쿠키 값 추가*/
function addCookie(pd_no) {
    var maxitem = 5; // 최대 유지할 수 있는 상품 개수
    prev_pd_no = getCookie('recentitems');
    if ((prev_pd_no == '') || (prev_pd_no == null)) {
        setCookie('recentitems', pd_no);
    }else {
        if (getCookie('recentitems').split(',').length > maxitem + 1) {
            prev_pd_no = prev_pd_no.substring(prev_pd_no.indexOf(',') + 1);
        }
        if (prev_pd_no.match(pd_no)) {
            console.log(pd_no); // 이미 존재하는 경우 console에만 출력하고 실제 반영되지 않음
        }else{
            setCookie('recentitems', prev_pd_no + ',' + pd_no);
        }
    }
}
</script>
<br></br>
<h1 style="font-size: 50px; font-weight: bold; text-align: center; " > NEW </h1>   
<br></br>

<div class="row" align="center">
	<div class="col-md-6 visible-md visible-lg" align="left">
	<p>
		
	</p>
	</div>
	<div class="col-md-6 visible-md visible-lg" align="right">
	<p>
		<a href="NewCategory.mib?ORDER=C.PRO_SEQ DESC" class="btn btn-primary" role="button">신상품순</a>
		<a href="NewCategory.mib?ORDER=C.PRO_PRICE ASC" class="btn btn-primary" role="button">낮은가격순</a>
		<a href="NewCategory.mib?ORDER=C.SALE_CNT DESC" class="btn btn-primary" role="button">인기상품순</a>
		<a href="NewCategory.mib?ORDER=REVIEW_CNT DESC" class="btn btn-primary" role="button">리뷰수순</a>
	</p>
	</div>
	<br></br><br></br>
</div>

<div class="row" align="center">
  <%
  	for(int i=0;i<list.size();i++){
  %>
  <div class="col-xs-12 col-lg-4" onclick="movedetail(<%=list.get(i).getPRO_SEQ()%>)">
    <div class="thumbnail">
      <img src="../images/LOVE.jpg" alt="...">
      <div class="caption">
        <h5><%=list.get(i).getPRO_NAME() %></h5>
        <p><%=list.get(i).getPRO_PRICE() %> Won</p>
      </div>
    </div>
  </div>
  <%
  	}
  %>
</div>


<div class="row" align="center">
	<p>
	<a href="#" class="btn btn-default" role="button"><</a>
	<a href="#" class="btn btn-default" role="button">1</a>
	<a href="#" class="btn btn-default" role="button">2</a>
	<a href="#" class="btn btn-default" role="button">3</a>
	<a href="#" class="btn btn-default" role="button">4</a>
	<a href="#" class="btn btn-default" role="button">></a>
	</p>
</div>

</body>
</html>