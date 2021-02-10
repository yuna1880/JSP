package com.yoon.write;

import java.sql.SQLException;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.yoon.beans.PQuestionDAO;

public class questionDeleteCommand implements Command {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) {
		// TODO Auto-generated method stub
		PQuestionDAO dao= new PQuestionDAO();
		int cnt = 0;
		
		int pqid = Integer.parseInt(request.getParameter("pqid"));
		
		try {
			
			cnt = dao.pqdelete(pqid);
		}catch (SQLException e) {
			e.printStackTrace();
		}
	  
		request.setAttribute("PQdelete", cnt);
		
		
	}

}
