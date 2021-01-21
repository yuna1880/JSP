package com.mystudy.servlet;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.Arrays;
import java.util.Enumeration;
import java.util.Map;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet ("/signup") //요청url 어노테이션 -> contextroot로 요청 !
public class Ex04 extends HttpServlet {
	
	@Override
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		//request 객체로부터 파라미터 값 추출
		//전달 받은 회원가입 정보를 추출해서 회원가입 정보 작성 후 응답처리.
		
		//요청정보 추출
		String name = request.getParameter("name");
		System.out.println("name : -" + name + "-");
		String id = request.getParameter("id");
		String pwd = request.getParameter("pwd");
		String email = request.getParameter("email");
		
		//취미 값 추출 
		//1) null혹은 1개만 가지고 온다.
		//String hobby = request.getParameter("hobby");
		String[] hobby = request.getParameterValues("hobby"); //스트링 배열타입
		//System.out.println("hobby 배열값 : " + hobby);//확인용
		
		//서버 콘솔에 출력
		System.out.println("------------------");
		System.out.println("name : " + name);
		System.out.println("id : " + id);
		System.out.println("pwd : " + pwd);
		System.out.println("email : " + email);
		System.out.println("hobby 배열값 : " + Arrays.deepToString(hobby));//값 확인
		
		//------------------------------------------------------
		//클라이언트(브라우저) 쪽으로 응답처리
		response.setContentType("text/html;charset=UTF-8");
		//출력
		PrintWriter out = response.getWriter();
		out.println("<h2>회원가입 정보</h2>");
		out.println("<ul>");
		out.println("<li> 이름 : " + name + "</li>");
		out.println("<li> 아이디 : " + id + "</li>");
		out.println("<li> 암호 : " + pwd + "</li>");
		out.println("<li> 이메일 : " + email + "</li>");
		out.println("<li> 취미 : ");
		if(hobby == null) {
			out.write("선택사항 없음");
		}else {
			for(String str : hobby) {
				out.write(str + "&nbsp;&nbsp;");
			}
		}
		out.println("</li>");
		out.println("</ul>");
		out.println("<hr>");
		//-------------------------------------------------------------
		//getParameterMap() : 파라미터 값을 Map 형태로 추출
		Map<String,String[]>paramMap = request.getParameterMap();
		String[] names = paramMap.get("name");
		String[] hobby2 = paramMap.get("hobby");
		
		out.println("<h3>파라미터를 맵 형식으로 받아서 처리</h3>");
		out.println("<ol>");
		out.println("<li> 이름 : " + names[0]);
		out.println("</li> 취미 : ");
		if(hobby == null) {
			out.write("선택사항 없음");
		}else {
			for(String str : hobby2) {
				out.write(str + "&nbsp;&nbsp;");
			}
		}
		out.println("<li>");
		out.println("</ol> ");
		out.println("<hr>");
		
		//-----------------------------------------------------------------
		//기타 getParameterNames() : 넘겨받은 '파라미터명' 만 확인시 사용

		out.println("<h3>넘겨받은 파라미터명</h3>");
		Enumeration<String> paramNames = request.getParameterNames();
		out.println("<p>");
		while(paramNames.hasMoreElements()) {
			out.println(paramNames.nextElement() + " ");
		}
		out.println("</p>");
		out.println("<hr><hr>");
	}
	@Override
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		System.out.println(">> doPost() 실행");
		request.setCharacterEncoding("UTF-8");
		doGet(request,response);
	}
}
