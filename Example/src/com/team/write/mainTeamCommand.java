package com.team.write;

import java.sql.SQLException;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.cons.beans.comDAO;
import com.cons.beans.comDTO;
import com.yoon.beans.ProductDAO;
import com.yoon.beans.ProductDTO;

public class mainTeamCommand implements Command{
	
	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) {
		ProductDAO dao = new ProductDAO();// DAO 객체 생성
		//아까 DAO 와 다른점 : 생성된 위치가 다르다
		ProductDTO [] arr = null;
		
		try {
			//트랜잭션 수행
			arr = dao.selectRandom();
			//"list"란 name 으로 request에 arr 값 전달
			// 즉 request 에 담아서 컨트롤러에 전달되는 셈
			request.setAttribute("randomProduct", arr);
			
			//정종훈	--------------------------------------------------
			comDAO daoJH = new comDAO();
			comDTO[] arrJH = null;
			
			arrJH = daoJH.selectRandom();
			request.setAttribute("randomCompany", arrJH);
			
			// -------------------------------------------------------
			
			
			
		}catch (SQLException e) {
			// 만약 CP 사용한다면
			// NamingException 도 처리 해야댐
			e.printStackTrace();
		}
		
		
		
		
	}
}
