package com.community.command;

import java.sql.SQLException;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.community.beans.WriteDAO;


public class WriteCommand implements Command {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) {
		int cnt = 0;			// 삽입 트랜잭션 성공 여부 확인
		Integer[] arr = null;	// 글 삽입이 성공했다면 뷰단으로 가기위해 Qno값이 필요함
								// Qno값을 저장하기 위해 필요
		
		WriteDAO dao = new WriteDAO();

		// 매개변수 받아오기
		String title = request.getParameter("question[title]");	// 제목
		String content = request.getParameter("content");		// 질문 내용
		String keyword = request.getParameter("keyword");		// 키워드
		String qid = request.getParameter("qid");				// 작성자
		
		// 백엔드 유효성 검사
		// 제목과 글을 0이거나 7자, 10자 미만이되고 
		// 키워드는 무조건 1개 이상이어야 하기 때문에 값이 null 값이면 안됨!
		if(title != null && content != null && keyword != null
				&& title.trim().length() > 7 && content.trim().length() > 10) {
			
			try {
				// 삽입 트랜잭션 실행
				cnt = dao.insert(title, content, keyword, qid);
			} catch(SQLException e) {
				System.out.println("WriteCommand1 트랜젝션 에러 발생");
			} catch (Exception e) {
				System.out.println("WriteCommand1 트랜젝션 이외의 에러 발생");
			}
			
		} // end if
		
		dao = new WriteDAO();
		
		if(cnt != 0) {
			
			try {
				// Qno 찾는 트랜젝션 수행
				arr = dao.QnoSelect();
				// 모든 no의 값을 전달
				request.setAttribute("Qno", arr);
			} catch(SQLException e) {
				System.out.println("WriteCommand2 트랜젝션 에러 발생");
			} catch (Exception e) {
				System.out.println("WriteCommand2 트랜젝션 이외의 에러 발생");
			}
			
		} // end if
		
		request.setAttribute("result", cnt);
		
	} // end execute()

} // end Command