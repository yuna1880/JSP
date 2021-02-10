package com.yoon.write;

import java.sql.SQLException;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.yoon.beans.PQuestionDAO;
import com.yoon.beans.ProductDAO;

public class pupdateCommand implements Command {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) {
		// TODO Auto-generated method stub
		ProductDAO dao= new ProductDAO();
		int cnt = 0;
		
		int pid = Integer.parseInt(request.getParameter("pid"));
		int pprice = Integer.parseInt(request.getParameter("pprice"));
		String pname = request.getParameter("pname");
		String pbrand = request.getParameter("pbrand");
		
		
		
		try {
			
			cnt = dao.pupdate(pid, pname, pprice, pbrand);
		}catch (SQLException e) {
			e.printStackTrace();
		}
	  
		request.setAttribute("Pupdate", cnt);
	}

}
