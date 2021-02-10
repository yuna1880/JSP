package com.cons.controller;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.servlet.http.HttpSessionContext;

import com.cons.write.Command;
import com.cons.write.ConsListCommand;
import com.cons.write.DeleteCommand;
import com.cons.write.SelectCommand;
import com.cons.write.UpdateCommand;
import com.cons.write.ViewCommand;
import com.cons.write.WriteCommand;

@WebServlet("*.cons")
public class ConsController extends HttpServlet {
	private static final long serialVersionUID = 1L;

	public ConsController() {
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
		System.out.println("actionDo() 호출");

		request.setCharacterEncoding("UTF-8");

		// 컨트롤러는 다음 두개를 선택해야 한다.
		String viewPage = null; // 어떠한 뷰? --> 페이지
		Command command = null; // 어떠한 커맨드? --> 어떠한 로직 수행.

		// URL로부터 URI, ContextPath, Command 분리
		String uri = request.getRequestURI();
		String conPath = request.getContextPath();
		String com = uri.substring(conPath.length());

		// 테스트 출력
		System.out.println("uri: " + uri);
		System.out.println("conPath: " + conPath);
		System.out.println("com: " + com);

		// 컨트롤러는 커맨드에 따라, 로직을 수행하고
		// 결과를 내보낼 view 를 결정한다
		switch (com) {
		// 상담신청 페이지
		case "/consWrite.cons":
			command = new ViewCommand();
			command.execute(request, response);
			viewPage = "consWrite.jsp";
			break;
			
		// 상담신청 OK 페이지
		case "/consWriteOk.cons":
			command = new WriteCommand();
			command.execute(request, response); 
			viewPage = "consMain.jsp";
			break;
		
		// 상담매니저 페이지---------------------------------------------------------------------------
		case "/consManager.cons":
			command = new ConsListCommand();
			command.execute(request, response);
			viewPage = "consManager.jsp";
			System.out.println("consManager.cons 들어옴?");
			break;
			
		// 상담업데이트Ok
		case "/consUpdateOk.cons":
			System.out.println("들어옴");
			command = new UpdateCommand();
			command.execute(request, response);
			viewPage = "consManager.cons";
			break;	
		
		// 상담신청 삭제
		case "/consDeleteOk.cons":
			command = new DeleteCommand();
			command.execute(request, response);
			viewPage = "consManager.cons";
			break;
			
		// 검색 부분----------------------------------------------------------------------------------------------------	
		// 상담순서
		case "/consCsnoSelect.cons":
			//System.out.println("들어옴 consCsnoSelect");
			command = new SelectCommand();
			command.execute(request, response);
			viewPage = "consManager.jsp";
			break;
		
		// 상담신청아이디
		case "/consCsuidSelect.cons":
			System.out.println("들어옴 consCsuidSelect");
			command = new SelectCommand();
			command.execute(request, response);
			viewPage = "consManager.jsp";
			break;

		// 상담신청이름
		case "/consCsnameSelect.cons":
			System.out.println("들어옴 consCsnameSelect");
			command = new SelectCommand();
			command.execute(request, response);
			viewPage = "consManager.jsp";
			break;

		// 상담신청 업체명
		case "/consCnameSelect.cons":
			//System.out.println("들어옴 consCnameSelect");
			command = new SelectCommand();
			command.execute(request, response);
			viewPage = "consManager.jsp";
			break;
		
		// 상담신청 전화번호
		case "/consCstelSelect.cons":
			//System.out.println("들어옴 consCstelSelect");
			command = new SelectCommand();
			command.execute(request, response);
			viewPage = "consManager.jsp";
			break;
			
		// 상담신청 시공지역
		case "/consCsareaSelect.cons":
			//System.out.println("들어옴 consCareaSelect");
			command = new SelectCommand();
			command.execute(request, response);
			viewPage = "consManager.jsp";
			break;
			
		} // end switch
		

		// request 를 위에서 결정된 view 에 forward 해줌.
		if (viewPage != null) {
			RequestDispatcher dispatcher = request.getRequestDispatcher(viewPage);
			dispatcher.forward(request, response);
		}

	} // end actionDo()
}