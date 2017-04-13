<%@page import="com.eagle.men_in_black.model.CeoMypageDto"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<%
	List<CeoMypageDto> list = (List<CeoMypageDto>)request.getAttribute("list");
	String rootPath = request.getContextPath();

%>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
	<table class="table">
					<col width="5%">
					<col width="8%">
					<col width="20%">
					<col width="10%">
					<col width="10%">
					<col width="10%">
					<col width="10%">
					<col width="15%">
					<tr>
						<th>상품</th>
						<th>분류</th>
						<th>상품이름</th>
						<th>구매사이즈</th>
						<th>구매색상</th>
						<th>상품구매수량</th>
						<th>남은재고</th>
						<th>구매자</th>
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
						<td><%=list.get(i).getSTOCK() %></td>
						<td><%=list.get(i).getUSER_ID() %></td>
					</tr>
				<%}
				}
				%>	
				
				</table>
</body>
</html>