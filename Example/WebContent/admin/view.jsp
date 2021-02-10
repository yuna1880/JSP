<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!-- MaxCDN 사용 -->
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/4.4.1/css/bootstrap.min.css">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/4.4.1/js/bootstrap.min.js"></script>

<c:choose>
	<c:when test="${empty list || fn:length(list) == 0 }">
		<script>
			alert("해당 정보가 삭제되거나 없습니다");
			history.back();
		</script>
	</c:when>
	<c:otherwise>

		<!DOCTYPE html>
		<html lang="ko">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>읽기 ${list[0].MEMBER_ID }</title>
<!-- title에 글제목 넣기 -->
</head>
<script>
	 c = '${list[0].MEMBER_ID}';
$(document).on('click', '.hi', function() {
	var r = confirm("삭제하시겠습니까?");
	if(r){
		location.href = 'deleteOk.ad?id=' + c;
	}
});



</script>
<body>
	<h2>읽기 ${list[0].MEMBER_ID }</h2>
	<br> ID : ${list[0].MEMBER_ID }
	<br> 비밀번호 : ${list[0].MEMBER_PW }
	<br> 이름 : ${list[0].MEMBER_NAME }
	<br> 이메일 : ${list[0].MEMBER_EMAIL }
	<br> 등록일 : ${list[0].MEMBER_JOIN_DATE }
	<br>

	<br>
	<%-- <button onclick="location.href='update.do?uid=${list[0].MEMBER_ID }'">수정하기</button> --%>
	<button onclick="location.href = 'list.ad'">목록보기</button>
	<button class = "hi">삭제하기</button>
	<!-- <button onclick="location.href = 'write.do'">신규등록</button> -->

	<br>
	<br>
	<br>
	<br>
	<br>
	<br>
	<br>
	<br>
	<br>
	<br>
	<br>
	<br>
	<br>
	<br>
	<br>
	<br>
	<br>
	<br>
	<br>
	<br>
	<br>
	<br>
	<br>
</body>
		</html>

	</c:otherwise>
</c:choose>













