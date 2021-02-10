package com.kim.write;

import java.sql.SQLException;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.kim.beans.OrderDAO;
import com.kim.beans.OrderDTO;



public class DeleteCommand implements Command {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) {
		OrderDAO dao = new OrderDAO(); //DAO 객체 생성
		int cnt=0;
		int pid = Integer.parseInt(request.getParameter("pid"));
		// 매개변수 받아오기

		try {
			//트랜직션수행
			cnt= dao.deleteByUid(pid);
		
			request.setAttribute("delete", cnt);
			
		} catch(SQLException e) {

			e.printStackTrace();
		}
		
	

	}


}