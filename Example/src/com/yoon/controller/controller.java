package com.yoon.controller;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.yoon.write.Command;
import com.yoon.write.ViewCommand;
import com.yoon.write.managerCommand;
import com.yoon.write.pdeleteCommand;
import com.yoon.write.pqListbypidCommand;
import com.yoon.write.pqListbypquidCommand;
import com.yoon.write.pquestionListCommand;
import com.yoon.write.prandomListCommand;
import com.yoon.write.productListCommand;
import com.yoon.write.psetCommand;
import com.yoon.write.pupdateCommand;
import com.yoon.write.questionDeleteCommand;
import com.yoon.write.questionUpdateCommand;
import com.yoon.write.questionWriteCommand;

/**
 * Servlet implementation class controller
 */
@WebServlet("*.y")
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
		case "/storeMain.y":
			command = new productListCommand();
			command.execute(request, response);
			viewPage = "storeMain.jsp";
			break;
		case "/aProductList.y":
			command = new productListCommand();
			command.execute(request, response);
			viewPage = "aProductList.jsp";
			break;
		case "/aQuestionList.y":
			command = new pquestionListCommand();
			command.execute(request, response);
			viewPage = "aQuestionList.jsp";
			break;
		case "/QuestionUpdateOk.y":
			command = new questionUpdateCommand();
			command.execute(request, response);
			viewPage = "QuestionUpdateOk.jsp";
			break;
		case "/TODO.y":
			command = new pqListbypidCommand();
			command.execute(request, response);
			viewPage = "TODO.jsp";
			break;
		case "/QuestionWriteOk.y":
			/* command = new pqListbypidCommand(); */// TODO
			command = new questionWriteCommand();
			command.execute(request, response);
			viewPage = "QuestionWriteOk.jsp";
			break;
		case "/QuestionDeleteOk.y":
			/* command = new pqListbypidCommand(); */// TODO
			command = new questionDeleteCommand();
			command.execute(request, response);
			viewPage = "QuestionDeleteOk.jsp";
			break;
		case "/uQuestionList.y":
			command = new pqListbypquidCommand();
			command.execute(request, response);
			viewPage = "uQuestionList.jsp";
			break;
			
		case "/productView.y":
			command = new ViewCommand();
			command.execute(request, response);
			viewPage = "productView.jsp";
			break;
		case "/pfileUploadOk.y":
			command = new managerCommand();
			command.execute(request, response);
			viewPage = "pfileUploadOk.jsp";
			break;
		case "/aProductDeleteOk.y":
			command = new pdeleteCommand();
			command.execute(request, response);
			viewPage = "aProductDeleteOk.jsp";
			break;
		case "/aProductUpdateOk.y":
			command = new pupdateCommand();
			command.execute(request, response);
			viewPage = "aProductUpdateOk.jsp";
			break;
		case "/aProductSetOk.y":
			command = new psetCommand();
			command.execute(request, response);
			viewPage = "aProductSetOk.jsp";
			break;
		case "/main.y":
			command = new prandomListCommand();
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
