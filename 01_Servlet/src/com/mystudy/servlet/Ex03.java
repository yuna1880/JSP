package com.mystudy.servlet;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/test03")
public class Ex03 extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		System.out.println(">>doGet()실행~~!!!");
		//응답시 한글처리를 위한 문자셋 지정
		response.setContentType("text/html;charset=UTF-8");
		
		//클라이언트가 전달한 데이터를 받아서 HTML문서를 만들어서 되돌려준다.
		//파라미터 값 : 요청시 서버쪽으로 전달한 값
		//파라미터 형식 : ?키=값&키=값 의 형식으로 넘어온다.
		// 작성예) name=hong&age=30
		//---------------------------------------------
		//응답 처리 형식
		//이름 : hong
		//나이 : 30
		//---------------------------------------------
		//request 객체로부터 파라미터 값 추출
		//1. getParameter(파라미터명): 하나의 파라미터 값 추출
		//2. getParameterValues(파라미터명): 배열형태값 추출(체크박스 등...)
		//3. getParameterMap() : 파라미터 값을 Map형태로 추출
		//기타 > getParameterNames() : 파라미터명 확인시 사용!
		
		//데이터 받기
		String name = request.getParameter("name");
		String age = request.getParameter("age");
		
		System.out.println("name : " + name + ", age : " + age );
		
		//응답처리
		PrintWriter out = response.getWriter();
		out.println("<h1>전달받은 데이터(이름,나이)</h1>");
		out.println("<h2>이름 : " + name + "</h2>");
		out.println("<h2>나이 : " + age + "</h2>");
	}
	
	@Override
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		System.out.println(">>doPost()실행~~!!!");
		//post방식은 utf-8적용이 안되어있다...(문제발생)
		//post일때만 전달받은 데이터에 대한 인코딩 처리.
		request.setCharacterEncoding("UTF-8");
		doGet(request,response);
	}

}
