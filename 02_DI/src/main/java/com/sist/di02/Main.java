package com.sist.di02;

import org.springframework.context.support.AbstractApplicationContext;
import org.springframework.context.support.GenericXmlApplicationContext;

public class Main {

	public static void main(String[] args) {

		// 스프링 컨테이너 객체 생성
		// xml 설정 파일을 읽어들여서 메모리로 로딩.
		AbstractApplicationContext ctx = new GenericXmlApplicationContext("classpath:exam.xml");
		
		ExamDAO dao = (ExamDAO)ctx.getBean("daoImpl");
		
		dao.printMsg();
		
		// 사용된 자원 반납
		ctx.close();
		
	}

}
