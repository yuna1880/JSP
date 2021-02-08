<%@page import="com.bc.mybatis.DAO"%>
<%@page import="com.bc.mybatis.BBSVO"%>
<%@page import="com.oreilly.servlet.multipart.DefaultFileRenamePolicy"%>
<%@page import="com.oreilly.servlet.MultipartRequest"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%-- 전달받은 파라미터 값을 DB에 입력하고 list.jsp 로 이동 --%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>글쓰기</title>
<script>
	function list_go() {
		location.href = "list.jsp";
	}
	function sendDate() {
		//alert(">> sendDate() 시작");
		//첫번째 폼을 가지고온다 (변수에 저장)
		var firstForm = document.forms[0];
		// 폼 데이터의 elements를 끌어온다.
		for (var i=0; i<firstForm.elements.length; i++) {
			console.log(firstForm.elements[i] );
			// 문자열을 trim 했을 때, 빈 공간이 있을때
			if (firstForm.elements[i].value.trim() == "") {
				if (i == 3) continue; //파일은 비어있어도 ok!
				alert(firstForm.elements[i].title + " 입력되지 않았습니다. \n 다시 입력해주세요.")
				firstForm.elements[i].focus();
				return;
			}
		}
		firstForm.submit();
	}
</script>
</head>
<body>

<div id="bbs">
<!-- 파일 입력처리  -->
<form action="write_ok.jsp" method="post" enctype="multipart/form-data">
	<table>
		<caption>Message Board - Write</caption>
		<tbody>
			<tr>
				<th>Title</th>
				<td>
					<input type="text" name="subject" size="45" title="제목">
				</td>
			</tr>
			<tr>
				<th>Name</th>
				<td>
					<input type="text" name="writer" size="12" title="작성자">
				</td>
			</tr>
			<tr>
				<th>Contents</th>
				<td>
					<textarea name="content" rows="8" cols="50" title="내용">
					</textarea>
				</td>
			</tr>
			<tr>
				<th>File</th>
				<td>
					<input type="file" name="file_name">
				</td>
			</tr>
			<tr>
				<th>Password</th>
				<td>
					<input type="text" name="pwd" size="12" title="패스워드">
				</td>
			</tr>
		</tbody>
		<tfoot>
			<tr>
				<td colspan="2">
					<input type="button" value="저장" onclick="sendDate()">
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