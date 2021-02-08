<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%-- 전달받은 데이터를 사용해서 화면에 표시하고 수정 후 수정 요청처리 
	- 암호가 일치하면 : 수정요청 처리(DB연동작업) - modify_ok.jsp
	- 암호 불일치 : 암호 확인! 메세지 표시
--%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Modify</title>
<script>
	function sendData() {
		var firstForm = document.forms[0];
		// 폼 데이터의 elements를 끌어온다.
		for (var i=0; i<firstForm.elements.length; i++) {
			if (firstForm.elements[i].value.trim() == "") {
				if (i == 3) continue; //파일은 비어있어도 ok!
					alert(firstForm.elements[i].title + " 입력되지 않았습니다. \n 다시 입력해주세요.")
					firstForm.elements[i].focus();
					return;
			}
		}
		//암호 일치여부 확인
		var pwd1 = document.myForm.pwd.value; //새로 입력된 암호 (확인용)
		var pwd2 = "${bvo.pwd}"; //DB에 저장된 패스워드 값(소스보기 확인가능)
		if (pwd1 != pwd2) {
			alert("암호가 다릅니다. 다시 확인후 시도해 주세요.");
			document.myForm.pwd.value = "";
			document.myForm.pwd.focus();
			return;
		}
		alert("수정되었습니다. 확인해주세요!");
		document.myForm.submit();
	}
	function list_go() {
		location.href = "list.jsp?cPage=${cPage}";
	}
</script>
</head>
<body>
<div id="bbs">
<form action="modify_ok.jsp" method="post" enctype="multipart/form-data" name="myForm">
	<table>
		<!-- 초기 데이터가 표시될 수 있도록  -->
		<caption>Modify</caption>
		<tbody>
			<tr>
				<th>Title</th>
				<td>
					<input type="text" name="subject" size="45" title="제목"
							value="${bvo.subject }">
				</td>
				<tr>
				<th>Name</th>
					<td>
						<input type="text" name="writer" size="12" title="작성자"
							value="${bvo.writer }">
					</td>
				</tr>
				<tr>
					<th>Contents</th>
					<td>
						<textarea name="content" rows="8" cols="50" title="내용"
							value="${bvo.content }">
						</textarea>
					</td>
				</tr>
				<tr>
					<th>File</th>
					<td>
						<input type="file" name="file_name" value="${bvo.file_name }">
					</td>
				</tr>
				<tr>
					<!-- 확인용으로, 기존 pwd 값을 가져올 필요는 없다. -->
					<th>Password</th>
					<td>
						<input type="text" name="pwd" size="12" title="패스워드">
					</td>
				</tr>
				</tr>
		</tbody>
		<tfoot>
			<tr>
				<td colspan="2">
					<input type="button" value="수정" onclick="sendData()">
					<input type="reset" value="다시작성">
					<input type="button" value="목록" onclick="list_go()">
				</td>
			</tr>
		</tfoot>
	</table>

</form>
</div>
</body>
</html>