<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>요청</title>
<script>
	function send_forward(frm) { //포워딩 방식 응답 처리
		frm.action="ex10_resp_forward.jsp"
		frm.submit();
	}
	function send_redirect(frm) { //리다이렉트 방식 처리
		frm.action="ex10_resp_redirect.jsp"
		frm.submit();
	}
</script>
</head>
<body>
	<form>
		아이디 : <input type="text" name="id"><br>
		패스워드 : <input type="text" name="pwd"><br>
		<input type="button" value="포워딩(forward)" onclick="send_forward(this.form)">
		<input type="button" value="리다이렉트 (redirect)" onclick="send_redirect(this.form)">
	</form>
</body>
</html>