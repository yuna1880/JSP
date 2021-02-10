package com.cons.write;

import java.sql.SQLException;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.cons.beans.consDAO;


public class DeleteCommand implements Command {
	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) {
		int cnt = 0;
		consDAO dao = new consDAO();

		//입력한 값을 받아오기
		System.out.println(request.getParameter("csno"));
		int uid = Integer.parseInt(request.getParameter("csno"));

		try {			
			cnt = dao.deleteByUid(uid);
		} catch (SQLException e) {
			e.printStackTrace();
		}

		request.setAttribute("result", cnt);
	}	// end main
} // end class
