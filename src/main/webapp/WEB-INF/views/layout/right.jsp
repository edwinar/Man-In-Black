<%@page import="com.eagle.men_in_black.model.MainDto"%>
<%@ page pageEncoding="UTF-8" %>
<%@ page contentType="text/html; charset=UTF-8" %>
<%@ page trimDirectiveWhitespaces="true" %>
<%
request.setCharacterEncoding("UTF-8");
%>
<%
MainDto dto = (MainDto)request.getSession().getAttribute("LoginInfo");

%>
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
</head>
<body>
<!-- 앞에 튀어나와있는 < 이부분  -->
<input type="checkbox" name="right-toggle" id="right-toggle" />
<aside id="right-aside">
      <article id="right-art">
            <div class="right-box">
                  <span class="right-spacer"></span>
                  <div class="right-content">
                        <nav id="right-nav">
                              <ul>
                              <%if(dto!=null){ %>
                                    <li><a href="mymain.mib" >마이페이지들어가기</a></li>
                              <%}else{ %>
                              		<li><a href="login.mib" data-toggle="modal" data-target="#modal-signup">마이페이지들어가기</a></li>
                              <%} %>
                                    <li><a href="event.mib" >이벤트</a></li>
                                    <li><a href="#" >men</a></li>
                                    <li><a href="#" >women</a></li>
                                    <li><a href="#" >kids</a></li>
                                    <li><a href="#" >accessoires</a></li>
                                    <li><a href="#" >terms & conditions</a></li>
                                    <li><a href="#" >imprint</a></li>
                              </ul>
                        </nav>
                        
                     
                  </div>
            </div>
            <!-- 앞에 <이거부분 -->
            <label class="opener" for="right-toggle" ></label>
      </article>

</body>
</html>