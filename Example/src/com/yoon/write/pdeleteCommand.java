package com.yoon.write;

import java.sql.SQLException;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.yoon.beans.PQuestionDAO;
import com.yoon.beans.ProductDAO;

public class pdeleteCommand implements Command {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) {
		// TODO Auto-generated method stub
		ProductDAO dao= new ProductDAO();
		int cnt = 0;
		
		int pqid = Integer.parseInt(request.getParameter("pid"));
		
		try {
			
			cnt = dao.pdelete(pqid);
		}catch (SQLException e) {
			e.printStackTrace();
		}
	  
		request.setAttribute("Pdelete", cnt);
	}

}
