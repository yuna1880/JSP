<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%-- 리다이렉트(redirect), 포워딩 (forward)
1. 리타이렉트(redirect : response.sendRedirect("이동위치"))
      단순한 페이지 전환 (새로운 페이지 다시 요청하도록)
    <특징>
    - request, response 객체가 다시 생성됨
    - 최초 요청시 요청 파라미터값을 전달할 수 없다.
    - 요청 URL이 변경된다.
    
3. 포워딩 (forward): 전달 (또는 위임)
    1) request.getRequestDispatcher("이동위치").forward(request,response);
    2) RequestDispatcher rd = request.getRequestDispatcher("이동위치");
    	rd.forward(request, response);
    <특징>
    - 최초 요청시 생성된 request, response 객체 전달
    - 최초 요청시 전달된 파라미터 값 전달 가능.(위임받은 곳에서 사용 가능)
    - 요청 URL 변경 없음. (최초 요청 주소 그대로 표시된다.)
--%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

</body>
</html>