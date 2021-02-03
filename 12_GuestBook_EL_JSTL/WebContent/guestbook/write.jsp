<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>입력화면</title>
<link href="/12_GuestBook_EL_JSTL/css/guestbook.css" rel="stylesheet">
</head>
<body>

<div id="container">
	<h2 class="table-title"> GuestBook - Write</h2>
	<hr>
	<p><a href="list.jsp"class="link-3"> ★ Back to the List - Click Here!★</a></p>
	
	<form action="write_ok.jsp" method="post">
	<table>
		<tbody>
			<tr>
				<th>작성자</th>
				<td><input type="text" name="name"></td>
			</tr>
			<tr>
				<th>제목</th>
				<td><input type="text" name="subject"></td>
			</tr>
			<tr>
				<th>이메일</th>
				<td><input type="text" name="email"></td>
			</tr>
			<tr>
				<th>비밀번호</th>
				<td><input type="text" name="pwd"></td>
			</tr>
			<tr>
				<td colspan="2">
					<textarea name="content" rows="5" cols="60"></textarea>
				</td>
			</tr>
		</tbody>
		<tfoot>
			<tr>
				<td colspan="2">
					<input type="submit" value="저 장">
					<input type="reset" value="취 소">
				</td>
			</tr>
		</tfoot>
	</table>
	</form>
</div>


</body>
</html>








