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

<style>
*:focus {
  outline: 0;
}
*, *:before, *:after {
  box-sizing: border-box;
}

::-webkit-input-placeholder {
  font-family: 'Podkova', serif;
}
:-moz-placeholder {
  font-family: 'Podkova', serif;
}
::-moz-placeholder {
  font-family: 'Podkova', serif;
}
:-ms-input-placeholder {
  font-family: 'Podkova', serif;
}

html, html body {
  position: absolute;
  left: 0;
  right: 0;
  top: 0;
  bottom: 0;
  width: 100vw;
  height: 100vh;
  overflow: auto;
}

#aside {
  position: absolute;
  position: fixed;
  z-index: 100;
  right: 0;
  width: 10%;
  min-width: 15em;
  height: 50%;
  top: 0;
  bottom: 0;
  margin: 0;
  margin-top: 20%;
  min-height:25em;
  border-radius: .5em;
  pointer-events: none;
  -webkit-transition: all 0.45s ease-in;
  transition: all 0.45s ease-in;
  -webkit-transform: translateX(calc(100% - .75em));
          transform: translateX(calc(100% - .75em));
}

#buyaside {
  position: absolute;
  position: fixed;
  z-index: 0;
  right: 0;
  width: 10%;
  min-width: 15em;
  height: 50%;
  top: 0;
  bottom: 0;
  margin: 0;
  margin-top: 32%;
  min-height:25em;
  border-radius: .5em;
  pointer-events: none;
  -webkit-transition: all 0.45s ease-in;
  transition: all 0.45s ease-in;
}

#art {
  position: relative;
  width: 100%;
  height: 100%;
}
/*박스 색상 */
#art .box {
  overflow: hidden;
  position: relative;
  width: 100%;
  height: 100%;
  background-color: #333333;
}
#art .box .content {
  overflow-y: auto;
  padding: 1em;
  margin-left: 2em;
  height: 100%;
}
#art .spacer {
  position: absolute;
  left: -2em;
  top: 45%;
  width: 4em;
  height: 4em;
  z-index: -1;
  border-radius: 100%;
  mix-blend-mode: darken;
  box-shadow: 0 0 0 0 rgba(17, 141, 240, 0.5), 0 0 0 0 #fff;
  -webkit-transition: all 0.6s ease-out;
  transition: all 0.6s ease-out;
}
#art .spacer:after {
  display: inline-block;
}
#art .opener {
  position: absolute;
  position: absolute;
  left: -.75em;
  top: calc(45% + .25em);
  font-size: 2em;
  width: 1.5em;
  height: 1.5em;
  display: inline-block;
  line-height: 1.4;
  pointer-events: all;
  background-color: black;
  background-position: center center;
  background-blend-mode: overlay;
  background-size: 100% 100%;
  text-align: center;
  vertical-align: middle;
  border-radius: 100%;
  -webkit-transition: all 0.3s ease-in-out;
  transition: all 0.3s ease-in-out;
}
#art .opener:hover {
  box-shadow: 0.1em 0 0 rgba(0, 0, 0, 0.2);
  -webkit-transform: translateX(-25%);
          transform: translateX(-25%);
  -webkit-transition: all 0.3s ease-in-out;
  transition: all 0.3s ease-in-out;
}
#art .opener:focus {
  -webkit-transform: scale(0.9);
          transform: scale(0.9);
  -webkit-transition: all 0.3s ease-in-out;
  transition: all 0.3s ease-in-out;
}
/* 여기색상이 < 이거색상 */
#art .opener:before, #art .opener:after {
  content: '';
  position: absolute;
  background-color: #fff;
  width: .2em;
  height: .656em;
  left: .6em;
  -webkit-transition: all 0.3s;
  transition: all 0.3s;
}
#art .opener:before {
  -webkit-transform: rotate(45deg);
          transform: rotate(45deg);
  top: .25em;
}
#art .opener:after {
  -webkit-transform: rotate(-45deg);
          transform: rotate(-45deg);
  bottom: .25em;
}

#toggle {
  display: inline;
  width: 0;
  height: 0;
  -webkit-appearance: none;
  -moz-appearance: none;
}

