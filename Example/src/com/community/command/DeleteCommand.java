package com.community.command;

import java.sql.SQLException;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.community.beans.*;

public class DeleteCommand implements Command {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) {
		int cnt = 0;	// 성공 여부 확인을 위한 변수 선언

		WriteDAO dao = new WriteDAO();

		// 매개변수 받아오기
		int no = Integer.parseInt(request.getParameter("no"));

		try {			
			cnt = dao.deleteByQno(no);
		} catch(SQLException e) {
			System.out.println("DeleteCommand 트랜젝션 에러 발생");
		} catch (Exception e) {
			System.out.println("DeleteCommand 트랜젝션 이외의 에러 발생");
		}

		request.setAttribute("delete", cnt);

	} // end execute()

} // end Command