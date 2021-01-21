<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>JSP 설명</title>
</head>
<body>
	<!-- HTML 주석 : 소스보기를 통해서 볼 수 있음.-->
	<%-- JSP 주석  : 소스보기를 통해서 볼 수 없음. --%>
	<%-- 
		JSP 구성요소 : 디렉티브(지시어), 선언부, 스크립트릿, 표현식
		1. 디렉티브(<%@ %>)
		- JSP 페이이지에 대한 설정정보 지정시 사용.
		- 문장에 대해서 지시를 하거나 설명할 때 사용하는 부호.
		- page : JSP 페이지에 대한 정보 지정 (또는 import 구문 등...)
		- include : 특정영역에 다른 문서를 포함할 때 사용.
		- taglib : 사용할 태그 라이브러리 지정시(JSTL) 사용.
		2. 스크립트릿(<% %>)
		- 자바코드를 작성할때 사용하는 영역. (로컬영역)
		- service() 메소드 영역에 추가되는 자바코드
		3. 표현식 (<%= %>) 
		- 브라우저 화면에 값을 출력시 사용!(변수값 또는 메소드 리턴값 등 화면출력)
		- out 객체 사용해서 출력!
		4. 선언부 (<%! %>)
		- 필드영역에 작성되는 자바코드 작성
		- 필드변수, 메소드 선언시 사용.
		
	--%>
	<h1>Hello~~~~ JSP !!</h1>
	<hr>
	<h3>만나서 반가워~!ㅋ</h3>
</body>
</html>