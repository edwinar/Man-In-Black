<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://tiles.apache.org/tags-tiles" prefix="tiles" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
    <meta name="viewport" content="width=device-width, initial-scale=1">
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.2.0/css/bootstrap.min.css">
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.2.0/css/bootstrap-theme.min.css">
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.1.1/jquery.min.js"></script>
	<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.2.0/js/bootstrap.min.js"></script>
	
	<style>
	body{padding-top: 102px;}
	#wrap {
	    margin: 0 auto;
	    padding-top: 1px;
	}
	.header{
	font-weight: bold;

	}
	.footer{
	text-align: center;
	}
    .header{
     padding-top: 3px;
    }
	#wrap .container {
	    width: 100%;
	        background: white;
	}
	</style>
</head>
<body>
    <div id="wrap">
        <div class="container">
            <div class="row">
                <div class="col-md-8 col-md-offset-2 header">
                    <tiles:insertAttribute name="header" />
                </div>
            </div>

            <div class="row">

                <div class="col-md-2 left">
                    <tiles:insertAttribute name="left" />
                </div>

                <div class="col-md-8 main">
                    <tiles:insertAttribute name="main" />
                </div>
                <div class="col-md-2">
                    <tiles:insertAttribute name="right" />
                </div>
            </div>


            <div class="row">
                <div class="col-md-12 footer">
                    <tiles:insertAttribute name="footer" />
                </div>
            </div>
        </div>
    </div>
</body>
</html>
