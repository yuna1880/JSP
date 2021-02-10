package com.cons.write;

import java.sql.SQLException;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.cons.beans.consDAO;

public class UpdateCommand implements Command {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) {
		int cnt = 0;

		consDAO dao = new consDAO();

		// 입력한 값을 받아오기
		int csno = Integer.parseInt(request.getParameter("csno"));
		String csname = request.getParameter("csname");
		String csarea = request.getParameter("csarea");
		String cstel = request.getParameter("cstel");

		try {
			cnt = dao.update(csno, csname, csarea, cstel);
		} catch (SQLException e) {
			e.printStackTrace();
		}

		request.setAttribute("result", cnt);

	}
}
