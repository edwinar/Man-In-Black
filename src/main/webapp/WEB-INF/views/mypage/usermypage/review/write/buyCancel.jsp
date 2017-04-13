<%--
  Created by IntelliJ IDEA.
  User: 35613
  Date: 2017-04-03
  Time: 오전 10:47
  To change this template use File | Settings | File Templates.
--%>

<%@page import="com.eagle.men_in_black.util.StringUtil"%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="com.eagle.men_in_black.model.UserMypageDto" %>
<%@ page import="java.util.List" %>

<%
    UserMypageDto cancelList = (UserMypageDto) request.getAttribute("cancelList");
	String rootPath = request.getContextPath();
%>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.2.0/css/bootstrap.min.css">
<link rel="stylesheet" href="../../../../../css/Mib.css">

<script
        src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.1.1/jquery.min.js"></script>


<h1 align="center">상품 교환&환불</h1>

<form>

    <div id="total" style="margin-top: 10px" align="center">
        <div id="table" style="width: 90%">
            <table class="table">
                <col width="9%">
                <col width="7%">
                <col width="23%">
                <col width="6%">
                <col width="6%">
                <col width="7%">
                <col width="7%">
                <col width="7%">
                <col width="9%">
                <col width="12%">
                <col width="7%">
                <tr height="40px">
                    <th class="boardone">이미지</th>
                    <th>상품이름</th>
                    <th class="boardone">수량</th>
                    <th class="boardtwo">쿠폰사용</th>
                    <th class="boardtwo">적립금사용</th>
                    <th>결제금액</th>
                    <th class="#boardthree">구매일</th>
                </tr>


                
                   <tr height="40px">
					<td class="boardone" ><img alt="not found" src="..<%=rootPath %>/images/<%=prophomap.get("STOREDNAME"+i)%>" style="width: 100px; height: 100px"></td>
					<td class="boardone" style="vertical-align: middle;"><%=prophomap.get("PRO_NAME"+i)%>  <%if(conum>0){ %> 외  <%=conum %>개<%} %> </td>
					<td class="boardone"  style="vertical-align: middle;"><%=prophomap.get("count"+i) %>개</td>
					<td class="boardtwo"  style="vertical-align: middle;"><%=StringUtil.NumFomat(cancelList.get(i).getCOUPON())%></td>
					<td class="boardtwo"  style="vertical-align: middle;"><%=StringUtil.NumFomat(cancelList.get(i).getPOINT())%></td>
					<td style="vertical-align: middle;"><%=StringUtil.NumFomat(cancelList.get(i).getFINAL_PRICE())%></td>
					<td class="#boardthree"  style="vertical-align: middle;"><%=cancelList.get(i).getDEL_TIME()%></td>
					<td style="vertical-align: middle;"><%=cancelList.get(i).getDEL_STEP()%></td>
				</tr>
             
                <tfoot>
                <tr>
                    <td colspan="20">

                    </td>
                </tr>
                </tfoot>


            </table>

        </div>
    </div>
    <%if (cancelList.getDEL_STEP().equals("상품준비")) { %>
        
        <%} else {%>
    <select class='form-control' id="sel" onchange="selectForm(this.value);" style="width: 100px">
        
        <option value="반품">반품</option>
        <option value="교환">교환</option>
       
    </select>
     <%
            }
        %>
    <br>

    <div id="inputBox" align="center">


    </div>
<center>
    <input class="btn btn-default" type="button" value="확정" onclick="closeSelf()" style="margin-left: 2px" style="display: inline-block">
    <input class="btn btn-default" type="button" value="돌아가기" onclick="window.close()" style="display: inline-block">
    <input type="hidden" name="DEL_SEQ" value=<%=cancelList.getDEL_SEQ() %>>
    <input type="hidden" name="commend" value="">
</center>

</form>


