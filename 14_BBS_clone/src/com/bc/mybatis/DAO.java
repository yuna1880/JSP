package com.bc.mybatis;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;


public class DAO {
	
	//게시글(BBS_T)의 전체 건수 조회
	public static int getTotalCount() {
		SqlSession ss = DBService.getFactory().openSession();
		int totalCount = ss.selectOne("BBS.totalCount");
		ss.close();
		return totalCount;
	}
	
	// 페이지에 해당하는 게시글 목록 가져오기.
	public static List<BBSVO> getList(Map<String, Integer> map) {
		SqlSession ss = DBService.getFactory().openSession();
		List<BBSVO> list = ss.selectList("BBS.list",map);
		ss.close();
		return list;
	}
	
	// 조회수 증가처리
	public static int updateHit(String b_idx) {
		SqlSession ss = DBService.getFactory().openSession();
		int hit = ss.update("BBS.hit", b_idx);
		return hit;
	}
	
	

}
