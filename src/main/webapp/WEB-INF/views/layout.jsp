<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://tiles.apache.org/tags-tiles" prefix="tiles" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
	<link rel="stylesheet"
    href="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/css/bootstrap.min.css">
	<style>
	#wrap {
	    margin: 0 auto;
	    padding-top: 1px;
	}
	.top{
	font-weight: bold;
	max-height: 200px;
	}
	.header{
	font-weight: bold;
	margin-top: 15px;
	
	}
	
	.main{
	margin-top: 300px;
	height: 600px;
	border: 1px solid #000000;
	    border-collapse: collapse;
	    margin-bottom: 50px;
	}
	.right{
	}
	.footer{
	margin-top: 20px;
	text-align: center;
	}
	
	#wrap .container {
	    width: 100%;
	        background: #eee;
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