#toggle:after {
  content: '';
  display: block;
  position: fixed;
  left: 0;
  right: 0;
  top: 0;
  bottom: 0;
  opacity: 0;
  border-radius: 100%;
  pointer-events: none;
  z-index: -1;
  -webkit-transform: translateX(95%);
          transform: translateX(95%);
  box-shadow: inset 0 0 0 0 transparent;
  -webkit-transition: all 0.6s ease-out;
  transition: all 0.6s ease-out;
}
/* #toggle:checked:after {
  opacity: 1;
  z-index: 99;
  border-radius: 0%;
  pointer-events: all;
  -webkit-transform: translateX(0%);
          transform: translateX(0%);
  -webkit-transition: all 0.9s ease-in;
  transition: all 0.9s ease-in;
  box-shadow: inset 10em 0 0em 150em rgba(0, 0, 0, 0.5);
} */
#toggle:checked + #aside {
  pointer-events: all;
  -webkit-transform: translateY(0%);
          transform: translateY(0%);
  -webkit-transition: all 0.6s ease-in 0.3s;
  transition: all 0.6s ease-in 0.3s;
}
#toggle:checked + #aside .spacer {
  box-shadow: 0 0 0 100em rgba(17, 141, 240, 0.95), 0 0 0 40em #fff;
  -webkit-transition: all 1.2s ease-in;
  transition: all 1.2s ease-in;
}
#toggle:checked + #aside .opener {
  background-color: black;
  -webkit-transition: all 0.3s ease-in-out 0.3s;
  transition: all 0.3s ease-in-out 0.3s;
}
#toggle:checked + #aside .opener:hover {
  box-shadow: 0 0 0 0.5em rgba(0, 0, 0, 0.2);
  -webkit-transform: rotate(360deg) scale(0.8);
          transform: rotate(360deg) scale(0.8);
  -webkit-transition: all 0.3s ease-in-out 0.3s;
  transition: all 0.3s ease-in-out 0.3s;
}
#toggle:checked + #aside .opener:before, #toggle:checked + #aside .opener:after {
  -webkit-transition: all 0.6s 0.3s;
  transition: all 0.6s 0.3s;
}
#toggle:checked + #aside .opener:before {
  -webkit-transform: rotate(-45deg) translate(-40%, 25%);
          transform: rotate(-45deg) translate(-40%, 25%);
}
#toggle:checked + #aside .opener:after {
  -webkit-transform: rotate(45deg) translate(-40%, -25%);
          transform: rotate(45deg) translate(-40%, -25%);
}


#nav ul {
  display: block;
  margin: 1em 0;
}
#nav ul li {
  line-height: 1.6;
}
/*목록 글자색*/
#nav ul li a {
  display: inline-block;
  height: 100%;
  line-height: 1.3;
  color: white;
  padding: .5em;
  margin-left: -.5em;
  text-transform: capitalize;
}
#nav ul li a:before {
  display: inline-block;
  margin-right: .5em;
  width: 1em;
}
/*목록 마우스 오버 색 */
#nav ul li a:hover {
  background-color: rgba(0, 0, 0, 0.2);
  border-radius: .5em;
}

p {
  margin-bottom: 1.5em;
}

h1 {
  font-size: 1.5em;
  margin-bottom: .5em;
}

b {
  font-weight: bold;
}

i {
  font-style: italic;
}

a {
  color: #118DF0;
  text-decoration: none;
}
a:hover {
  text-decoration: underline;
}

small {
  font-size: .9em;
  color: rgba(0, 0, 0, 0.7);
}

</style>
</head>
<body>
<!-- 앞에 튀어나와있는 < 이부분  -->
<input type="checkbox" name="toggle" id="toggle" />
<aside id="aside">
      <article id="art">
            <div class="box">
                  <span class="spacer"></span>
                  <div class="content">
                        <nav id="nav">
                              <ul>
                                    <li><a href="#" class="fa fa-home">home</a></li>
                                    <li><a href="#" class="fa fa-amazon">products</a></li>
                                    <li><a href="#" class="fa fa-male">men</a></li>
                                    <li><a href="#" class="fa fa-female">women</a></li>
                                    <li><a href="#" class="fa fa-child">kids</a></li>
                                    <li><a href="#" class="fa fa-umbrella">accessoires</a></li>
                                    <li><a href="#" class="fa fa-map-o">terms & conditions</a></li>
                                    <li><a href="#" class="fa fa-registered">imprint</a></li>
                              </ul>
                        </nav>
                        
                     
                  </div>
            </div>
            <!-- 앞에 <이거부분 -->
            <label class="opener" for="toggle" title="Toggle aside menu…"></label>
      </article>
</aside>
<aside id="buyaside" class="buyaside">
   <img alt="" src="../images/buybtn.png" width="100px" height="100px">
</aside>


<script type="text/javascript">
$(document).ready(function() {

   $("#toggle").click(function(){
   if($("#toggle").prop("checked")) {
   
      $("#buyaside").css('margin-top','45%');
   
   }else{
      
         $("#buyaside").css('margin-top','32%');
   
   }
   });
   
});

</script>
</body>
</html>