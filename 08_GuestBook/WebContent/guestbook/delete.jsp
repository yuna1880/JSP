<%@page import="com.bc.mybatis.GuestbookVO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>삭제화면</title>
<link href="../css/guestbook.css" rel="stylesheet" type="text/css">
</head>
<body>
<div id="container">
	<h2 class="table-title">GuestBook - Delete</h2>
	<hr>
	<p><a href="list.jsp" href="list.jsp"class="link-3"> ★ Back to the List - Click Here!★ </a></p>
	
	<form action="delete_ok.jsp" method="post">
	<table>
		<tbody>
			<tr>
				<th>비밀번호</th>
				<td><input type="text" name="pwd">
					<input type="submit" value="삭 제">
				</td>
			</tr>
		</tbody>
	</table>
	</form>

</div>	

</body>
</html>