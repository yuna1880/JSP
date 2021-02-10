package com.community.command;

import java.sql.SQLException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.community.beans.*;

public class SelectCommand implements Command {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) {
		WriteDAO dao = new WriteDAO();
		WriteDTO [] arr = null;
		
		int no = Integer.parseInt(request.getParameter("no"));

		try {
			arr = dao.onlySelectByQno(no);
			request.setAttribute("select", arr);
		} catch(SQLException e) {
			System.out.println("SelectCommand1 트랜젝션 에러 발생");
		} catch (Exception e) {
			System.out.println("SelectCommand1 트랜젝션 이외의 에러 발생");
		}

	} // end execute()

} // end Command