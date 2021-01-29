package com.bc.mybatis;

import java.util.ArrayList;
import java.util.Iterator;
import java.util.List;

//장바구니(카트) 역할 클래스
public class Cart {
	private List<ShopVO> list; //카트에 담긴 제품 목록
	private int total; //카트에 담긴 전체 품목 가격 합계 금액
	
	//리스트값 가져오기
	public Cart() {
		list = new ArrayList<ShopVO>();
	}
	
	public List<ShopVO> getList() {
		return list;
	}

	public int getTotal() {
		return total;
	}

	/* 장바구니에 담기 요청 처리 (카트에 제품 추가) 
	 	1) list 에 없으면 제품 추가 !
	 	2) list 에 동일한 제품이 있으면 수량만 1개 증가 처리
	 */
	public void addProduct(String p_num, shopDAO dao) {
		//카트에 제품이 있는지 확인!
		ShopVO vo = findProduct(p_num);
		if (vo == null) { //카트에 없음
			vo = dao.selectOne(p_num); //p_num 사용 DB에서 조회해서 VO 생성.
			vo.setQuant(1); //카트에 담을 물건 준비 (단일품목 금액 계산완료)
			list.add(vo); // 카트에 담기
			total += vo.getP_saleprice(); //카트 total 재계산 (제품 하나 가격 추가)
		} else { //카트에 있음 --> 수량만 변경 (+1) -> 카트 total 재 계산 처리
			vo.setQuant(vo.getQuant() + 1);
			//total 재 계산 : 기존 금액 + 새로 추가된 제품 1개 가격
			total += vo.getP_saleprice();
		}
	}
	
	//카트 제품 찾기 method
	public ShopVO findProduct(String p_num) {
		// 카트에 제품이 있으면 vo로 전달해준다.
		ShopVO vo = null;
		Iterator<ShopVO> ite = list.iterator(); //순차적으로 리스트에 접근 가능한 객체 iterator
		while (ite.hasNext()) {
			ShopVO listVO = ite.next();
			if (listVO.getP_num().equals(p_num)) {
				vo = listVO;
				break;
			}
		}
		return vo;
	}
	
	//카트에서 제품 삭제 (delete)
	public void delProduct(String p_num) {
		ShopVO vo =  findProduct(p_num);
		if (vo != null) {
			list.remove(vo);
			
			//카트에서 삭제한 만큼 (합계금액 - 제품금액 )
			total = total - vo.getTotalprice();
		}
	}
	
	//제품수량 변경 처리
	public void setQuant(String p_num, int su) {
		//0. 카트에 있는지 확인. (있으면 작업하고, 없으면 종료하기.)
		ShopVO vo = findProduct(p_num);
		if (vo == null) return;
		//카트에 있으면!
		//1. 카트 합계 금액 수정 : 기존 품목 금액 빼기
		total = total - vo.getTotalprice();
			
		//2. 제품 수량 변경 
		vo.setQuant(su);
			
		//3. 카트 합계금액 변경 : 합계금액에 변경된 품목 더하기
		total += vo.getTotalprice();
	}

	//제품수량 변경 처리2
	public void setQuant2 (String p_num, int su) {
		//0. 카트에 있는지 확인. (있으면 작업하고, 없으면 종료하기.)
		ShopVO vo = findProduct(p_num);
		if (vo == null) return;
		
		// ( 새로 구입 수량  - 기존 수량 ) ( 5 - 3 = 2)
		int gapCnt = su - vo.getQuant();
		vo.setQuant(gapCnt); //수량 변경 완! (품목당 재 계산 처리가 된다.)
		
		total += (gapCnt * vo.getP_saleprice());
		}
	
	
	
	
}
