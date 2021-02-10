package com.cons.write;

import java.sql.SQLException;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.cons.beans.comDAO;
import com.cons.beans.comDTO;
public class ViewCommand implements Command {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) {
		comDAO dao = new comDAO();
		comDTO [] arr = null;
		int uid = Integer.parseInt(request.getParameter("cno"));  // 매개변수 검증 필요
		HttpSession session = request.getSession();
		String id = session.getAttribute("id") + "";
		try {
			arr = dao.readByUid(uid);  // 읽기 + 조회수 증가
			request.setAttribute("list", arr);
		} catch (SQLException e) { // 만약 ConnectionPool 을 사용한다면 여기서 NamingException 도 catch 해야 한다  
			e.printStackTrace();
		}

	}
}
