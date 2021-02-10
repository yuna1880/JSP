package com.cons.write;

import java.sql.SQLException;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.cons.beans.consDAO;
import com.cons.beans.consDTO;

public class ConsListCommand implements Command{
	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) {
		System.out.println("ConsListCommand 들어옴");
		
		consDAO dao = new consDAO(); // DAO 객체 생성
		consDTO[] arr = null;

		int curPage = 1;   // 현재 페이지 (디폴트 1 page)
		
		// 현재 몇 페이지인지 parameter 받아오기 + 검증
		String pageParam = request.getParameter("page");
		System.out.println("pageParam 들어옴");
		if(pageParam != null && !pageParam.trim().equals("")){
			try{ 
				// 1이상의 자연수 이어야 한다
				int p = Integer.parseInt(pageParam);
				if(p > 0) curPage = p;
				request.setAttribute("curPage", curPage);
			} catch(NumberFormatException e){
				// page parameter 오류는 별도의 exception 처리 안함 
			}
		} // end if
		
		try {
			System.out.println("try 시작");
			int cnt = dao.cntAll();
			
			
			int totalPage = 0;
			int pageRows = 4;
			totalPage = (int)Math.ceil(cnt / (double)pageRows); // 총 몇페이지 분량
			
			
			request.setAttribute("totalPage", totalPage);
			// 트랜잭션 수행
			dao = new consDAO(); // DAO 객체 생성
			arr = dao.selectByRows(curPage, cnt, totalPage, pageRows);
			
			// "list" 란 name 으로 request 에 arr 값 전달
			// 즉 request 에 담아서 컨트롤러에 전달되는 셈.
			request.setAttribute("list", arr);
			request.setAttribute("curPage", curPage);

		} catch (SQLException e) {
			// 만약 CP 사용한다면
			// NamingException 도 처리 해야 함.

			e.printStackTrace();
		}
	}
}
