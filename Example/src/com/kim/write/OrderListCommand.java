package com.kim.write;

import java.sql.SQLException;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.kim.beans.OrderDAO;
import com.kim.beans.OrderDTO;

public class OrderListCommand implements Command {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) {

		OrderDAO dao = new OrderDAO(); // DAO 객체 생성
		OrderDTO[] arr = null;
		HttpSession session = request.getSession();
		String pcuid = session.getAttribute("id") + "";
		try {
			// 트랜직션수행
			arr = dao.select(pcuid);
			request.setAttribute("list", arr);

		} catch (SQLException e) {

			e.printStackTrace();
		}

		OrderDAO daoM = new OrderDAO(); // DAO 객체 생성

		// 매개변수 받아오기
		int code0;

		try {
			// 트랜직션수행
			code0 = daoM.orderList(pcuid,0);
			request.setAttribute("code0", code0);

		} catch (SQLException e) {

			e.printStackTrace();
		}

		// ---------------------------------------------------------------------------------------------

		OrderDAO daoM_1 = new OrderDAO();
		// 매개변수 받아오기
		int code1;
		try {
			// 트랜직션수행
			code1 = daoM_1.orderList(pcuid,1);
			request.setAttribute("code1", code1);

		} catch (SQLException e) {

			e.printStackTrace();
		}

	}

}
