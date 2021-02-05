<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>부서코드로 검색</title>
<script>
	function dept_search(frm) {
		frm.action = "deptList";
		frm.submit();
	}

</script>
</head>
<body>

	<form action=deptList method="post">
		<label for="deptno">부서코드</label>
		<select name="deptno" id="deptno">
			<option value="null">없음</option>
		<c:forEach var="id" items="${list}">
			<option value="${id}">${id}</option>
		</c:forEach>
		</select>
		<button type="submit">부서코드로 검색</button>
	</form>

	<h2>부서코드로 검색(dept.jsp)</h2>
	<form action="deptList" method="post">
		부서코드 : <input type="text" name="deptno">
		<input type="submit" value="부서코드로 검색" onclick="dept_search(this.form)">
	</form>
	
	
	
</body>
</html>