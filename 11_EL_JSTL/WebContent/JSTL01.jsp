<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>JSTL</title>
</head>
<body>
<%-- JSTL (JSP Standatd Tag Library) 
	0. 라이브러리 다운 (인터넷) 
		다운로드 : https://tomcat.apache.org/download-taglibs.cgi
		다운로드 : mvnrepository > jstl 검색
	1. 라이브러리 등록
	WebContent > WEB-INF > lib > jar 등록
	2. JSTL 디렉티브(지시어) taglib 추가

--%>	

	<h2>JSTL 사용</h2>
	<h3>속성설정 : set</h3>
	<%--set : 속성 선언 태그 setAttribute 역할
		<c:set var="속성명" value="속성값" scope="범위"></set>
		scope : page | request | session | application
	--%>
	
	<c:set var="test" value="Hello JSTL!!! - page"/>
	<c:set var="test" value="Hello JSTL!!! - request" scope="request"/>
	<c:set var="test" value="Hello JSTL!!! - session" scope="session"/>

<%
	//System.out.println("test : " + test);
	System.out.println("page test : " + pageContext.getAttribute("test"));
	System.out.println("test : " + request.getAttribute("test"));
	System.out.println("session test : " + session.getAttribute("test"));
%>
	<h2>속성값 출력 : out</h2>
	<p><c:out value="Hello World" /></p>
	<p> page test(c:out) : <c:out value = "${pageScope.test }"/> </p>
	<p> page test(EL) : ${pageScope.test }/> </p>
	<p> session text(EL) : ${sessionScope.test } </p>
	
	<p> application text(EL) : ${applicationScope.test } 
		<c:out value="${applicationScope.test }" default="데이터없음" />
	</p>
	<hr>
	
	<p>EL : ${test }</p>
	<p>EL(page) : ${pageScope.test }</p>
	<p>EL(request) : ${requestScope.test }</p>
	
	<h3> 삭제 : remove </h3>
	<c:remove var="test" scope="page"/>
	
	<p>EL : ${test }</p>
	<p>EL(pageScope) : ${pageScope.test }</p>
	<p>EL(requestScope) : ${requestScope.test }</p>
	
	<%-- ========================================= --%>
	<%-- 자바코드의 분기문 if문에 해당하는 태그 (if) --%>
	
	<h2> if 태그의 test 속성 </h2>
	
	<c:if test="true">
		<p> if의 test 속성값이 true인 경우 실행문장</p>
	</c:if>
	<c:if test="false">
		<p>if의 test 속성값이 false인 경우 실행이 안되는 문장</p>
	</c:if>
	<hr>
	
	<%-- JSTL에는 else 문이 없다(제공되지 않는다.)  
		직접 else 역할을 할 if문 작성해서 처리해야 한다.
	--%>
	<c:if test="${20 > 10 }">
		<p>20 &gt; 10 결과 true인 경우 실행문장</p>
	</c:if>
	<c:if test="${20 <= 10 }"> <%-- else 역할 문장 --%>
		<p>20 le 10 결과 true인 경우 실행문장</p>
	</c:if>
	<hr>
	
	<h3> if 태그 2 : var 속성은 test 결과 저장 </h3>
	<c:set var="n1" value="10" />
	<c:set var="n2" value="20" />
	<c:if test="${n1 > n2 }" var="result">
		<p> if문 결과 n1(${n1 }) 이 n2 (${n2 }) 보다 큽니다. (result : ${result })</p>
	</c:if>
	<p>:: n1 > n2 result : ${result }</p>
	<c:if test="${n1 <= n2 }" var="result">
		<p> if문 결과 n1(${n1 }) 이 n2 (${n2 }) 적거나 같습니다. (result : ${result })</p>
	</c:if>
	<p>:: n1 <= n2 result : ${result }</p>
	<hr><hr>
	
	<%-- ========choose ~ when ~ otherwise  --%>
	<h2> choose ~ when ~ otherwise </h2>
	<c:set var="jumsu" value="50"/>
	
	<c:if test="${jumsu >= 60 }">
		<p> 판정결과 (점수:${jumsu }) : <c:out value="합격"/> </p>
	</c:if>
	<c:if test="${jumsu < 60 }">
		<p> 판정결과 (점수:${jumsu }) : <c:out value="불합격"/> </p>
	</c:if>
	<hr>
	
	<h2> choose ~ when ~ otherwise </h2>
	<p> choose ~ when ~ otherwise : if ~ else if ~ else if ~ else ~ </p>
	<c:choose>
		<c:when test="${jumsu >= 90 }">
			<p> 판정결과 (${jumsu }) : A</p>
		</c:when>
		<c:when test="${jumsu >= 80 }">
			<p> 판정결과 (${jumsu }) : B</p>
		</c:when>
		<c:when test="${jumsu >= 70 }">
			<p> 판정결과 (${jumsu }) : C</p>
		</c:when>
		<c:otherwise>
			<p> 판정결과 (${jumsu }) : 노력 필요!!!</p>
		</c:otherwise>
	</c:choose>
	
	<%-- JSTL 반복문 forEach --%>
	<h3> 반복문 : forEach </h3>
	<h3> forEach 문 : 자바의 기본 for 문</h3>
	<p>1-10까지의 숫자 출력</p>
	
	<c:forEach var="i" begin="1" end="10" step="1">
		${i }&nbsp;&nbsp;
	</c:forEach>
	<p>forEach문 종료 후 \${i } 값 출력 : ${i }</p>
	<hr>
	
	<p>(실습)1~10까지의 짝수 출력(step="1")사용</p>
	<c:forEach var="i" begin="1" end="10" step="1">
		<c:if test="${i % 2 == 0}">
			${i }&nbsp;&nbsp;
		</c:if>
	</c:forEach>
	
	<hr>
	<p>(실습)1~10까지의 숫자 중 짝수 출력(step="2")사용</p>
	<c:forEach var="i" begin="2" end="10" step="2">
		${i }&nbsp;&nbsp;
	</c:forEach>
	
	<%--================================================ --%>
	
	<h2> forEach : 집합객체 처리 </h2>
	<h3>배열값 출력(스크립트릿 사용)</h3>
	
<%
	String[] arr = {"홍길동", "일지매", "임꺽정", "둘리"};
	for(String name : arr) {
		out.print(name+ " ");
	}
	pageContext.setAttribute("attr_arr", arr);
	
%>
	<h3>EL에서 스크립트릿 변수 사용</h3>
	arr[0] : ${arr[0] } :: 스코프(scope) 상에 등록되지 않으면, EL에서 사용 못함.
	
	<h3>선언부, 스크립트릿 변수 속성등록 후 사용</h3>
	<c:set var="attr_arr" value="<%=arr %>"></c:set>	
	<c:forEach var="name" items="${attr_arr }">
		${name } 
	</c:forEach>
	<hr><hr>
	
	<%-- ============== forTokens ============== --%>
	
	<c:set var="names" value="홍길동/김유신/일지매,임꺽정/둘리,고길동"/>
	<p>names : ${names }</p>
	<c:forTokens var="name" items="${names }" delims="/">
		<p>${name }</p>
	</c:forTokens>
	
	<h3>forTokens 구분자 / 와 , 함께 사용</h3>
	<c:forTokens var="name" items="${names }" delims="/,">
		<p>${name }</p>
	</c:forTokens>

	
	
	
</body>
</html>