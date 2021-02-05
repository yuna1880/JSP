package com.bc.model;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;

import com.bc.model.vo.EmployeeVO;
import com.bc.mybatis.DBService;

public class DAO {
	
	//페이지에 해당하는 글목록(게시글) 가져오기
	//직원 전체 목록 조회
	public static List<EmployeeVO> getList() {
		SqlSession ss = DBService.getFactory().openSession();
		List<EmployeeVO> list = ss.selectList("HR.list");
		ss.close();
		return list;
	}
	
	//부서 소속 직원 목록 조회
	public static List<EmployeeVO> getDeptList(String deptno) {
		SqlSession ss = DBService.getFactory().openSession();
		List<EmployeeVO> list = ss.selectList("HR.dept", deptno);
		ss.close();
		return list;
	}
	
	//이름으로 직원 목록 조회
	public static List<EmployeeVO> getFullnameList(String fullname) {
		SqlSession ss = DBService.getFactory().openSession();
		List<EmployeeVO> list = ss.selectList("HR.fullnameList", fullname);
		ss.close();
		return list;
	}
	
	//부서 번호(코드) 찾기
	public static List<EmployeeVO> getDeptIdList() {
		SqlSession ss = DBService.getFactory().openSession();
		List<EmployeeVO> list = ss.selectList("HR.deptIdList");
		ss.close();
		return list;
	}
	
	//동적검색
	public static List<EmployeeVO> getSearch(String idx, String keyword) {
		Map<String, String> map = new HashMap<>();
		map.put("idx", idx);
		map.put("keyword", keyword);
		
		SqlSession ss = DBService.getFactory().openSession();
		List<EmployeeVO> list = ss.selectList("HR.search", map);
		ss.close();
		return list;
	}
	
}
