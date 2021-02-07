package com.bc.model;

import java.util.List;

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
	
	public static List<EmployeeVO> getDeptList(String deptno) {
		SqlSession ss = DBService.getFactory().openSession();
		List<EmployeeVO> list = ss.selectList("HR.dept", deptno);
		ss.close();
		return list;
	}
}
