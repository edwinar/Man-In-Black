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
    //UserMypageDto cancelList = (UserMypageDto) request.getAttribute("cancelList");
	String rootPath = request.getContextPath();
	CeoMypageDto dto = (CeoMypageDto)request.getAttribute("dto");
	List<CeoMypageDto> list = (List<CeoMypageDto>)request.getAttribute("list");
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
					<col width="5%">
					<col width="8%">
					<col width="10%">
					<col width="10%">
					<col width="10%">
					<col width="10%">
					<tr>
					<th style="border: 0;"></th>
					<th style="border: 0;"></th>
					<th style="border: 0;"></th>
				<th colspan="1" style="text-align: center;">쿠폰사용</th>
				<th colspan="1" style="text-align: center;">포인트사용</th>
				<th></th>
				<th colspan="1" style="text-align: center;">결제금액</th>
				</tr>
				<tr>
				<th style="border: 0;"></th>
				<th style="border: 0;"></th>
				<th style="border: 0;"></th>
				<td colspan="1" style="text-align: center;"><%=list.get(0).getPOINT() %></td>
				<td colspan="1" style="text-align: center;"><%=list.get(0).getCOUPON() %></td>
				<td></td>
				<td colspan="1" style="text-align: center;"><%=list.get(0).getFINAL_PRICE() %></td>
				</tr>
					<tr>
						<th>상품</th>
						<th>상품이름</th>
						<th>구매사이즈</th>
						<th>구매색상</th>
						<th>상품구매수량</th>
						<th>상품가격</th>
					</tr>

				<%
				
				if(list==null || list.size()==0){%>
				<tr>
					<td colspan="999999">내역이 없습니다.</td>
				</tr>
				</table>
				</form>
				</div>
				</div>
				<%}else{
				for(int i=0; i<list.size(); i++){ 
					
				%>
					<tr>
						<td><img alt="not found" src="..<%=rootPath %>/images/<%=list.get(i).getSTORED_NAME() %>"
							style="width: 100px; height: 100px"></td>
						<td>
						<%=list.get(i).getITEM() %> 
						</td>
						<td><%=list.get(i).getPRO_NAME() %></td>
						<td><%=list.get(i).getSEL_SIZE() %></td>
						<td><%=list.get(i).getSEL_COLOR() %></td>
						<td><%=list.get(i).getSEL_NUM() %></td>
						<td><%=list.get(i).getPRO_PRICE() %></td>
						<td><%=list.get(i).getSTOCK() %></td>
						<td><%=list.get(i).getUSER_ID() %></td>
					</tr>
				<%}
				}
				%>	
				
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


