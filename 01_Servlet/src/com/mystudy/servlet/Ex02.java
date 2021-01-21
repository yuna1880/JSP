package com.mystudy.servlet;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.Calendar;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/today")
public class Ex02 extends HttpServlet {
@Override
protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	System.out.println(">> Ex02.doGet 실행 !! ");
	//한글깨짐 방지를 위한 문자타입 처리! (UTP-8) (응답하는 컨텐츠 텍스트 처리 변경.)
	response.setContentType("text/html;charset=UTF-8");
	
	//오늘 날짜를 표시(년월일)
	Calendar cal = Calendar.getInstance();
	int year = cal.get(Calendar.YEAR);
	int month = cal.get(Calendar.MONTH) + 1;
	int day = cal.get(Calendar.DAY_OF_MONTH);
	
	PrintWriter out = response.getWriter();
	out.println("<!DOCTYPE html>");
	out.println("<html>");
	out.println("<head>");
	out.println("<meta charset='UTF-8'>");
	out.println("<title>Today</title>");
	out.println("</head>");
	out.println("<body>");
	out.println("<h1>저는 유나랍니다!</h1>");
	out.println("<h3>오늘 날짜는 2021년 1월 20일</h3>");
	out.println("<h3>(Cal 사용) 오늘 날짜는" + year + "년" + month + "월" + day + "일");
	out.println("</body>");
	out.println("</html>");
	
}
}
