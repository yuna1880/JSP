<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	//request scope에 저장된 데이터 사용
	String req_name = (String) request.getAttribute("req_name");
	String req_age = (String) request.getAttribute("req_age");
	
	//session scope에 저장된 데이터 사용
	System.out.println(">>session id : " + session.getId()
				+ ", new : " + session.isNew());
	String name = null;
	String age = null;
	if (session.getAttribute("attr_name") == null) {
		name = "세션에 속성 없음(attr_name)";
	} else {
		name = (String)session.getAttribute("attr_name");
	}
	if (session.getAttribute("attr_age") == null) {
		age = "세션에 속성 없음(attr_age)";
	} else {
		age = (String)session.getAttribute("attr_age");
	}
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>세션 (session) 범위</title>
<script>
	function sessionSet() {
		location.href = "ex01_sessionSet.jsp?name=hong&age=27"; //이름, 나이 값 같이 전달
		//location.href = "ex01_sessionSet.jsp?name=hong";
	}
	function sessionRemove() { //세션 속성 삭제
		location.href = "ex01_sessionRemove.jsp";
	}
	function sessionInvalidate() {
		location.href = "ex01_sessionInvalidate.jsp";
	}
</script>
</head>
<body>
	<h1>세션(session) 테스트 [session.jsp]</h1>
	<input type="button" value="세션 속성에 저장" onclick="sessionSet()">
	<input type="button" value="세션 속성 삭제" onclick="sessionRemove()">
	<input type="button" value="세션 속성 초기화" onclick="sessionInvalidate()">
	
	<h1>세션 범위(session scope)</h1>
	<h2>세션 ID : <%=session.getId() %> </h2>
	<h2>이름(session) : <%=name %></h2>
	<h2>나이(session) : <%=age %></h2>
	<hr>
	
	<h1>request 스코프(request)</h1>
	<h2>이름(request) : <%=req_name %></h2>
	<h2>나이(request) : <%=req_age %></h2>
	
</body>
</html>