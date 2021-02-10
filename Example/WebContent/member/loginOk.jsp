<%-- <%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%!
	
	public static final String ADMIN_ID = "admin";
	public static final String ADMIN_PW = "1234";
%>    

<% 
	String userid = request.getParameter("userid");
	String pw = request.getParameter("pw");

	
	String sessionName = "userid";
	String sessionValue = userid;

	System.out.print("loginOk 넘어옴");
	System.out.print(pw);
	if(ADMIN_ID.equalsIgnoreCase(userid) && ADMIN_PW.equals(pw)){
		out.println("<script>");
		out.println("alert('로그인 성공');");
		out.println("</script>");

		
		session.setAttribute(sessionName, sessionValue);		
	}else{
		out.println("<script>");
		out.println("alert('로그인 실패');");
		out.println("</script>");

		
		session.removeAttribute(sessionName);
	}
%>

<script>
location.href = "login.jsp";
</script>















 --%>