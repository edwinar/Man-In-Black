<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<style type="text/css">
#outerH1{
margin-top: 150px;
}
.slide-container{
  margin-top : 130px;
  position: relative;
  width: 100%;
  height: 600px;
  
  
}
.slide{
  width: 100%;
  height: 100%;
  animation: fade 1s;
}

.content{
	width: 100%;
	height: 100%;
}
.prev,
.next{
  color: #fff;
  position: absolute;
  top: 50%;
  font-weight: bold;
  font-size: 20px;
  cursor: pointer;
  transition: all .5s;
  padding: 5px 10px;
  border-radius: 0px 5px 5px 0px;
}
.next{
  right:0;
  border-radius: 5px 0px 0px 5px;
}
.prev:hover,
.next:hover{
  background-color: rgba(0,0,0,.5);
}
.pagers{
  position: absolute;
  bottom: 0;
  text-align: center;
  width: 100%;
}
.pagers div{
  display: inline-block;
  padding: 10px;
  cursor: pointer;
  border-radius: 50%;
  background-color: white;
}
.active{
  background-color: rgba(0,0,0,.5) !important;
}
@keyframes fade{
  0%{
    opacity: .7;
  }
  100%{
    opacity: 1;
  }
}
/*작아졌을때*/
@media (max-width: 30em){
#outerH1{
margin-top: 100px;
}

.slide-container{
  position: relative;
  width: 100%;
  height: 200px;
/*   background:red; */
  margin: auto;
}
.slide{
  width: 100%;
  height: 80%;
  animation: fade 1s;
}
.prev,
.next{
  color: #fff;
  position: absolute;
  top: 50%;
  font-weight: bold;
  font-size: 20px;
  cursor: pointer;
  transition: all .5s;
  padding: 5px 10px;
  border-radius: 0px 5px 5px 0px;
}
.next{
  right:0;
  border-radius: 5px 0px 0px 5px;
}
.prev:hover,
.next:hover{
  background-color: rgba(0,0,0,.5);
}
.pagers{
  position: absolute;
  bottom: 0;
  text-align: center;
  width: 100%;
}
.pagers div{
  display: inline-block;
  padding: 10px;
  cursor: pointer;
  border-radius: 50%;
  background-color: white;
}

}


/* 베스트 상품 부분 스타일*/
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

<div class="slide-container">
  <div class="slide">

    <div class="content"><img src="../images/aa.jpg" height="100%" width="100%"></div>

  </div>

  <div class="slide">

    <div class="content"><img src="../images/dd.jpg" height="100%" width="100%"></div>

  </div>

  <div class="slide">

    <div class="content"><img src="../images/ss.jpg" height="100%" width="100%"></div>

  </div>
  <div class="prev" onclick="plus(-1)">&#10094;</div>
  <div class="next" onclick="plus(1)">&#10095;</div>

  <div class="pagers">
    <div class="active" onclick="current(0)"></div>
    <div onclick="current(1)"></div>
    <div onclick="current(2)"></div>
  </div>
</div>

<h1 style="font-size: 50px; font-weight: bold; " id="outerH1"  > OUTER </h1>
<div class="row" align="center">
  <div class="col-xs-12 col-lg-4" onclick="location.href='detail.mib'">
    <div class="thumbnail">
      <img src="../images/LOVE.jpg" alt="...">
      <div class="caption">
        <h3>창거니가 어제 입던 소매티</h3>
        <p>19000 Won</p>
      </div>
    </div>
  </div>
  <div class="col-xs-12 col-lg-4" onclick="location.href='detail.mib'">
    <div class="thumbnail">
      <img src="../images/LOVE.jpg" alt="...">
      <div class="caption">
        <h3>창거니가 어제 입던 소매티</h3>
        <p>19000 Won</p>
      </div>
    </div>
  </div>
  <div class="col-xs-12 col-lg-4" onclick="location.href='detail.mib'">
    <div class="thumbnail">
      <img src="../images/LOVE.jpg" alt="...">
      <div class="caption">
        <h3>창거니가 어제 입던 소매티</h3>
        <p>19000 Won</p>
      </div>
    </div>
  </div>
