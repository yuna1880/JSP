package com.community.command;

import java.sql.SQLException;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.community.beans.CommentDAO;
import com.community.beans.CommentDTO;
import com.community.beans.WriteDAO;
import com.community.beans.WriteDTO;

public class ViewCommand implements Command {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) {
		// 조회와 동시에 조회수 증가까지 필요
		WriteDAO dao = new WriteDAO();
		WriteDTO[] arr = null;
		
		// Qno 값 받아 오기
		int no = Integer.parseInt(request.getParameter("no"));
		
		try {
			arr = dao.clickReadByQno(no);
		} catch(SQLException e) {
			System.out.println("ViewCommand1 트랜젝션 에러 발생");
		} catch (Exception e) {
			System.out.println("ViewCommand1 트랜젝션 이외의 에러 발생");
		}
		
		// 등록된 댓글 모두 보기
		CommentDAO dao2 = new CommentDAO();
		CommentDTO[] arr2 = null;
		
		try {
			arr2 = dao2.select(no);
		} catch(SQLException e) {
			System.out.println("ViewCommand2 트랜젝션 에러 발생");
		} catch (Exception e) {
			System.out.println("ViewCommand2 트랜젝션 이외의 에러 발생");
		}

		request.setAttribute("view", arr);
		request.setAttribute("CommentList", arr2);

	} // end execute

} // end command