<script type="text/javascript">

    $(document).ready(function () {
        selectForm($("#sel option:first").val());
    });


    function selectForm(commend) {
        var strInput = "";
        inputBox.innerHTML = "";

        if (commend == '교환') {
            strInput = "<div style='float: left; width: 48%;margin-left: 1%'>교환받을 옵션<textarea class='form-control' id ='RE_OPTION'  name='RE_OPTION' rows='10'> </textarea></div>" +
                "<div style='float: left; width: 48%; margin-left: 1%'>교환 사유<textarea class='form-control' value='' name='RE_REASON'  id ='RE_REASON' rows='10'></textarea></div>";

        } else if (commend == '반품') {
            strInput = "<div><label>반품 사유<textarea class='form-control' id ='RE_REASON' name='RE_REASON' value='' rows='10' style='resize: none; wrap:hard;'></textarea> " +
                "<label>은행<select name='bank' id='bank' class='form-control' onclick='errorre()''>" +
                "<option value='' onclick='errorre()'>-선택-</option>" +
                "<option value='SC제일은행'>SC제일은행</option>" +
                "<option value='경남은행'>경남은행</option>" +
                "<option value='광주은행'>광주은행</option>" +
                "<option value='국민은행'>국민은행</option>" +
                "<option value='기업은행'>기업은행</option>" +
                "<option value='농협중앙회'>농협중앙회</option>" +
                "<option value='농협회원조합'>농협회원조합</option>" +
                "<option value='산업은행'>산업은행</option>" +
                "<option value='신한은행'>신한은행</option>" +
                "<option value='외환은행'>외환은행</option>" +
                "<option value='우리은행'>우리은행</option>" +
                "<option value='우리투자증권'>우리투자증권</option>" +
                "<option value='우체국'>우체국</option>" +
                "</select></label>" +
                "<label>환불 계좌<input class='form-control' name='CA_ACCOUNT' id='CA_ACCOUNT' type='text' onclick='error()'></label></label></div>";


        } 
        document.getElementsByName('commend').value = commend;
        inputBox.innerHTML = strInput;
    }

    
    
    function error() {
		var bank = $("#bank").find(":selected").val();
		if (bank == '' || bank == null) {
			alert("환불받을 은행을 선택해주세요 ");
			return;
			};
		};
		

    function closeSelf() {
        var formData = new FormData();
        var commend = document.getElementsByName('commend').value;
        var RE_REASON = $("#RE_REASON").val();


		
		
		if($("#RE_REASON").val() == '' || $("#RE_REASON").val() == null) {
			alert("사유를 작성해주세요 ");
			return;
			
		}else if($("#CA_ACCOUNT").val() == '' || $("#CA_ACCOUNT").val() == null) {
			alert("환불계좌를 입력하여주세요 ");
			return;
		}else{
			
			
        if ('교환' == commend) {
            formData.append("RE_REASON", $("textarea[name=RE_REASON]").val());
            formData.append("RE_OPTION", $("textarea[name=RE_OPTION]").val());


        } else if ('반품' == commend) {
            formData.append("RE_REASON", $("textarea[name=RE_REASON]").val());
            formData.append("CA_ACCOUNT", $("select[name=bank]").val() + " " + $("input[name=CA_ACCOUNT]").val());

        } 
        formData.append("DEL_SEQ", $("input[name=DEL_SEQ]").val());
        formData.append("commend", document.getElementsByName('commend').value);


        $.ajax({
            type: "POST",
            url: "cancel.mib",
            async: true,
            data: formData,
            dataType: "html",
            processData: false,
            contentType: false,
            success: function (data) {
                var flag = $.parseJSON(data);
                if (flag.result == 'success') {
                    alert("반영되었습니다");
                    opener.parent.location.reload();
                    window.close();
                } else {
                    alert("시스템 오류 잠시후 다시 시도해주세요 ");
                }
            },
            complete: function (data) {
            },
            error: function (xhr, status, error) {
                alert("빈칸없이 작성해주세요");
            }
        });

    }
    }
</script>


