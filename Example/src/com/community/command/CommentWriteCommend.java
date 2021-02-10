package com.community.command;

import java.sql.SQLException;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.community.beans.*;

public class CommentWriteCommend implements Command {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) {
		int cnt = 0;	// 삽입 트랜잭션 성공 여부 확인
		
		CommentDAO dao = new CommentDAO();
		
		// 매개변수 받아오기
		int cQno = Integer.parseInt(request.getParameter("no"));
		String cid = request.getParameter("Comment_id");
		String content = request.getParameter("commentContent");

		// 백앤드 유효성 검사
		// 내용이 null이 아닌지 확인하기
		if(content != null) {
			
			try {
				cnt = dao.insert(cQno, content, cid);
			} catch(SQLException e) {
				System.out.println("CommentWriteCommend 트랜젝션 에러 발생");
			} catch (Exception e) {
				System.out.println("CommentWriteCommend 트랜젝션 이외의 에러 발생");
			}
			
		} // end if
		
		request.setAttribute("CommentInsert", cnt);

	} // end execute()

} // end Commend