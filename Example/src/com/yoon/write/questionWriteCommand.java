package com.yoon.write;

import java.sql.SQLException;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.yoon.beans.PQuestionDAO;

public class questionWriteCommand implements Command {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) {
		// TODO Auto-generated method stub
		PQuestionDAO dao = new PQuestionDAO();
		int cnt = 0;

		
		//매개변수 받아오기
		int pqpid = Integer.parseInt(request.getParameter("pqpid"));
		String pquid = request.getParameter("pquid");
		String pqcontent = request.getParameter("pqcontent");
		String pqanswer = request.getParameter("pqanswer");
		
		if( pquid !=null&&pqcontent!=null&& pqanswer !=null&&
			 pquid.trim().length()>0&&pqcontent.trim().length()>0 && pqanswer.trim().length()>0) {
			try {
				cnt = dao.pqwrite(pqpid, pquid, pqcontent, pqanswer);
				
			}catch (SQLException e) {
				e.printStackTrace();
			}
			
			
		}//end if
		
		request.setAttribute("PQwrite", cnt);
	}

}
