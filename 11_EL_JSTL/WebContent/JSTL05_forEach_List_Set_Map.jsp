<%@page import="com.bc.vo.PersonVO"%>
<%@page import="java.util.HashMap"%>
<%@page import="java.util.Map"%>
<%@page import="java.util.Set"%>
<%@page import="java.util.HashSet"%>
<%@page import="java.util.ArrayList"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>JSTL forEach</title>
</head>
<body>
	<h1>JSTL forEach : Array, List, Set, Map<k,v></h1>
	<h2>배열(Array) 출력</h2>
	<p>출력대상 : {"a", "ab", "abc", "abcd"}</p>
<%

	String[] strs = {"a", "ab", "abc", "abcd"};
	pageContext.setAttribute("arr", strs);

%>

	<c:forEach var="str" items="${arr}">
		<p>${ str }</p>
	</c:forEach>

	<h3>배열(Array) 일부데이터만 사용(2,3번째: 1,2번인덱스)</h3>
	<ul>
	<c:forEach var="str" items="${arr }" begin="1" end="2">
		<li>${str }</li>
	</c:forEach>
	</ul>
	<h3></h3>
	
	<%-- ========= List 출력 ============ --%>
	<h2>List 출력</h2>
<%
	List<Integer> list = new ArrayList<Integer>();
	list.add(123);
	list.add (45);
	list.add (678);
	list.add (90);
	pageContext.setAttribute("alist", list);

%>

	<ul>
	<c:forEach var="listItem" items="${alist }">
		<li>${listItem }</li>
	</c:forEach>
	</ul>
	
	
	
	
	<hr></hr>
	
	<%--========= Set 출력 ========== --%>
	<h2>Set 출력</h2>
	
<%
	Set<String> set = new HashSet<>();
	set.add("홍길동");
	set.add("권유나");
	set.add("유상진");
	set.add("낭낭");
	pageContext.setAttribute("hSet", set);
	System.out.println("set.size() : " + set.size());
	System.out.println("set.contains(낭낭) : " + set.contains("낭낭"));
%>
	<p> hset.size() = ${hSet.size() }</p>
	<p>set.contains("낭낭") = ${hSet.contains("낭낭") }</p>
	
	<ul>
	<c:forEach var="name" items="${hSet }">
		<li>${name }</li>
	</c:forEach>
	</ul>
	
	<%--========= Map key=value 데이터 사용 ========== --%>
	<h2>Map key=value 데이터  출력</h2>
	
<%
	Map<String, String> map = new HashMap<>();
	map.put("k1", "a");
	map.put("k2", "ab");
	map.put("k3", "abc");
	map.put("k4", "abcd");
	pageContext.setAttribute("hmap", map);
%>
	<c:forEach var="mapData" items="${hmap }">
		<p>${mapData.key } - ${mapData.value }</p>
	</c:forEach>
	<hr><hr>
	
	<%--============================================= --%>
	<h1>VO가 저장된 List 사용</h1>
	
<%
	List<PersonVO> listBean = new ArrayList<>();
	listBean.add(new PersonVO("홍길동","27"));
	listBean.add(new PersonVO("김유신","30"));
	listBean.add(new PersonVO("강감찬","40"));
	listBean.add(new PersonVO("을지문덕","50"));
	
	pageContext.setAttribute("persons", listBean);
	
	//자바에서의 forEach문 출력
	for (PersonVO person : listBean) {
		//System.out.println(person); - 전체데이터가 나온다.
		//값만 출력시 get메소드 사용해서 출력!
		System.out.println(person.getName() + "-" + person.getAge());
	}
	
%>
	<%-- (실습) persons에 있는 PersonVO의 이름, 나이, 화면 출력 --%>
	
	<p>persons = ${persons }</p>
	<hr>
	
	<c:forEach var="vo" items="${persons }">
		<!-- 1. 필드명으로 가져오기 -->
		<p>이름 = ${vo.name } - 나이 = ${vo.age }</p>
		<!--  2.메소드명으로 가져오기 -->
		<p>이름 = ${vo.getName() } - 나이 ${vo.getAge() }</p>
	</c:forEach>
	
	

</body>
</html>