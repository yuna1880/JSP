<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>작업선택</title>
<script>
	function all_search(frm) {
		//frm.action = "list.jsp"; // 예전 jsp 직접 호출 방식
		frm.action = "list"; //리스트 요청
		frm.submit();
	}
	function dept_search(frm) {
		//dept.jsp페이지로 이동..
		frm.action = "dept";
		frm.submit();
	}
</script>
</head>
<body>
	<h1>작업선택</h1>
	<form method="get">
		<input type="button" value="전체보기" onclick="all_search(this.form)">
		<input type="button" value="부서 코드 검색" onclick="dept_search(this.form)">
		<input type="button" value="성명 검색 (성, 이름 포함)">
		<input type="button" value="동적 검색">
	</form>
</body>
</html>