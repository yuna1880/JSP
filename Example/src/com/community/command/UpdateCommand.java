package com.community.command;

import java.sql.SQLException;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.community.beans.*;

public class UpdateCommand implements Command{

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) {
		int cnt = 0;	// 삽입 트랜잭션 성공 여부 확인

		WriteDAO dao = new WriteDAO();
		
		// 기존에 작업했던 게시글 정보 받아오기
		int no = Integer.parseInt(request.getParameter("no"));
		String title = request.getParameter("question[title]");
		String content = request.getParameter("content");
		String keyword = request.getParameter("keyword");
		
		// 백엔드 유효성 검사
		// 제목과 글을 0이거나 7자, 10자 미만이되고 
		// 키워드는 무조건 1개 이상이어야 하기 때문에 값이 null 값이면 안됨!
		if(title != null && content != null && keyword != null
						&& title.trim().length() > 7 && content.trim().length() > 10) {
			
			try {			
				cnt = dao.update(title, content, keyword, no);
			} catch(SQLException e) {
				System.out.println("UpdateCommand1 트랜젝션 에러 발생");
			} catch (Exception e) {
				System.out.println("UpdateCommand1 트랜젝션 이외의 에러 발생");
			}
			
		} // end if

		request.setAttribute("update", cnt);

	} // end execute()

} // end Command