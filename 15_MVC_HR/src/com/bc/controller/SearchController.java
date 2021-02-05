package com.bc.controller;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.bc.model.DAO;
import com.bc.model.vo.EmployeeVO;

@WebServlet("/search")
public class SearchController extends HttpServlet{

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		System.out.println(">>doGet 실행");
		String idx = req.getParameter("idx");
		String keyword = req.getParameter("keyword");
		System.out.println(">>idx :" + idx + " keyword : " + keyword);
		
		
		if(keyword == null || keyword.equals("")) { 
			//search.jsp로 이동.
			req.getRequestDispatcher("search.jsp").forward(req, resp);
		} else { //검색값이 입력되었으니 DB에서 검색처리
			List<EmployeeVO> list = DAO.getSearch(idx, keyword);
			System.out.println(">>동적 검색 결과 : " + list);
			
			//동적 검색 형태 확인
			String title = "";
			switch (idx) {
				case "0" : title = "사번"; break;
				case "1" : title = "이름"; break;
				case "2" : title = "직종"; break;
				case "3" : title = "부서"; break;
			}
			
			//동적검색 결과 응답페이지 전달
			req.setAttribute("list", list);
			req.setAttribute("title", title);
			
			//응답페이지 이동 (searchList.jsp)
			req.getRequestDispatcher("searchList.jsp")
					.forward(req, resp);
		}
	
	}
	
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		req.setCharacterEncoding("UTF-8");
		doGet(req, resp);
	}
	
	
}
