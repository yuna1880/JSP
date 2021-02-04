<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>DELETE (check password)</title>
</head>
<body>
	<form action="delete_ok.jsp" method="post">
		Password : <input type="password" name="pwd" size="12">
		<input type="button" value="삭제" onclick="del_go(this.form)">
	</form>
<script>
	function del_go(frm) {
		if(frm.pwd.value == "${bvo.pwd}") { //암호 문자열 처리 잊지말기
			var isDelete = confirm("작성된 글이 삭제됩니다. 삭제하시겠습니까?");
			if (isDelete) {
				frm.submit();
			} else {
				history.back();
			}
		} else {
			alert("암호가 다릅니다. 다시 확인후 시도해 주세요.");
			frm.pwd.value = "";
			frm.pwd.focus();
		}
	}
</script>
</body>
</html>