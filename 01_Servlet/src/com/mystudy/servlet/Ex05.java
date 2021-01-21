package com.mystudy.servlet;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet ("/sungjuk")
public class Ex05 extends HttpServlet {

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
		//요청정보 추출
		String name = req.getParameter("name");
		int kor = Integer.parseInt(req.getParameter("kor"));
		int eng = Integer.parseInt(req.getParameter("eng"));
		int math = Integer.parseInt(req.getParameter("math"));
		int sum = kor + eng + math;
		//double avg = sum * 100 / 3 / 100.0; //소수점 이하 셋째자리 버림.
		//double avg = Math.round(sum * 100 / 3.0) / 100.0; // 
		double avg = sum / 3.0;
		
		//콘솔창에 표시
		System.out.println("------------------");
		System.out.println("name : " + name);
		System.out.println("kor : " + kor);
		System.out.println("eng : " + eng);
		System.out.println("math : " + math);
		System.out.println("합계 : " + sum);
		System.out.println("평균 : " + avg);
		
		//--------------------------------------------------------------------
		// 클라이언트 (브라우저) 쪽으로 처리
		resp.setContentType("text/html;charset=UTF-8");
		//출력
		PrintWriter out = resp.getWriter();
		out.println("<h3>성적처리 결과</h3>");
		out.println("<table border>");
		out.println("<tr>");
		out.println("<th>이름</th>");
		out.println("<th>" + name +"</th>");
		out.println("</tr>");
		out.println("<tr>");
		out.println("<th>국어점수</th>");
		out.println("<th>" + kor +"</th>");
		out.println("</tr>");
		out.println("<tr>");
		out.println("<th>영어점수</th>");
		out.println("<th>" + eng +"</th>");
		out.println("</tr>");
		out.println("<tr>");
		out.println("<th>수학점수</th>");
		out.println("<th>" + math +"</th>");
		out.println("</tr>");
		out.println("<tr>");
		out.println("<th>총합</th>");
		out.println("<th>" + sum +"</th>");
		out.println("</tr>");
		out.println("<tr>");
		out.println("<th>평균</th>");
		out.println("<th>" + Math.round((avg)*100)/100.0 +"</th>");
		out.println("</tr>");
		out.println("</table>");
	}
	
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		req.setCharacterEncoding("UTF-8");
		doGet(req, resp);
	}
	
}
