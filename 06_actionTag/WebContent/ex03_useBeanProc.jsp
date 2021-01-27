<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<%
	//한글처리 설정
	request.setCharacterEncoding("UTF-8");
	//파라미터 값 추출
	String name = request.getParameter("name");
	String age = request.getParameter("age");
%>
	<h2>일반적인 파라미터 처리 방법</h2>
	이름 : <%=name %><br>
	나이 : <%=age %>
	
	<h2>속성을 이용 처리 방법(request scope)</h2>
<%
	request.setAttribute("attr_name", name);
	request.setAttribute("attr_age", age);
%>

<p>이름 : <%=request.getAttribute("attr_name") %></p>
<p>나이 : <%=request.getAttribute("attr_age") %></p>
<hr><hr>


<%-- =========================================== --%>
<%-- 액션태그 : <jsp:useBean></jsp:useBean>
	자바빈(Bean)을 이용해서 파라미터 값을 저장 사용
	자바빈(Bean)은 데이터를 저장할 목적으로 JSP에서 제공하는 저장소
	<useBean 액션태그의 역할 및 사용법>
	1. VO 객체(인스턴스) 생성(자바클래스)
	2. 자바빈 생성(useBean 액션태그 사용)
		id : 사용할 변수명(속성명)
		class : 실제 클래스의 위치(패키지 + 클래스명)
		scope : page(default), request, session, application
 --%>
 <%--
 	PersonVO person = request.getAttribute("person");
 	if (person == null) {
 		person = new PersonVO();
 		request.serAttribute("person",person);
 	}
  --%>
 	<!-- personVO 타입의 객체 생성 (person이라는 변수 명으로 저장.)  -->
	<jsp:useBean id="person" class="com.mystudy.PersonVO" scope="request" />
	
	<!-- 생성된 자바빈 객체에 프로퍼티 값을 저장 -->
	<jsp:setProperty property="name" name="person" />
	<jsp:setProperty property="age" name="person" />
	<!-- 프로퍼티 값 몇개이던, 전부 저장 가능하다.  -->
	<jsp:setProperty property="*" name="person" />
	
	<h2> 표현식으로 값 표시(PersonVO)</h2>
	<h2> 이름 (표현식) : <%=person.getName() %></h2>
	<h2> 나이 (표현식) : <%=person.getAge() %></h2>
	<hr>
	
	<h2>데이터 읽기 : getProperty 액션태그</h2>
	<h2>이름(액션태그) : <jsp:getProperty property="name" name="person" /> </h2>
	<h2>나이(액션태그) : <jsp:getProperty property="age" name="person" /> </h2>
	<hr>
	
<%
	System.out.println("person : " + person); //personVO객체가 호출된다.
	System.out.println("request person : " + request.getAttribute("person")); //personVO객체가 호출된다.
%>
	
</body>
</html>