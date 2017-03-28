<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>

<div class="main-slide-container">
  <div class="main-slide">

    <div class="main-slide-content"><img src="../images/aa.jpg" height="100%" width="100%"></div>

  </div>

  <div class="main-slide">

    <div class="main-slide-content"><img src="../images/dd.jpg" height="100%" width="100%"></div>

  </div>

  <div class="main-slide">

    <div class="main-slide-content"><img src="../images/ss.jpg" height="100%" width="100%"></div>

  </div>
  <div class="prev" onclick="plus(-1)">&#10094;</div>
  <div class="next" onclick="plus(1)">&#10095;</div>

  <div class="main-pagers">
    <div class="main-pagers-active" onclick="current(0)"></div>
    <div onclick="current(1)"></div>
    <div onclick="current(2)"></div>
  </div>
</div>

<h1 style="font-size: 50px; font-weight: bold; " id="main-best-h1"  > OUTER </h1>
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
var slide = document.getElementsByClassName('main-slide'),
pager = document.querySelectorAll('.main-pagers div'),
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
pager[i].classList.remove('main-pagers-active');
}

if (slideIndex >= slide.length) {slideIndex = 0; }
slide[slideIndex].style.display = "block";
pager[slideIndex].classList.add('main-pagers-active');
slideIndex = slideIndex + 1;

}

showSlide();
setInterval(showSlide,2000);
function clickshow(n) {
"use strict";
var slide = document.getElementsByClassName('main-slide'),
  pager = document.querySelectorAll('.main-pagers div');
for (i = 0; i < slide.length; i = i + 1) {
slide[i].style.display = "none";
pager[i].classList.remove("main-pagers-active");
}
if (slideIndex >= slide.length) {slideIndex = 0; }
if (slideIndex < 0) {slideIndex = slide.length - 1; }
slide[slideIndex].style.display = "block";
pager[slideIndex].classList.add("main-pagers-active");
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