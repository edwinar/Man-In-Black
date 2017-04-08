<%@page import="com.eagle.men_in_black.model.UserMypageDto"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%
	List<UserMypageDto> basketlist = (List<UserMypageDto>) request.getAttribute("basketlist");
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link rel="stylesheet"
	href="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/css/bootstrap.min.css">
<style type="text/css">
/*체크박스 싸이즈 크게*/
.chbox {
	width: 20px;
	height: 20px
}

td, th {
	text-align: center;
}
</style>
<title>::장바구니::</title>
</head>
<body>

	<input type="hidden" value="<%=basketlist.size()%>" id="list">
	<center>
		<div id="mypagehead">
			<h4 align="right" style="margin-right: 100px">
				<a href="meninblack.mib">홈</a> > <a href="mymain.mib">MY PAGE</a> >
				<a href="basketlist.mib">장바구니</a>
			</h4>
			<h3>MY Order</h3>
			<h4 style="margin-bottom: 50px">회원님의 장바구니 입니다.</h4>
		</div>
	</center>



	<div id="total" style="height: margin-top: 150px;margin-left: 3%">
		<div>
			<div align="left">
			<input type="checkbox" id="allCheck" class="chbox"
				style="width: 20px; height: 20px; " >
				</div>
			<form name="f1">
				<table class="table">
					<col width="5%">
					<col width="5%">
					<col width="9%">
					<col width="50%">
					<col width="10%">
					<tr>
						<th>&nbsp</th>
						<th>번호</th>
						<th>이미지</th>
						<th>상품정보</th>
						<th>수량</th>
						<th>가격</th>	
					</tr>
					<%
						if (basketlist == null || basketlist.size() == 0) {
					%>
					<tr>
						<td colspan="9999">내역이 없습니다.</td>
					</tr>
					
					
					<tr height="200px"></tr>
					<%
						} else {
					%>

					<%
						for (int i = 0; i < basketlist.size(); i++) {
					%>
					<tr>
						<td rowspan="2"><input type="checkbox" onclick="ty(<%=i%>)"
							value="<%=basketlist.get(i).getBAS_SEQ()%>" id="ch1"
							class="chbox" style="width: 20px; height: 20px"></td>

						<td rowspan="2"><%=i + 1%>
						<td rowspan="2"><a href="detail.mib?PRO_SEQ=<%=basketlist.get(i).getPRO_SEQ()%>">
						<img alt="<%=basketlist.get(i).getSTORED_NAME()%>" src="<%=basketlist.get(i).getSTORED_NAME()%>"style="width: 100px; height: 100px"></a></td>
						<td><a href="detail.mib?PRO_SEQ=<%=basketlist.get(i).getPRO_SEQ()%>"><%=basketlist.get(i).getPRO_NAME()%></a></td>
						<td rowspan="2" id="num<%=i%>" valign="middle"><%=basketlist.get(i).getBAS_PRO_NUM()%></td>
						<td rowspan="1" id="price<%=i%>"><%=basketlist.get(i).getPRO_PRICE()%></td>
					</tr>
					<tr>
						<td><%=basketlist.get(i).getPRO_SIZE()%> : <%=basketlist.get(i).getCOLOR()%></td>
						<td>총:<%=basketlist.get(i).getPRO_PRICE()*basketlist.get(i).getBAS_PRO_NUM()%></td>
					</tr>
					<%
						}
						}
					%>

				</table>

				<table width="50%" align="center" class="table"
					style="margin-top: 100px">

					<tr>
						<td>상품가격</td>
						<td>+</td>
						<td>택배비(5만이상 무료)</td>
						<td>=</td>
						<td>총가격</td>
					</tr>
					<tr>
						<td><input type="text" id="pay" value="" readonly="readonly" class="form-control" style="text-align: center;">
						</td>
						<td>+</td>
						<td><input type="text" id="tag" value="" readonly="readonly" class="form-control" style="text-align: center;">
						</td>
						<td>=</td>
						<td><input type="text" id="top" value="" readonly="readonly" class="form-control" style="text-align: center;">
						</td>
					</tr>
				</table>


			</form>

		</div>
		<div align="right">
			<input type="button" id="delete"  value="삭제하기"
				onclick="deletes()" class="btn btn-default"
				style="width: 15%; margin-right: 1% ">
		
			<input type="button" id="buy"  align="right" value="결제하기" onclick="buy()"
				class="btn btn-default" style="width: 15%; margin-right: 10.5%">
		</div>
	</div>
	<script type="text/javascript">
		var b = 0;
		var sum = 0;
		var list = $("#list").val();

		function ty(n) {
			if (document.f1.elements[n].checked == true) {
				b += Number(Number(document.getElementById('num'+[n]).childNodes[0].nodeValue)*Number(document.getElementById('price'+[n]).childNodes[0].nodeValue));
				document.getElementById('pay').value = b;
				if (b < 50000) {
					document.getElementById('top').value = b + 2500;
					document.getElementById('tag').value = 2500;
				} else {
					document.getElementById('top').value = b;
					document.getElementById('tag').value = "무료";
				}

			} else if (document.f1.elements[n].checked == false) {
				b -= Number(Number(document.getElementById('num'+[n]).childNodes[0].nodeValue)*Number(document.getElementById('price'+[n]).childNodes[0].nodeValue));
					/* Number(document.getElementById('price'+[n]).childNodes[0].nodeValue) */;
				document.getElementById('pay').value = b;
				if (b < 50000) {
					document.getElementById('top').value = b + 2500;
					document.getElementById('tag').value = 2500;
				} else {
					document.getElementById('top').value = b;
					document.getElementById('tag').value = "무료";
				}
			}
		}

		$(function() {
			$("#allCheck").click(function() {
				b = 0;
				if ($("#allCheck").prop("checked")) {
					$(".chbox").prop("checked", true);
				} else if ($("#allCheck").prop("checked", false)) {
					$(".chbox").prop("checked", false);
				}
				for (var i =0 ; i < list; i++) {
					if (document.f1.elements[i].checked == true) {
						b += Number(Number(document.getElementById('num'+[i]).childNodes[0].nodeValue)*Number(document.getElementById('price'+[i]).childNodes[0].nodeValue));
						document.getElementById('pay').value = b;
						if (b < 50000) {
							document.getElementById('tag').value = 2500;
							document.getElementById('top').value = b + 2500;
							
						} else {
							document.getElementById('top').value = b;
							document.getElementById('tag').value = "무료";
						}
					} else {
						document.getElementById('pay').value = 0;
						document.getElementById('top').value = 0;
						document.getElementById('tag').value = 0;

					}
				}
			})

		});
		
		$(function() {
			$(".chbox").click(function(){		
			if(document.getElementById('pay').value == 0){
				document.getElementById('pay').value = 0;
				document.getElementById('top').value = 0;
				document.getElementById('tag').value = 0;
			}			
						
					}
				)
			});


        function deletes() {
            var BAS_SEQ = "";
            var list = $("#list").val();

            for (var i = 0; i < list; i++) {
               // alert("start");

                if (document.f1.elements[i].checked == true) {
                    BAS_SEQ += document.f1.elements[i].value + ",";
                   // alert(BAS_SEQ+'중간');
                }

            }
            
            if(BAS_SEQ==null || BAS_SEQ == ""){
            	alert("삭제할 상품이 없습니다.");
            }else{
            
            
            
            alert(BAS_SEQ);
            BAS_SEQ = BAS_SEQ.slice(0,-1);
            alert(BAS_SEQ + 'end');
            document.location.href='basketdelete.mib?BAS_SEQ='+BAS_SEQ;
            }

        }
        
        function buy() {
            var BAS_SEQ = "";
            var FINAL_PRICE = document.getElementById('top').value;
            var list = $("#list").val();

            for (var i = 0; i < list; i++) {
               // alert("start");

                if (document.f1.elements[i].checked == true) {
                	BAS_SEQ += document.f1.elements[i].value + ",";
                   // alert(BAS_SEQ+'중간');
                }

            }
            if(BAS_SEQ == null || BAS_SEQ == ""){
            	alert("결제할 상품이 없습니다.");
            }else{
            
            alert(BAS_SEQ);
            BAS_SEQ = BAS_SEQ.slice(0,-1);
            alert(BAS_SEQ + 'end');
            document.location.href='Detail_Buy_Info.mib?BAS_SEQ='+BAS_SEQ+'&FINAL_PRICE='+FINAL_PRICE;

        }
        }
		


	</script>




</body>
</html>