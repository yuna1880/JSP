package com.yoon.write;

import java.sql.SQLException;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.yoon.beans.PQuestionDAO;
import com.yoon.beans.PQuestionDTO;

public class pqListbypidCommand implements Command {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) {
		PQuestionDAO dao = new PQuestionDAO();// DAO 객체 생성
		PQuestionDTO [] arr = null;
		int pid = Integer.parseInt(request.getParameter("pid"));
		try {
			//트랜잭션 수행
			arr = dao.selectbypid(pid);
			//"list"란 name 으로 request에 arr 값 전달
			// 즉 request 에 담아서 컨트롤러에 전달되는 셈
			request.setAttribute("Qlist", arr);
		}catch (SQLException e) {
			// 만약 CP 사용한다면
			// NamingException 도 처리 해야댐
			e.printStackTrace();
		}

	}

}
