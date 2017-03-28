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
                                    <li><a href="#">home</a></li>
                                    <li><a href="#">products</a></li>
                                    <li><a href="#">men</a></li>
                                    <li><a href="#">women</a></li>
                                    <li><a href="#">kids</a></li>
                                    <li><a href="#">accessoires</a></li>
                                    <li><a href="#">terms & conditions</a></li>
                                    <li><a href="#">imprint</a></li>
                              </ul>
                        </nav>
                        
                     
                  </div>
            </div>
            <!-- 앞에 <이거부분 -->
            <label class="opener" for="right-toggle"></label>
      </article>
</aside>
<aside id="buyaside" class="buyaside">
   <img alt="" src="../images/buybtn.png" width="50px" height="50px">
</aside>


<script type="text/javascript">
$(document).ready(function() {

   $("#right-toggle").click(function(){
   if($("#right-toggle").prop("checked")) {
   
      $("#buyaside").css('margin-top','820px');
   
   }else{
      
         $("#buyaside").css('margin-top','630px');
   
   }
   });
   
});

</script>
</body>
</html>