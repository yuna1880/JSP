package com.bc.mybatis;

import java.io.IOException;
import java.io.Reader;

import org.apache.ibatis.io.Resources;
import org.apache.ibatis.session.SqlSessionFactory;
import org.apache.ibatis.session.SqlSessionFactoryBuilder;

// MyBatis 사용해서 작업할  SqlSession 을 만들어 줄 SqlSessionFactory
// SqlSessionFactory 객체를 생성하기 위한 클래스
public class DBService {
	private static SqlSessionFactory factory;
	
	//static 초기화문
	static {
		try {
			/* 밑에 factory 의 실제 코드들~~!
			String config = "com/mystudy/config.xml";
			Reader reader = Resources.getResourceAsReader(config);
			SqlSessionFactory factory =  new SqlSessionFactoryBuilder().build(reader);
			*/
			
			factory = new SqlSessionFactoryBuilder()
					.build(Resources.getResourceAsReader("com/bc/mybatis/config.xml"));
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}
	
	public static SqlSessionFactory getFactory() {
		return factory;
	}
	
}






