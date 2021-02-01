<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%-- 전달받은 데이터를 화면표시 - 자바빈 (Bean) VO에 저장 사용 --%>
<%
	//한글처리
	request.setCharacterEncoding("UTF-8");
%>
 	<%-- 스코프 지정을 안하면 pageScope --%>
	<jsp:useBean id ="person" class="com.bc.vo.PersonVO" />
	<jsp:setProperty property="*" name="person"/>

	
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>결과보기 - 자바빈</title>
</head>
<body>
	<h2>결과보기 (표현식으로 form 데이터 표시)</h2>
	<ul>
		<li>이름 : <%=person.getName() %></li>
		<li>나이 : <%=person.getAge() %></li>
		<li>성별 : <%=person.getGender() %></li>
		<li>취미 : <%=person.getHobby() %></li>
		<li>취미(반복문) : 
<%
		for (String h : person.getHobby()) {
			out.print(h + " ");
		}
%>		
		</li>
	</ul>
	<hr>
	<!--  radio, hobby는 반드시 파라미터 값을 넘겨줘야 처리가 된다.  -->
	<h2> Bean 데이터 EL 사용 출력 </h2>
	<ol>
		<li>이름 : ${ person.getName() }</li>
		<li>나이 : ${ person.age }</li>
		<li>성별 : ${ person.gender }</li>
		<li>취미 : ${ person.hobby }</li>
		<li>취미 데이터 출력 : 
			${ person.hobby[0] }
			${ person.hobby[1] }
			${ person.hobby[2] }
			${ person.hobby[3] }
		</li>
	</ol>
</body>
</html>