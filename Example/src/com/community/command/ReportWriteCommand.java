package com.community.command;

import java.sql.SQLException;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.community.beans.*;

public class ReportWriteCommand implements Command {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) {
		int cnt = 0;

		ReportDAO dao = new ReportDAO();

		// 매개변수 받아오기 Rno, Rmember_id, Rtype, Rqno
		int Rtype = Integer.parseInt(request.getParameter("type"));	// 신고 유형
		int Rqno = Integer.parseInt(request.getParameter("no"));	// 게시글 번호, FK
		String Rid = request.getParameter("reportId");				// 신고 아이디, FK
		
		try {
			cnt = dao.insert(Rid, Rtype, Rqno);
		} catch(SQLException e) {
			e.printStackTrace();
		} 
			
		request.setAttribute("report", cnt);
		request.setAttribute("Rqno", Rqno);
		
	} // end execute()

} // end commend