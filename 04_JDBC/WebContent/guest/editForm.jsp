<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%-- 전달받은 파라미터 값 화면에 표시 --%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>수정</title>
</head>
<body>
	<h1>[<%=request.getParameter("name") %>]의 정보 수정</h1>
	<form action="update.jsp" method="post">
		<table>
			<tr>
				<th>사번</th>
				<td>
					<!-- 사번은 수정 안되도록 !  -->
					<input type="text" name="sabun" readonly
						value="<%=request.getParameter("idx") %>">
				</td>
			</tr>
			<tr>
				<th>성명</th>
				<td>
					<input type="text" name="name" 
						value="<%=request.getParameter("name") %>">
				</td>
			</tr>
			<tr>
				<th>금액</th>
				<td>
					<input type="text" name="pay" 
						value="<%=request.getParameter("pay") %>">
				</td>
			</tr>
			<tr>
				<td colspan="2">
					<input type="submit" value="수정">
					<input type="reset" value="다시 작성">
				</td>
			</tr>
		</table>
	</form>
</body>
</html>