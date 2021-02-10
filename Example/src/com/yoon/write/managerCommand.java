package com.yoon.write;

import java.io.IOException;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.Enumeration;
import java.util.List;

import javax.servlet.ServletContext;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;
import com.oreilly.servlet.multipart.FileRenamePolicy;
import com.yoon.beans.PFileDAO;

public class managerCommand implements Command {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) {
		// TODO Auto-generated method stub
		int cnt = 0;
		PFileDAO dao = new PFileDAO();
		
		//----------------------------------------
		// 업로드 파일
		ServletContext context= request.getServletContext();
		String saveDirectory = context.getRealPath("upload");
		
		int maxPostSize = 5*1024*1024;//최대파일 5mb
		String encoding = "utf-8";
		FileRenamePolicy policy = new DefaultFileRenamePolicy();
		MultipartRequest multi = null;
		
		try {
			multi = new MultipartRequest(
					request, 
					saveDirectory,
					maxPostSize,
					encoding,
					policy);
		} catch (IOException e1) {
			// TODO Auto-generated catch block
			e1.printStackTrace();
		}
		
		
		List<String> originalFileNames = new ArrayList<String>();
		List<String> fileSystemNames = new ArrayList<String>();
		
		Enumeration names = multi.getFileNames();//type = "file" 요소의 name 들 추출
		while(names.hasMoreElements()) {
			String name = (String)names.nextElement();
			String originalFileName = multi.getOriginalFileName(name);
			String fileSystemName = multi.getFilesystemName(name);
			System.out.println("첨부파일 : "+originalFileName + "->"+fileSystemName);
			
			if(originalFileName!=null&&fileSystemName!=null) {
				originalFileNames.add(originalFileName);
				fileSystemNames.add(fileSystemName);
			}
			
					
		}//end while
		
		
		
		
		//매개변수 받아오기
		int pid = Integer.parseInt(multi.getParameter("pid")); //★ MultiparatRequest 객체 사용
		System.out.println(pid);
			try {
				//★첨부파일 정보 같이 INSERT
				cnt = dao.insert(pid, originalFileNames, fileSystemNames);
				
			}catch (SQLException e) {
				e.printStackTrace();
			}
			
			
		
		request.setAttribute("pfile", cnt);
	}

}