</div>

<hr style="border: solid black 2px;">

<h1 style="font-size: 50px; font-weight: bold; " > TOP </h1>
<div class="row" align="center">
  <div class="col-xs-12 col-lg-4" onclick="location.href='detail.mib'">
    <div class="thumbnail">
      <img src="../images/LOVE.jpg" alt="...">
      <div class="caption">
        <h3>창거니가 어제 입던 소매티</h3>
        <p>19000 Won</p>
      </div>
    </div>
  </div>
  <div class="col-xs-12 col-lg-4" onclick="location.href='detail.mib'">
    <div class="thumbnail">
      <img src="../images/LOVE.jpg" alt="...">
      <div class="caption">
        <h3>창거니가 어제 입던 소매티</h3>
        <p>19000 Won</p>
      </div>
    </div>
  </div>
  <div class="col-xs-12 col-lg-4" onclick="location.href='detail.mib'">
    <div class="thumbnail">
      <img src="../images/LOVE.jpg" alt="...">
      <div class="caption">
        <h3>창거니가 어제 입던 소매티</h3>
        <p>19000 Won</p>
      </div>
    </div>
  </div>
</div>

<hr style="border: solid black 2px;">

<h1 style="font-size: 50px; font-weight: bold; " > PANTS </h1>
<div class="row" align="center">
  <div class="col-xs-12 col-lg-4" onclick="location.href='detail.mib'">
    <div class="thumbnail">
      <img src="../images/LOVE.jpg" alt="...">
      <div class="caption">
        <h3>창거니가 어제 입던 소매티</h3>
        <p>19000 Won</p>
      </div>
    </div>
  </div>
  <div class="col-xs-12 col-lg-4" onclick="location.href='detail.mib'">
    <div class="thumbnail">
      <img src="../images/LOVE.jpg" alt="...">
      <div class="caption">
        <h3>창거니가 어제 입던 소매티</h3>
        <p>19000 Won</p>
      </div>
    </div>
  </div>
  <div class="col-xs-12 col-lg-4" onclick="location.href='detail.mib'">
    <div class="thumbnail">
      <img src="../images/LOVE.jpg" alt="...">
      <div class="caption">
        <h3>창거니가 어제 입던 소매티</h3>
        <p>19000 Won</p>
      </div>
    </div>
  </div>
</div>

<hr style="border: solid black 2px;">


<script type="text/javascript">
var slide = document.getElementsByClassName('slide'),
pager = document.querySelectorAll('.pagers div'),
i,
slideIndex = 0;
/* for (i = 0; i < slide.length; i = i + 1) {
slide[i].style.background = "#94" + i;
} */

//auto slide
function showSlide() {
"use strict";
for (i = 0; i < slide.length; i = i + 1) {
slide[i].style.display = "none";
pager[i].classList.remove('active');
}

if (slideIndex >= slide.length) {slideIndex = 0; }
slide[slideIndex].style.display = "block";
pager[slideIndex].classList.add('active');
slideIndex = slideIndex + 1;

}

showSlide();
setInterval(showSlide,2000);
function clickshow(n) {
"use strict";
var slide = document.getElementsByClassName('slide'),
  pager = document.querySelectorAll('.pagers div');
for (i = 0; i < slide.length; i = i + 1) {
slide[i].style.display = "none";
pager[i].classList.remove("active");
}
if (slideIndex >= slide.length) {slideIndex = 0; }
if (slideIndex < 0) {slideIndex = slide.length - 1; }
slide[slideIndex].style.display = "block";
pager[slideIndex].classList.add("active");
}

function plus(n) {
"use strict";
clickshow(slideIndex += n);
}
function current(n) {
"use strict";
clickshow(slideIndex = n);
}

</script>
</body>
</html>