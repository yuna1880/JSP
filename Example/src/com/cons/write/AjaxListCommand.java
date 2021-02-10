package com.cons.write;

import java.io.IOException;
import java.util.Arrays;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.cons.beans.AjaxWriteList;
import com.cons.beans.comDTO;
import com.fasterxml.jackson.core.JsonProcessingException;
import com.fasterxml.jackson.databind.ObjectMapper;

public class AjaxListCommand implements Command {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) {
		comDTO[] dtoArr = (comDTO[]) request.getAttribute("list");

		AjaxWriteList result = new AjaxWriteList(); // response 할 Java 객체
	
		result.setStatus((String)request.getAttribute("status"));
		result.setMessage((String)request.getAttribute("message"));
		
		if(dtoArr != null) {
			result.setCount(dtoArr.length);
			result.setList(Arrays.asList(dtoArr));
			System.out.println(dtoArr.length);
				System.out.println(dtoArr[0]);
		}
		
		// 페이징 할때 필요한 값들
		try {			
			result.setPage((Integer)request.getAttribute("page"));
			result.setTotalPage((Integer)request.getAttribute("totalPage"));
			result.setWritePages((Integer)request.getAttribute("writePages"));
			result.setPageRows((Integer)request.getAttribute("pageRows"));
			result.setTotalCnt((Integer)request.getAttribute("totalCnt"));
			System.out.println(	(Integer)request.getAttribute("page")+ " " +
			(Integer)request.getAttribute("totalPage")  + " " +
			(Integer)request.getAttribute("writePages")  + " " +
			(Integer)request.getAttribute("pageRows")  + " " +
			(Integer)request.getAttribute("totalCnt"));
		} catch(Exception e) {
			// 개 무시..    /view.ajax 에선 페이징 관련 변수값들이 없다..
		}
		
		
		
		ObjectMapper mapper = new ObjectMapper();  // Json 매핑할 객체
		
		try {
			String jsonString = 
					mapper.writerWithDefaultPrettyPrinter()
						.writeValueAsString(result);
			response.setContentType("application/json; charset=utf-8"); 
			response.getWriter().write(jsonString);
		} catch (JsonProcessingException e) {
			e.printStackTrace();
		} catch (IOException e) {
			e.printStackTrace();
		}
	} // end execute()


}
