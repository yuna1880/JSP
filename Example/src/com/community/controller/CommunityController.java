package com.community.controller;

import java.io.IOException;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.community.command.*;

@WebServlet("*.community")
public class CommunityController extends HttpServlet {
	private static final long serialVersionUID = 1L;

	public CommunityController() {
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
		
		request.setCharacterEncoding("UTF-8");
		
		// 컨트롤러는 다음 두개를 선택해야 한다.
		String viewPage = null;   // 어떠한 뷰? --> 페이지
		Command command = null;   // 어떠한 커맨드? --> 어떠한 로직 수행.
		
		// URL로부터 URI, ContextPath, Command 분리 
		String uri = request.getRequestURI();
		String conPath = request.getContextPath();
		String com = uri.substring(conPath.length());
		
		// 컨트롤러는 커멘드에 따라, 로직을 수행하고
		// 결과를 내보낼 view를 결정한다.
		switch(com) {
		case "/community/list.community":
			command = new ListCommand();
			command.execute(request, response);
			viewPage = "/community/list.jsp";
			break;
		
		case "/community/write.community":
			viewPage = "/community/write.jsp";
			break;
			
		case "/community/writeOk.community":
			command = new WriteCommand();
			command.execute(request, response);
			viewPage = "/community/writeOk.jsp";
			break;
			
		case "/community/view.community":
			command = new ViewCommand();
			command.execute(request, response);
			viewPage = "/community/view.jsp";
			break;
			
		case "/community/update.community":
			command = new SelectCommand();
			command.execute(request, response);
			viewPage = "/community/update.jsp";
			break;
			
		case "/community/updateOk.community":
			command = new UpdateCommand();
			command.execute(request, response);
			viewPage = "/community/updateOk.jsp";
			break;
			
		case "/community/deleteOk.community":
			command = new DeleteCommand();
			command.execute(request, response);
			viewPage = "/community/deleteOk.jsp";
			break;
			
		case "/community/commentWriteOk.community":
			command = new CommentWriteCommend();
			command.execute(request, response);
			viewPage = "/community/commentWriteOk.jsp";
			break;
			
		case "/community/reportWriteOk.community":
			command = new ReportWriteCommand();
			command.execute(request, response);
			viewPage = "/community/reportWriteOk.jsp";
			break;
			
		case "/community/comentDeleteOk.community":
			command = new CommentDeleteCommand();
			command.execute(request, response);
			viewPage = "/community/comentDeleteOk.jsp";
			break;
			
		case "/community/communityAdmin.community":
			command = new ListAdminCommand();
			command.execute(request, response);
			viewPage = "/community/communityAdmin.jsp";
			break;
			
		case "/community/communityAdminReport.community":
			command = new ReportListAdmin();
			command.execute(request, response);
			viewPage = "/community/communityAdminReport.jsp";
			break;
			
		case "/community/communityAdminComment.community":
			command = new CommentSelectAllAdmin();
			command.execute(request, response);
			viewPage = "/community/communityAdminComment.jsp";
			break;
		
		} // end switch()
		
		// request를 위에서 결정한 view에 forward 해줌.
		if(viewPage != null) {
			RequestDispatcher dispatcher = request.getRequestDispatcher(viewPage);
			dispatcher.forward(request, response);
		}
				
	} // end actionDo()

} // end controller