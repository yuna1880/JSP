package com.team.controller;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.team.write.mainTeamCommand;
import com.team.write.Command;


/**
 * Servlet implementation class controller
 */
@WebServlet("*.team")
public class controller extends HttpServlet {
	private static final long serialVersionUID = 1L;

	public controller() {
		super();
	}

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		actionDo(request, response);

	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		actionDo(request, response);

	}

	protected void actionDo(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		request.setCharacterEncoding("utf-8");

		// 컨트롤러는 다음 두개를 선택해야 한다.
		String viewPage = null; // 어떠한 뷰?-->페이지
		Command command = null; // 어떠한 커맨드-->어떠한 로직 수행
		// url에 담겨온다. 이름에서 찢어내야한다.

		// url 로 부터 URI,ContextPath, Command 분리
		String uri = request.getRequestURI();
		String conPath = request.getContextPath();
		String com = uri.substring(conPath.length());

		switch (com) {

		case "/main.team":
			command = new mainTeamCommand();
			command.execute(request, response);
			viewPage = "main.jsp";
			break;
		}
	
	

		if (viewPage != null) {
			RequestDispatcher dispatcher = request.getRequestDispatcher(viewPage);
			dispatcher.forward(request, response);
		}
	}

}
