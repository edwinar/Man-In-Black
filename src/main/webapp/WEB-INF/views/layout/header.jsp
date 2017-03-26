<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<style>

    @media (min-width: 768px) { /* 최소 768 사이즈때 보이는 크기 */

        .navbar-nav {
            text-align: center;
        }
        .navbar-nav > li {
            float: none;
            display: inline-block;
            width: 16%;

            /*border: 5px solid red;*/
        }
        .dropdown:hover .dropdown-menu {
            display: block;
            margin-top: 0;
        }
        .container{
            display: inline-block;
        }


        .navbar .navbar-nav {
            display: inline-block;
            float: none;
        }

        .navbar .navbar-collapse {
            text-align: center;
        }
    }






    @media (max-width: 768px) { /* 최대 768 사이즈때 보이는 크기 */
        .topnav{
            display: none;

        }
        .dropdown:hover .dropdown-menu {
            text-align: center;
        }
    }
    @media (max-width:992px) { /* 최대 992 사이즈때 보이는 크기 */
        .topnav{
            display: none;

        }
    }
</style>





<nav class="navbar navbar-default navbar-fixed-top" role="navigation">
    <div class="container">
        <!-- Brand and toggle get grouped for better mobile display -->
        <div class="row">
                <div class="col-md-4 col-md-offset-4 col-sm-2 col-sm-offset-5 top header" align="center" /*style="border: 5px solid red;/*">
                    <a href="meninblack.mib"><img id="logo-main" src="../images/LOGO6.png" height="80"></a>

        <div class="navbar-header">
            <button type="button" class="navbar-toggle" data-toggle="collapse" data-target="#bs-example-navbar-collapse-1"  aria-expanded="false" aria-controls="navbar">
                <span class="sr-only">Toggle navigation</span>
                <span class="icon-bar"></span>
                <span class="icon-bar"></span>
                <span class="icon-bar"></span>
            </button>

        </div>
            </div>
            <div class="col-md-4 col-sm-5">
                <div class="nav navbar-nav navbar-right topnav" style="width: 100px">
                    <li style="width: 100%"><a href="#about" >고객센터</a></li>
                </div>
                <div class="nav navbar-nav  navbar-right topnav" style="width: 100px">
                    <li style="width: 100%"><a href="#about">로그아웃</a></li>
                </div>
                <div class="nav navbar-nav  navbar-right topnav" style="width: 100px">
                    <li style="width: 100%"><a href="#about">로그인</a></li>
                </div>
                </div>
            </div>
        <!-- Collect the nav links, forms, and other content for toggling -->
        <br>
        <div class="collapse navbar-collapse " id="bs-example-navbar-collapse-1" align="center" >
            <div class="nav navbar-nav"align="center" style="width: 80%">
                    <li class="dropdown">
                        <a href="NewCategory.mib" class="dropdown-toggle"  role="button" aria-expanded="false">NEW <span class="caret"></span></a>
                        <ul class="dropdown-menu" role="menu">
                            <li><a href="#">COAT</a></li>
                            <li><a href="#">JACKET</a></li>
                            <li><a href="#">JUMPER</a></li>
                            <!--  <li class="divider"></li>
                             <li class="dropdown-header">분할도 됨</li>
                             <li><a href="#">아무거나</a></li>
                             <li><a href="#">느셈</a></li> -->
                        </ul>
                    </li>
                    <li class="dropdown">
                        <a href="outerCategory.mib" class="dropdown-toggle"  role="button" aria-expanded="false">OUTER<span class="caret"></span></a>
                        <ul class="dropdown-menu" role="menu">
                            <li><a href="#">TEE</a></li>
                            <li><a href="#">SHIRT</a></li>
                            <li><a href="#">KNIT</a></li>
                        </ul>
                    </li>
                    <li class="dropdown">
                        <a href="topCategory.mib" class="dropdown-toggle"  role="button" aria-expanded="false">TOP <span class="caret"></span></a>
                        <ul class="dropdown-menu" role="menu">
                            <li><a href="#">TEE</a></li>
                            <li><a href="#">COAT</a></li>
                            <li><a href="#">KNIT</a></li>
                            <li><a href="#">HOOD</a></li>
                        </ul>
                    </li>
                    <li class="dropdown">
                        <a href="pantsCategory.mib" class="dropdown-toggle"  role="button" aria-expanded="false">PANTS <span class="caret"></span></a>
                        <ul class="dropdown-menu" role="menu">
                            <li><a href="#">PANTS</a></li>
                            <li><a href="#">JEANS</a></li>
                            <li><a href="#">COTTON PANTS</a></li>
                        </ul>
                    </li>
                    <li class="dropdown">
                        <a href="shoesCategory.mib" class="dropdown-toggle"  role="button" aria-expanded="false">SHOES <span class="caret"></span></a>
                        <ul class="dropdown-menu" role="menu">
                            <li><a href="#">COAT</a></li>
                            <li><a href="#">WALKER</a></li>
                            <li><a href="#">RUNNING SHOES</a></li>
                        </ul>
                    </li>
                    <li class="dropdown">
                        <a href="bnaCategory.mib" class="dropdown-toggle"  role="button" aria-expanded="false">BAG&ACC <span class="caret"></span></a>
                        <ul class="dropdown-menu" role="menu">
                            <li><a href="#">BAG</a></li>
                            <li><a href="#">BELT</a></li>
                            <li><a href="#">CAP</a></li>
                        </ul>
                    </li>
                <br>

            </div>
            <hr style="border: solid black 2px; margin-right: 50px; display: inline-block; width: 85%">
        </div><!-- /.navbar-collapse -->


    </div><!-- /.container-fluid -->
</nav>