<%@page import="com.eagle.men_in_black.model.CategoryDto"%>
<%@page import="java.util.List"%>
<%@page import="com.eagle.men_in_black.service.CategorySvc"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	List<CategoryDto> list = (List<CategoryDto>)request.getAttribute("list");
	String SUB_ITEM = (request.getParameter("SUB_ITEM")==null||request.getParameter("SUB_ITEM").equals("") )?"ALL":request.getParameter("SUB_ITEM");

%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>:::Outer:::</title>
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

<br></br>
<h1 style="font-size: 50px; font-weight: bold; text-align: center; " > OUTER </h1>   
<br></br>

<div class="row" align="center">
  <div class="col-xs-12 col-lg-4" onclick="location.href='detail.mib'">
    <div class="thumbnail">
      <img src="../images/LOVE.jpg" alt="...">
      <div class="caption">
        <h5>창거니가 어제 입던 소매티</h5>
        <p>19000 Won</p>
      </div>
    </div>
  </div>
  <div class="col-xs-12 col-lg-4" onclick="location.href='detail.mib'">
    <div class="thumbnail">
      <img src="../images/LOVE.jpg" alt="...">
      <div class="caption">
        <h5>창거니가 어제 입던 소매티</h5>
        <p>19000 Won</p>
      </div>
    </div>
  </div>
  <div class="col-xs-12 col-lg-4" onclick="location.href='detail.mib'">
    <div class="thumbnail">
      <img src="../images/LOVE.jpg" alt="...">
      <div class="caption">
        <h5>창거니가 어제 입던 소매티</h5>
        <p>19000 Won</p>
      </div>
    </div>
  </div>
</div>

<hr style="border: solid black 2px;">

<div class="row" align="center">
	<div class="col-md-6 visible-md visible-lg" align="left">
	<p>
		<a href="outerCategory.mib?SUB_ITEM=ALL" class="btn btn-primary" role="button">전체보기</a>
		<a href="outerCategory.mib?SUB_ITEM=COAT" class="btn btn-primary" role="button">COAT</a>
		<a href="outerCategory.mib?SUB_ITEM=JACKET" class="btn btn-primary" role="button">JACKET</a>
		<a href="outerCategory.mib?SUB_ITEM=JUMPER" class="btn btn-primary" role="button">JUMPER</a>
	</p>
	</div>
	<div class="col-md-6 visible-md visible-lg" align="right">
	<p>
		<a href="outerCategory.mib?ORDER=C.PRO_SEQ DESC&SUB_ITEM=<%=SUB_ITEM %>" class="btn btn-primary" role="button">신상품순</a>
		<a href="outerCategory.mib?ORDER=C.PRO_SEQ ASC&SUB_ITEM=<%=SUB_ITEM %>" class="btn btn-primary" role="button">낮은가격순</a>
		<a href="outerCategory.mib?ORDER=C.SALE_CNT DESC&SUB_ITEM=<%=SUB_ITEM %>" class="btn btn-primary" role="button">인기상품순</a>
		<a href="outerCategory.mib?ORDER=REVIEW_CNT DESC&SUB_ITEM=<%=SUB_ITEM %>" class="btn btn-primary" role="button">리뷰수순</a>
	</p>
	</div>
	<br></br><br></br>
</div>

<div class="row" align="center">
<%
	for(int i=0; i<list.size(); i++){
%>
	<div class="col-xs-12 col-lg-4">
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