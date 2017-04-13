<%--
  Created by IntelliJ IDEA.
  User: 35613
  Date: 2017-04-03
  Time: 오전 10:47
  To change this template use File | Settings | File Templates.
--%>

<%@page import="com.eagle.men_in_black.model.CeoMypageDto"%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="com.eagle.men_in_black.model.UserMypageDto" %>
<%@ page import="java.util.List" %>

<%
    UserMypageDto cancelList = (UserMypageDto) request.getAttribute("cancelList");
	String rootPath = request.getContextPath();
	CeoMypageDto dto = (CeoMypageDto)request.getAttribute("dto");
%>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.2.0/css/bootstrap.min.css">
<link rel="stylesheet" href="../../../../../css/Mib.css">

<script
        src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.1.1/jquery.min.js"></script>



<h1 align="center"><%=dto.getRETURN() %></h1>


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
                    <th class="boardone">분류</th>
                    <th>상품이름</th>
                    <th class="boardone">수량</th>
                    <th class="boardtwo">판매가</th>
                    <th class="boardtwo">쿠폰</th>
                    <th class="boardtwo">적립금</th>
                    <th>결제금액</th>
                    <th class="#boardthree">판매일</th>
                    <th>상태</th>
                </tr>


                <tr height="30px">
                    <td class="boardone" rowspan="2"><img alt="not found"
                                                          src="..<%=rootPath %>/images/<%=cancelList.getSTORED_NAME() %>" style="width: 100px; height: 100px">
                    </td>
                    <td class="boardone" rowspan="2" valign="middle"><%=cancelList.getSUB_ITEM()%>
                    </td>
                    <td><%=cancelList.getPRO_NAME()%>
                    </td>
                    <td class="boardone" rowspan="2" valign="middle"><%=cancelList.getSEL_NUM()%>
                    </td>
                    <th class="boardtwo" rowspan="2" valign="middle"><%=cancelList.getPRO_PRICE()%>
                    </th>
                    <th class="boardtwo" rowspan="2" valign="middle"><%=cancelList.getCOUPON()%>
                    </th>
                    <th class="boardtwo" rowspan="2" valign="middle"><%=cancelList.getPOINT()%>
                    </th>
                    <td rowspan="2" valign="middle"><%=cancelList.getFINAL_PRICE()%>
                    </td>
                    <th class="#boardthree" rowspan="2" valign="middle"><%=cancelList.getSEL_TIME()%>
                    </th>
                    <td rowspan="2" valign="middle"><%=cancelList.getDEL_STEP()%>

                    </td>
                </tr>
                <tr>
                    <td><%=cancelList.getSEL_SIZE()%> : <%=cancelList.getSEL_COLOR()%>
                    </td>
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
    <select class='form-control' id="sel" onchange="selectForm(this.value);" style="width: 100px">
       
       
        <option value="<%=dto.getRETURN()%>" selected="selected"><%=dto.getRETURN()%></option>
       
        
    </select>
    <br>

    <div id="inputBox" align="center">
    <%if(dto.getRETURN().equals("교환")){ %>
	<div style='float: left; width: 48%;margin-left: 1%'>교환받을 옵션<textarea class='form-control' id ='RE_OPTION'  name='RE_OPTION' rows='10'><%=dto.getRE_OPTION() %> </textarea></div>
    <div style='float: left; width: 48%; margin-left: 1%'>교환 사유<textarea class='form-control' value='' name='RE_REASON'  id ='RE_REASON' rows='10'><%=dto.getRE_REASON() %></textarea></div>
	<%}else if(dto.getRETURN().equals("반품")){ %>
	
     			<div><label>반품 사유<textarea class='form-control' id ='RE_REASON' name='RE_REASON' value='' rows='10' style='resize: none; wrap:hard;'><%=dto.getRE_REASON() %></textarea> 
                <label>환불 계좌<input class='form-control' name='CA_ACCOUNT' id='CA_ACCOUNT' type='text' value="<%=dto.getCA_ACCOUNT()%>"></label></div>

	
	<%}%>

    </div>
<center>
    <input class="btn btn-default" type="button" value="확정" onclick="closeSelf()" style="margin-left: 2px" style="display: inline-block">
    <input class="btn btn-default" type="button" value="돌아가기" onclick="window.close()" style="display: inline-block">
    <input type="hidden" name="DEL_SEQ" value=<%=cancelList.getDEL_SEQ() %>>
    <input type="hidden" name="commend" value="">
</center>

</form>


<script type="text/javascript">

    	
        $.ajax({
            type: "POST",
            url: "cancelceo.mib",
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


