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
<input type="hidden" value="<%=basketlist.size()+1 %>" id="list">
<center>
<div id="mypagehead">
<h4 align="right" style="margin-right: 100px"><a href="meninblack.mib">홈</a> > 
<a href="mymain.mib">MY PAGE</a> > 
<a href="basketlist.mib">장바구니</a></h4>
<h3>MY Order</h3>
<h4>회원님의 장바구니 입니다.</h4>
</div>
</center>
	<div id="total" style="height: 900px; margin-top: 100px">
		<div id="table" style="width: 90%">
			<form name="f1">
				<table class="table">
					<col width="5%">
					<col width="5%">
					<col width="9%">
					<col width="50%">
					<col width="10%">
					<tr>
						<th><input type="checkbox" id="allCheck"
							class="chbox" style="width: 20px; height: 20px"></th>
						<th>번호</th>
						<th>이미지</th>
						<th>상품정보</th>
						<th>가격</th>
					</tr>
						<%for(int i = 0; i<basketlist.size();i++){ %>
					<tr>
						<td rowspan="2">
						<input type="checkbox" onclick="ty(<%=i+1 %>)"
							value="<%=basketlist.get(i).getPRO_SEQ() %>" id="ch1" class="chbox" style="width: 20px; height: 20px"></td>

						<td rowspan="2"><%=i+1 %>
						
			
						<td rowspan="2"><img alt="not found" src="../images/LOVE.jpg"
							style="width: 100px; height: 100px"></td>
						<td><%=basketlist.get(i).getPRO_NAME() %></td>
						<td rowspan="2" id="price<%=i+1%>"><%=basketlist.get(i).getPRO_PRICE() %></td>
					</tr>
					<tr>
						<td><%=basketlist.get(i).getPRO_SIZE()%> : <%=basketlist.get(i).getCOLOR() %></td>
					</tr>
					<% }%>
				
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
						<td><input type="text" id="pay" value="" readonly="readonly">
						</td>
						<td>+</td>
						<td><input type="text" id="tag" value="" readonly="readonly">
						</td>
						<td>=</td>
						<td><input type="text" id="top" value="" readonly="readonly">
						</td>
					</tr>
				</table>


			</form>

		</div>
<div id="결제"><input type="button" value="결제하기" onclick="location.href='Detail_Buy_Info.mib'"> </div>
	</div>
	<script type="text/javascript">
		var b = 0;
		var sum = 0;
		var list = $("#list").val();

		function ty(n) {
			if (document.f1.elements[n].checked == true) {
			    console.log('트루들어옴')
				b += Number(document.getElementById('price'+[n]).childNodes[0].nodeValue);

                bas_seq.append()
				document.getElementById('pay').value = b;
				if (b < 50000) {
					document.getElementById('top').value = b + 2500;
					document.getElementById('tag').value = 2500;
				} else {
					document.getElementById('top').value = b;
					document.getElementById('tag').value = "무료";
				}

			} else if (document.f1.elements[n].checked == false) {
				b -= Number(document.getElementById('price'+[n]).childNodes[0].nodeValue);
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
				for (var i = 1; i < list; i++) {
					if (document.f1.elements[i].checked == true) {
						b += Number(document.getElementById('price'+[n]).childNodes[0].nodeValue);
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






		
	</script>
<script type="text/javascript">
    function deletes() {
        var bas_seq = "";
        var list = $("#list").val();

        for (var i = 1; i < list; i++) {
            if(i = list-1){
                if (document.f1.elements[i].checked == true) {
                    bas_seq += String(document.f1.elements[i].value);
                }
            }
            else if (document.f1.elements[i].checked == true) {
                bas_seq += String(document.f1.elements[i].value + ',');
            }


        }
        document.location.href='basketdelete.mib?bas_num='+bas_seq;

    }

</script>

		<input type="button" id="delete" align="right" value="삭제하기" onclick="deletes()">

</body>
</html>