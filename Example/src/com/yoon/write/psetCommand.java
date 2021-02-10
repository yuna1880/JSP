package com.yoon.write;


import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.yoon.beans.ProductDAO;

public class psetCommand implements Command {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) {
		// TODO Auto-generated method stub
		ProductDAO dao = new ProductDAO();
		int cnt = 0;

		cnt = dao.setProduct();

		request.setAttribute("Pset", cnt);
	}

}
