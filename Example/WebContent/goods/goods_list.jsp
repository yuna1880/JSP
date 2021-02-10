<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%
	String category=(String) request.getAttribute("category");
	String price=(String) request.getAttribute("price");
	int nowpage=1;
	if(request.getParameter("page")!=null){
		nowpage=Integer.parseInt(request.getParameter("page"));
	}
	int count=((Integer)(request.getAttribute("count"))).intValue();
	int pageCount=((Integer)(
			request.getAttribute("pageCount"))).intValue();
	int startPage=((Integer)(
			request.getAttribute("startPage"))).intValue();
	int endPage=((Integer)(
			request.getAttribute("endPage"))).intValue();
%>

<html>
<head>
<title>���θ�</title>
<script>
function searchPrice(item,searchprice) {
	if (searchprice!="all") {
		window.location.href=
		"GoodsList.go?item="+item+"&page=1&searchprice="+searchprice;
	} else {
		window.location.href="GoodsList.go?item="+item+"&page=1";
	}
}
</script>
</head>
<body>		
	<table width="960" cellspacing="0" cellpadding="0" border="0" 
		align="center">
	<tr>
	<td colspan=2>
	<table width=700 height="460" border="0" align="center">
		<tr valign="middle">
			<td height="50" width="700" align="right" valign="middle" 
				colspan="4">
			-��ǰ ���-&nbsp;
			<a href="javascript:searchPrice('<%=category%>','1~3')">
			[3���� �̸�]
			</a>
			<a href="javascript:searchPrice('<%=category%>','3~5')">
			[3~5����]
			</a>
			<a href="javascript:searchPrice('<%=category%>','5~7')">
			[5~7����]
			</a>
			<a href="javascript:searchPrice('<%=category%>','7~10')">
			[7~10����]
			</a>
			<a href="javascript:searchPrice('<%=category%>','10')">
			[10���� �̻�]
			</a>
			<a href="javascript:searchPrice('<%=category%>','all')">
			[��ü ����]
			</a>
			</td>
		</tr>
		
		<tr>
		<td valign="top">
		<!-- ��ǰ ����Ʈ -->
		<table border="0">
		<tr>	   
		   <c:choose> 
				<c:when test=
					"${requestScope.itemList[0].GOODS_NUM==null}">
					<tr>
					<td width="700" height="300" align="center">
					��ϵ� ���� �����ϴ�.
					</td>
					</tr>
				</c:when>
				
				<c:otherwise> 
				<c:forEach var="item" items="${requestScope.itemList}">
				<td width="180" valign="top" >
				<br>
				<div align="center">
				<%if(category.equals("new_item")) { 
			      	if(price.equals("no")) {
				%>
				<a href="Goods_Detail.go?item=${item.GOODS_CATEGORY}
						&gr_goods_num=${item.GOODS_NUM}&isitem=new">
				<%	}else{ %>
				<a href="Goods_Detail.go?item=${item.GOODS_CATEGORY}
						&gr_goods_num=${item.GOODS_NUM}
						&isitem=new&price=${price}">
				<% 	}
			      }else if (category.equals("hit_item")) { 
			      	if(price.equals("no")) {
			 	%>
				<a href="Goods_Detail.go?item=${item.GOODS_CATEGORY}
						&gr_goods_num=${item.GOODS_NUM}&isitem=hit">
				<% 	}else{ %>
				<a href="Goods_Detail.go?item=${item.GOODS_CATEGORY}
						&gr_goods_num=${item.GOODS_NUM}
						&isitem=hit&price=${price}">
				<%	}
			      } else { 
					if(price.equals("no")) {
				%>
				<a href="Goods_Detail.go?item=${item.GOODS_CATEGORY}
						&gr_goods_num=${item.GOODS_NUM}&isitem=other">
				<% 	}else{ %>
				<a href="Goods_Detail.go?item=${item.GOODS_CATEGORY}
						&gr_goods_num=${item.GOODS_NUM}
						&isitem=other&price=${price}">
				<%	}
				 }
				%>
			 	
			 	<img src="./upload/${fn:trim(item.GOODS_IMAGE)}" 
			 		width="130" height="130" border="0"/>
			 	<br/>${item.GOODS_NAME}<br/>
				</a>
				<br/><b>${item.GOODS_PRICE}��</b>
				</div>
				<br>
				</td>
				</c:forEach>
				</c:otherwise>
			</c:choose>
		</tr>
		</table>
		<!-- ��ǰ ����Ʈ -->
		</td>
		</tr>
		<tr>
		<td height="20" colspan="4" align="center">		
		<!-- ����¡ -->
		<%
		if (count>0) {
			if (startPage>10) { %>
			<a href="GoodsList.go?item=<%=category%>&
					page=<%=startPage-1%>">[����]</a>
			<% }
			for (int i=startPage;i<=endPage ; i++) { 
				if (i==nowpage) {   %>
				<font color=red>[<%=i%>]</font>
				<% } else { 
					if (price.equals("no")) {
				%>
					<a href="GoodsList.go?item=<%=category%>
						&page=<%=i%>">[<%=i%>]</a>
					<% } else { %>  
					<a href="GoodsList.go?item=<%=category%>
						&page=<%=i%>&searchprice=<%=price%>">[<%=i%>]</a>
					<%
			 		 }
				}
			}
			if (endPage<pageCount) { %>
			<a href="GoodsList.go?item=<%=category%>
					&page=<%=endPage+1%>">[����]</a>
			<%
			}
		}
		%>			
		<!-- ����¡ -->
		</td>
		</tr>
		</table>
		</td>
	</tr>
	</table>
</body>
</html>