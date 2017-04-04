<%--
  Created by IntelliJ IDEA.
  User: 35613
  Date: 2017-04-03
  Time: 오전 10:47
  To change this template use File | Settings | File Templates.
--%>

<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="com.eagle.men_in_black.model.UserMypageDto" %>
<%@ page import="java.util.List" %>

<%
    UserMypageDto cancelList = (UserMypageDto) request.getAttribute("cancelList");
%>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.2.0/css/bootstrap.min.css">

<h1 align="center">교환 환불 취소</h1>

<form action="cancel.mib" method="post">
    <select onchange="selectForm(this.value);">
        <option value="">구분</option>
        <option value="취소">취소</option>
        <option value="반품">반품</option>
        <option value="교환">교환</option>
    </select>

    <div id="total" style="margin-top: 100px" align="center">
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
                                                      src="../images/LOVE.jpg" style="width: 100px; height: 100px"></td>
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


        </table>
            </div>
    </div>


    <div id="inputBox">


    </div>
    <br>

    <input class="button" type="submit" value="확정" >
    <input class="button" type="button" value="돌아가기" onclick="window.close()">
    <input type="hidden" name="DEL_SEQ" value=<%=cancelList.getDEL_SEQ() %>>

</form>


<script type="text/javascript">




    function selectForm(commend) {
        var strInput = "";
        inputBox.innerHTML = "";

        if (commend == '교환') {
            strInput = "<label>원하는 옵션 작성<textarea name='RE_OPTION' rows=10 , style='width:100%;overflow:visible;text-overflow:ellipsis;resize: none;border: solid black 2px;'> </textarea></label><br><br>" +
                "<label>교환사유 작성해주세요<textarea name='RE_REASON' rows='10', style='width:100%;overflow:visible;text-overflow:ellipsis;resize: none;border: solid black 2px;'> </textarea> </label><br>" +
                "<input type='hidden' name='commend' value="+commend+">";
        } else if (commend == '반품') {
            strInput = "<label>반품 사유 작성<textarea name='CA_REASON' rows='10', style='width:100%;overflow:visible;text-overflow:ellipsis;resize: none;border: solid black 2px;'> </textarea><br><br>" +
                "<label>환불받을 계좌<br><select  class='product_iinput'>" +
                "<option value=''>-선택-</option>" +
                "<option value='SC제일은행'>SC제일은행</option>" +
                "<option value='경남은행'>경남은행</option>" +
                "<option value='광주은행'>광주은행</option>" +
                "<option value='국민은행'>국민은행</option>" +
                "<option value='굿모닝신한증권'>굿모닝신한증권</option>" +
                "<option value='기업은행'>기업은행</option>" +
                "<option value='농협중앙회'>농협중앙회</option>" +
                "<option value='농협회원조합'>농협회원조합</option>" +
                "<option value='대구은행'>대구은행</option>" +
                "<option value='대신증권'>대신증권</option>" +
                "<option value='대우증권'>대우증권</option>" +
                "<option value='동부증권'>동부증권</option>" +
                "<option value='동양종합금융증권'>동양종합금융증권</option>" +
                "<option value='메리츠증권'>메리츠증권</option>" +
                "<option value='미래에셋증권'>미래에셋증권</option>" +
                "<option value='뱅크오브아메리카(BOA)'>뱅크오브아메리카(BOA)</option>" +
                "<option value='부국증권'>부국증권</option>" +
                "<option value='부산은행'>부산은행</option>" +
                "<option value='산림조합중앙회'>산림조합중앙회</option>" +
                "<option value='산업은행'>산업은행</option>" +
                "<option value='삼성증권'>삼성증권</option>" +
                "<option value='상호신용금고'>상호신용금고</option>" +
                "<option value='새마을금고'>새마을금고</option>" +
                "<option value='수출입은행'>수출입은행</option>" +
                "<option value='수협중앙회'>수협중앙회</option>" +
                "<option value='신영증권'>신영증권</option>" +
                "<option value='신한은행'>신한은행</option>" +
                "<option value='신협중앙회'>신협중앙회</option>" +
                "<option value='에스케이증권'>에스케이증권</option>" +
                "<option value='에이치엠씨투자증권'>에이치엠씨투자증권</option>" +
                "<option value='엔에이치투자증권'>엔에이치투자증권</option>" +
                "<option value='엘아이지투자증권'>엘아이지투자증권</option>" +
                "<option value='외환은행'>외환은행</option>" +
                "<option value='우리은행'>우리은행</option>" +
                "<option value='우리투자증권'>우리투자증권</option>" +
                "<option value='우체국'>우체국</option>" +
                "<option value='유진투자증권'>유진투자증권</option>" +
                "<option value='전북은행'>전북은행</option>" +
                "<option value='제주은행'>제주은행</option>" +
                "<option value='키움증권'>키움증권</option>" +
                "<option value='하나대투증권'>하나대투증권</option>" +
                "<option value='하나은행'>하나은행</option>" +
                "<option value='하이투자증권'>하이투자증권</option>" +
                "<option value='한국씨티은행'>한국씨티은행</option>" +
                "<option value='한국투자증권'>한국투자증권</option>" +
                "<option value='한화증권'>한화증권</option>" +
                "<option value='현대증권'>현대증권</option>" +
                "<option value='홍콩상하이은행'>홍콩상하이은행</option>" +
                "</select></label>" +
                "<input name='CA_ACCOUNT' type='text' placeholder='계좌번호를 적으세요'>" +
                "<input type='hidden' name='commend' value="+commend+">";

        } else if (commend == '취소') {
            strInput = "&nbsp;&nbsp;" +
                "<label>환불받을 계좌<br><select name='used_bankname'  class='product_iinput'>" +
                "<option value=''>-선택-</option>" +
                "<option value='SC제일은행'>SC제일은행</option>" +
                "<option value='경남은행'>경남은행</option>" +
                "<option value='광주은행'>광주은행</option>" +
                "<option value='국민은행'>국민은행</option>" +
                "<option value='굿모닝신한증권'>굿모닝신한증권</option>" +
                "<option value='기업은행'>기업은행</option>" +
                "<option value='농협중앙회'>농협중앙회</option>" +
                "<option value='농협회원조합'>농협회원조합</option>" +
                "<option value='대구은행'>대구은행</option>" +
                "<option value='대신증권'>대신증권</option>" +
                "<option value='대우증권'>대우증권</option>" +
                "<option value='동부증권'>동부증권</option>" +
                "<option value='동양종합금융증권'>동양종합금융증권</option>" +
                "<option value='메리츠증권'>메리츠증권</option>" +
                "<option value='미래에셋증권'>미래에셋증권</option>" +
                "<option value='뱅크오브아메리카(BOA)'>뱅크오브아메리카(BOA)</option>" +
                "<option value='부국증권'>부국증권</option>" +
                "<option value='부산은행'>부산은행</option>" +
                "<option value='산림조합중앙회'>산림조합중앙회</option>" +
                "<option value='산업은행'>산업은행</option>" +
                "<option value='삼성증권'>삼성증권</option>" +
                "<option value='상호신용금고'>상호신용금고</option>" +
                "<option value='새마을금고'>새마을금고</option>" +
                "<option value='수출입은행'>수출입은행</option>" +
                "<option value='수협중앙회'>수협중앙회</option>" +
                "<option value='신영증권'>신영증권</option>" +
                "<option value='신한은행'>신한은행</option>" +
                "<option value='신협중앙회'>신협중앙회</option>" +
                "<option value='에스케이증권'>에스케이증권</option>" +
                "<option value='에이치엠씨투자증권'>에이치엠씨투자증권</option>" +
                "<option value='엔에이치투자증권'>엔에이치투자증권</option>" +
                "<option value='엘아이지투자증권'>엘아이지투자증권</option>" +
                "<option value='외환은행'>외환은행</option>" +
                "<option value='우리은행'>우리은행</option>" +
                "<option value='우리투자증권'>우리투자증권</option>" +
                "<option value='우체국'>우체국</option>" +
                "<option value='유진투자증권'>유진투자증권</option>" +
                "<option value='전북은행'>전북은행</option>" +
                "<option value='제주은행'>제주은행</option>" +
                "<option value='키움증권'>키움증권</option>" +
                "<option value='하나대투증권'>하나대투증권</option>" +
                "<option value='하나은행'>하나은행</option>" +
                "<option value='하이투자증권'>하이투자증권</option>" +
                "<option value='한국씨티은행'>한국씨티은행</option>" +
                "<option value='한국투자증권'>한국투자증권</option>" +
                "<option value='한화증권'>한화증권</option>" +
                "<option value='현대증권'>현대증권</option>" +
                "<option value='홍콩상하이은행'>홍콩상하이은행</option>" +
                "</select></label>" +
                "<input id='CA_ACCOUNT' type='text' placeholder='계좌번호를 적으세요'>" +
                "<input type='hidden' name='commend' value="+commend+">";

        }
        inputBox.innerHTML = strInput;
    }




    function closeSelf(){
        var formData = new FormData();
        var commend = document.getElementsByName(commend).value
        if (commend == '교환'){
            formData.append("RE_REASON", $("input[name=RE_REASON]").val());
            formData.append("RE_OPTION", $("input[name=RE_OPTION]").val());
        }else if (commend == '반품'){
            formData.append("RE_REASON", $("input[name=RE_REASON]").val());
            formData.append("CA_ACCOUNT", $("input[name=CA_ACCOUNT]").val());
        }else if (commend == '취소'){
            formData.append("CA_ACCOUNT", $("input[name=CA_ACCOUNT]").val());
        }
        formData.append("DEL_SEQ", $("input[name=DEL_SEQ]").val());
        formData.append("commend", $("input[name=commend]").val());



        $.ajax({
            type : "POST",
            url : "cancel.mib",
            async : true,
            dataType : "html",
            data : formData,
            processData: false,
            contentType: false,
            success : function(data) {
                //alert("success " + data);
                var flag = $.parseJSON(data);

                if(flag.result=='OK'){
                    window.close();
                }else{
                    alert("리뷰등록실패");
                }
            },
            complete : function(data) {
            },
            error : function(xhr, status, error) {
                alert("에러발생");
            }
        });

    }

</script>


