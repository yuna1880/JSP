<%@page import="com.bc.mybatis.GuestbookVO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%-- 수정할 데이터를 화면에 표시 --%>
<%
	//수정할 데이터 확인
	System.out.println("session guestbookVO : " + session.getAttribute("guestbookVO"));
	//세션스코프에 vo 저장
	//GuestbookVO vo = (GuestbookVO)session.getAttribute("guestbookVO");
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>수정화면</title>
<link href="/12_GuestBook_EL_JSTL/css/guestbook.css" rel="stylesheet">
<script>
	function save_go(frm) {
		//비밀번호 확인 후 수정 처리.
		var pwd1 = frm.pwd.value; //새로 입력 패스워드
		//alert(pwd1);
		var pwd2 = "${guestbookVO.pwd }" //작성시 입력했던 암호
		if(pwd1 !== pwd2) {
			alert("암호가 일치하지 않습니다. 확인 후 다시 시도해주세요.");
			frm.pwd.value = "";
			frm.pwd.focus();
			return false;
		}
		//암호가 일치가면 수정 요청 처리.
		frm.action = "update_ok.jsp";
		frm.submit();
	}
</script>
	<div id="container">
		<h2 class="table-title">GuestBook - Update</h2>
		<hr>
		<p><a href="list.jsp"class="link-3"> ★ Back to the List - Click Here!★</a></p>
		<form method="post">
			<table>
				<tbody>
					<tr>
						<th>작성자</th>
						<td><input type="text" name="name" value="${guestbookVO.getName() }" readonly></td>
					</tr>
					<tr>
						<th>제목</th>
						<td><input type="text" name="subject" value="${guestbookVO.getSubject() }"></td>
					</tr>
					<tr>
						<th>이메일</th>
						<td><input type="text" name="email" value="${guestbookVO.getEmail() }"></td>
					</tr>
					<tr>
						<th>비밀번호</th>
						<!--  수정시에는 pwd 입력받아서 기존 비밀번호와 일치하면 수정처리! -->
						<td><input type="text" name="pwd"></td>
					</tr>
					<tr>
						<td colspan="2">
							<textarea name="content" rows="5" cols="60" value="${guestbookVO.getContent() }"></textarea>
						</td>
					</tr>
				</tbody>
				<tfoot>
					<tr>
						<td colspan="2">
							<input type="button" value="수 정" onclick="save_go(this.form)">
							<input type="reset" value="다시 작성">
							<input type="hidden" name="idx" value="${guestbookVO.getIdx() }">
						</td>
					</tr>
				</tfoot>
			</table>
		</form>
	</div>
</head>
<body>

</body>
</html>