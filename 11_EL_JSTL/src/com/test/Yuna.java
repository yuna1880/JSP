package com.test;

public class Yuna {
	
	public static void main(String[] args) {
		
		TestVO vo = new TestVO("aa", 1, 2, 3);
		TestVO vo1 = new TestVO("aa", 1, 2, 3);
		
		System.out.println("vo == vo1 : " + (vo == vo1));
		System.out.println("vo.equals(vo1) : " + (vo.equals(vo1)));
		
		System.out.println(vo);
		
	}
	

	
}
