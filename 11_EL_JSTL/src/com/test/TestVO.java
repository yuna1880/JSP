package com.test;

import lombok.AllArgsConstructor;
import lombok.EqualsAndHashCode;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;
import lombok.ToString;

@AllArgsConstructor //생성자 만들어주는거 
@NoArgsConstructor //생성자 만들어주는거
@ToString
@Setter
@Getter
@EqualsAndHashCode//equals & hashcode (이퀄스, 해쉬코드 구현해준 것)
public class TestVO {
	
	private String name;
	private int number;
	private int kor;
	private int yuna;
	
}
