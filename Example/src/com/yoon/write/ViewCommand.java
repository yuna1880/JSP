package com.yoon.write;

import java.awt.image.BufferedImage;
import java.io.IOException;
import java.sql.SQLException;

import javax.imageio.ImageIO;
import javax.servlet.ServletContext;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import java.io.File;
import com.yoon.beans.PFileDAO;
import com.yoon.beans.PFileDTO;
import com.yoon.beans.PQuestionDAO;
import com.yoon.beans.PQuestionDTO;
import com.yoon.beans.ProductDAO;
import com.yoon.beans.ProductDTO;

public class ViewCommand implements Command {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) {
		ProductDAO dao = new ProductDAO(); //DAO 객체 생성
		ProductDTO [] arr=null;
		int pid = Integer.parseInt(request.getParameter("pid"));
		// 매개변수 받아오기



		try {
			//트랜직션수행
			arr= dao.readByUid(pid);
			request.setAttribute("view", arr);
			
		} catch(SQLException e) {

			e.printStackTrace();
		}
		
		PQuestionDAO daoQ = new PQuestionDAO();// DAO 객체 생성
		PQuestionDTO [] arrQ = null;
		int pidQ = Integer.parseInt(request.getParameter("pid"));
		try {
			//트랜잭션 수행
			arrQ = daoQ.selectbypid(pidQ);
			//"list"란 name 으로 request에 arr 값 전달
			// 즉 request 에 담아서 컨트롤러에 전달되는 셈
			request.setAttribute("Qlist", arrQ);
		}catch (SQLException e) {
			// 만약 CP 사용한다면
			// NamingException 도 처리 해야댐
			e.printStackTrace();
		}
		
		PFileDAO fileDao = new PFileDAO();
		PFileDTO [] fileArr = null;
		
		
		
		try {
			if(arr != null && arr.length == 1) {
				fileArr = fileDao.selectFilesByPid(pidQ);  // 첨부파일 읽어오기
				
				// 이미지 파일 여부 세팅
				String realPath = "";
				String saveFolder = "upload";
				ServletContext context = request.getServletContext();
				realPath = context.getRealPath(saveFolder);

				for(PFileDTO fileDto : fileArr) {
					String downloadedFilePath = realPath + File.separator + fileDto.getFile();
					BufferedImage imgData = ImageIO.read(new File(downloadedFilePath));
					if(imgData != null) {   
						fileDto.setImage(true);  // 이미지 다!
					}
				}
				
				
				request.setAttribute("file", fileArr);
			}	
		} catch(SQLException e) {
			e.printStackTrace();
		} catch (IOException e) {
			e.printStackTrace();
		}

	}
}
