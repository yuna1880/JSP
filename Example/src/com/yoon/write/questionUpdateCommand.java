package com.yoon.write;

import java.sql.SQLException;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.yoon.beans.PQuestionDAO;

public class questionUpdateCommand implements Command {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) {
		// TODO Auto-generated method stub
		PQuestionDAO dao= new PQuestionDAO();
		int cnt = 0;
		
		int pqid = Integer.parseInt(request.getParameter("pqid"));
		String pqanswer = request.getParameter("pqanswer");
		
		try {
			
			cnt = dao.pqupdate(pqid, pqanswer);
		}catch (SQLException e) {
			e.printStackTrace();
		}
	  
		request.setAttribute("PQupdate", cnt);
		
	}

}
