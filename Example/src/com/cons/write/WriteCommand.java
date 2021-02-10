package com.cons.write;

import java.sql.SQLException;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.cons.beans.comDAO;

public class WriteCommand implements Command {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) {

		int cnt = 0;
		comDAO dao = new comDAO();

        HttpSession session = request.getSession();
		
		// 매개변수 받아오기
		String csuid = (session.getAttribute("id") + "").trim();
		String csname = request.getParameter("csname").trim();
		int cno = Integer.parseInt(request.getParameter("cno").trim());
		String carea = request.getParameter("CompanyArea").trim();
		String cstel = request.getParameter("cstel").trim();

		try {
			cnt = dao.insert(csuid, csname, cno, carea, cstel);
		} catch (SQLException e) {
			e.printStackTrace();
		}

		request.setAttribute("result", cnt);

	} // end execute()

} // end Command