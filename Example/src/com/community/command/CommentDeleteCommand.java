package com.community.command;

import java.sql.SQLException;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.community.beans.*;

public class CommentDeleteCommand implements Command {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) {
		int cnt = 0;	// 성공 여부 확인을 위한 변수 선언

		CommentDAO dao = new CommentDAO();

		// 매개변수 받아오기
		int Cno = Integer.parseInt(request.getParameter("Cno"));
		int qno = Integer.parseInt(request.getParameter("qno"));
		
		try {			
			cnt = dao.deleteComment(Cno);
			
		} catch(SQLException e) {
			System.out.println("CommentDeleteCommand 트랜젝션 에러 발생");
		} catch (Exception e) {
			System.out.println("CommentDeleteCommand 트랜젝션 이외의 에러 발생");
		}

		request.setAttribute("delete", cnt);
		request.setAttribute("qno", qno);
		
	} // end execute()
	
} // end Command