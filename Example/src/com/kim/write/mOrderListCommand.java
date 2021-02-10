package com.kim.write;

import java.sql.SQLException;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.kim.beans.OrderDAO;
import com.kim.beans.OrderDTO;

public class mOrderListCommand implements Command {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) {

		OrderDAO dao = new OrderDAO(); // DAO 객체 생성
		OrderDTO[] arr = null;

		try {
			// 트랜직션수행
			arr = dao.mSelect();
			request.setAttribute("list", arr);

			// "list" 란 name 으로 request 에 arr 값 전달
			// 즉 request 에 담아서 컨트롤러에 전달되는 셈.

		} catch (SQLException e) {
			// 만약 CP 사용한다면
			// NamingException 도 처리 해야함 .

			e.printStackTrace();
		}

//---------------------------------------------------------------------------------------------		
		
		 OrderDAO daoM = new OrderDAO(); //DAO 객체 생성
		 
		// 매개변수 받아오기
		int code0;

		try {
			//트랜직션수행
			code0= daoM.listCnt(0);
			request.setAttribute("code0", code0);
			
		} catch(SQLException e) {

			e.printStackTrace();
		}
		
//---------------------------------------------------------------------------------------------		
		
		OrderDAO daoM_1 = new OrderDAO();
		// 매개변수 받아오기
		int code1;
		try {
			//트랜직션수행
			code1= daoM_1.listCnt(1);
			request.setAttribute("code1", code1);
			
		} catch(SQLException e) {
			
			e.printStackTrace();
		}
		
		
//---------------------------------------------------------------------------------------------
		OrderDAO daoS = new OrderDAO(); // DAO 객체 생성
		OrderDTO[] arrS = null;

		try {
			// 트랜직션수행
			arrS = daoS.mSort();
			request.setAttribute("sort", arrS);

			// "list" 란 name 으로 request 에 arr 값 전달
			// 즉 request 에 담아서 컨트롤러에 전달되는 셈.

		} catch (SQLException e) {
			// 만약 CP 사용한다면
			// NamingException 도 처리 해야함 .

			e.printStackTrace();
		}

	}

}
