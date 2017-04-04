<%--
  Created by IntelliJ IDEA.
  User: 35613
  Date: 2017-04-03
  Time: 오전 10:47
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<h1>교환 환불 취소</h1>



<%--<div id="total" style="margin-top: 100px">--%>
    <%--<div id="table" style="width: 90%">--%>
        <%--<form name="f1">--%>
            <%--<table class="table">--%>
                <%--<col width="9%">--%>
                <%--<col width="7%">--%>
                <%--<col width="23%">--%>
                <%--<col width="6%">--%>
                <%--<col width="6%">--%>
                <%--<col width="7%">--%>
                <%--<col width="7%">--%>
                <%--<col width="7%">--%>
                <%--<col width="9%">--%>
                <%--<col width="12%">--%>
                <%--<col width="7%">--%>
                <%--<tr height="40px">--%>
                    <%--<th class="boardone">이미지</th>--%>
                    <%--<th class="boardone">분류</th>--%>
                    <%--<th>상품이름1234512</th>--%>
                    <%--<th class="boardone">수량</th>--%>
                    <%--<th class="boardtwo">판매가</th>--%>
                    <%--<th class="boardtwo">쿠폰</th>--%>
                    <%--<th class="boardtwo">적립금</th>--%>
                    <%--<th>결제금액</th>--%>
                    <%--<th class="#boardthree">판매일</th>--%>
                    <%--<th>상태</th>--%>
                <%--</tr>--%>
                <%--<%--%>
                    <%--if (buyList == null || buyList.size() == 0) {--%>
                <%--%>--%>
                <%--<tr>--%>
                    <%--<td colspan="9999">내역이 없습니다.</td>--%>
                <%--</tr>--%>
            <%--</table>--%>

        <%--</form>--%>

    <%--</div>--%>

<%--</div>--%>

<%--<div>--%>
    <%--<table>--%>

        <%--<%--%>
        <%--} else {--%>

            <%--for (int i = 0; i < buyList.size(); i++) {--%>
        <%--%>--%>

        <%--<tr height="30px">--%>
            <%--<td class="boardone" rowspan="2"><img alt="not found"--%>
                                                  <%--src="../images/LOVE.jpg" style="width: 100px; height: 100px"></td>--%>
            <%--<td class="boardone" rowspan="2" valign="middle"><%=buyList.get(i).getSUB_ITEM()%></td>--%>
            <%--<td><%=buyList.get(i).getPRO_NAME()%></td>--%>
            <%--<td class="boardone" rowspan="2" valign="middle"><%=buyList.get(i).getSEL_NUM()%></td>--%>
            <%--<th class="boardtwo" rowspan="2" valign="middle"><%=buyList.get(i).getPRO_PRICE()%></th>--%>
            <%--<th class="boardtwo" rowspan="2" valign="middle"><%=buyList.get(i).getCOUPON()%></th>--%>
            <%--<th class="boardtwo" rowspan="2" valign="middle"><%=buyList.get(i).getPOINT()%></th>--%>
            <%--<td rowspan="2" valign="middle"><%=buyList.get(i).getFINAL_PRICE()%></td>--%>
            <%--<th class="#boardthree" rowspan="2" valign="middle"><%=buyList.get(i).getSEL_TIME()%></th>--%>
            <%--<td rowspan="2" valign="middle"><%=buyList.get(i).getDEL_STEP()%>--%>
                <%--<input type="button" value="리뷰" onclick="go()">--%>

            <%--</td>--%>
        <%--</tr>--%>
        <%--<tr>--%>
            <%--<td><%=buyList.get(i).getSEL_SIZE()%> : <%=buyList.get(i).getSEL_COLOR()%></td>--%>
        <%--</tr>--%>
        <%--<%--%>
            <%--}--%>
        <%--%>--%>

    <%--</table>--%>



</div>


<form >
    <select onchange="selectForm(this.value);">
        <option value="">구분</option>
        <option value="취소">취소</option>
        <option value="반품">반품</option>
        <option value="교환">교환</option>
    </select>
    
    
    <div id="inputBox">



    </div>
    <br>
    
<input type="submit" value="확정">
    <input type="button" value="돌아가기" onclick="window.close()">

</form>







<script type="text/javascript">


function selectForm(commend) {
    var strInput = "";
    inputBox.innerHTML = "";

    if(commend=='교환'){

        strInput = "&nbsp;&nbsp;<textarea  placeholder= '원하는 옵션을 적으세요' , style='width:100%;border:1;overflow:visible;text-overflow:ellipsis;resize: none;' rows=30 > </textarea><br>" +
            "<textarea cols= '30', rows='20', placeholder= '교환 사유를 적으세요'> </textarea><br>";

    }else if(commend=='반품'){
        strInput = "&nbsp;&nbsp;<textarea cols= '30', rows='20', placeholder= '반품사유를 적으세요'> </textarea><br>" +
            "<text placeholder='환불계좌를 적으세요'>";
    }else if(commend=='취소'){

        strInput = "&nbsp;&nbsp;" +
            "<option>기업</option>        " +
            "<option>국민 </option>       " +
            "<option> </option>     " +
            "<option> </option>     " +
            "<option> </option>     " +
            "<option> </option>     " +
            "<option> </option>     " +
            "<option> </option>     " +
            "<option> </option>     " +
            "<option> </option>     " +
            "<option> </option>     " +
            "<option> </option>     " +
            "<option> </option>     " +
            "                       " +
            "" +
            "" +
            "" +
            "" +
            "" +
            "" +
            "" +
            "" +
            "" +
            "" +
            "" +
            "" +
            "<input type='text' placeholder='환불계좌를 적으세요' style='width: 500px;height: 25px;'>";
    }
    inputBox.innerHTML = strInput;
}










</script>