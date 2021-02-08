package com.bc.controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.bc.model.dao.MembersDAO;
import com.bc.model.vo.MembersVO;

@WebServlet("/getJsonMembers")
public class GetJsonMembersController extends HttpServlet{
	
	@Override
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		System.out.println("여기");
		
		// DB에서 데이터 조회 후 Json 형식 문자열 생성 후 응답처리
		response.setContentType("text/html;charset=utf-8");
		PrintWriter out = response.getWriter();
		
		// DB 데이터 조회
		List<MembersVO> list = MembersDAO.getList();
		System.out.println("list :" + list);
		
		// 검색된 데이터 JSON 문자열로 바꾸기
		// list이름의 json객체 
		/*{"list":[{}, {}, {}, ... , {}]}
		
		{"list" : [
		     {
		     	"idx" : "idx값",
		     	"name" : "name값",
		     	"age" : "age값",
		     	"addr" : "addr값",
		     	"regdate" : "regdate값"
		     },
		     {}, {}, ... , {}
		]} 
		
		*/
		// 검색된 데이터 JSON 문자열로 바꾸기
		String result = "{\"list\" : [";
				for(MembersVO vo : list) {
					result += "{";
					
					result += "\"idx\" : \""+ vo.getIdx() +"\",";
					result += "\"name\" : \""+ vo.getName() +"\",";
					result += "\"age\" : \""+ vo.getAge() +"\",";
					result += "\"addr\" : \""+ vo.getAddr() +"\",";
					result += "\"regdate\" : \""+ vo.getRegdate() +"\"";
					result += "},";
				}
				//문자열 맨 마지막 문자 제거하기
				result = result.substring(0,result.length()-1);
				result += "]}";
				System.out.println("result" + result);
	
		//JSON 문자열 출력
		out.print(result);
		
	}
}
