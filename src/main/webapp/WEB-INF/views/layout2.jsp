<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<%@ taglib uri="http://tiles.apache.org/tags-tiles" prefix="tiles"%>  

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">  

<html>    

<head>  

	<meta http-equiv="X-UA-Compatible" content="IE=edge"/>
	<meta name="viewport" content="user-scalable=no, initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0, width=device-width"/>
    <link rel="shortcut icon" type="image/x-icon" href="../images/favicon M4.png" />
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.2.0/css/bootstrap.min.css">
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.2.0/css/bootstrap-theme.min.css">
  	<link rel="stylesheet" href="../css/Mib.css">
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.1.1/jquery.min.js"></script>
	<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.2.0/js/bootstrap.min.js"></script>
	<script src="//developers.kakao.com/sdk/js/kakao.min.js"></script>
	<script src="http://dmaps.daum.net/map_js_init/postcode.v2.js"></script>

</head>

<body>

    <table border="0" cellpadding="0" cellspacing="0" style="width:100%;">

        <tr style="background-color: green;" height="30px">          

            <td height="20px" colspan="3" style="background-color: aqua;">

            	 <tiles:insertAttribute name="header" />

            </td>

        </tr>

        <tr>

            <td height="300" style="width:10%; background-color: red;" >

            	<tiles:insertAttribute name="left" />

            </td>

            <td width="100" style=" padding:5%; background-color: maroon;">

            	<tiles:insertAttribute name="main" />

            </td>
			
			<td height="300" style="width:10%; background-color: blue;">
			 
                 <tiles:insertAttribute name="right" />
           
			</td>
			
        </tr>

    <tr>

        <td height="30" colspan="2">

        	<tiles:insertAttribute name="footer" />

        </td>

    </tr>

    </table>

</body>

</html>