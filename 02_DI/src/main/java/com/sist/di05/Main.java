package com.sist.di05;

import org.springframework.context.support.AbstractApplicationContext;
import org.springframework.context.support.GenericXmlApplicationContext;

public class Main {

	public static void main(String[] args) {

		AbstractApplicationContext ctx = new GenericXmlApplicationContext("classpath:person.xml");
		
		PersonInfo person = (PersonInfo)ctx.getBean("info");
		
		person.getPersonInfo();
		
		ctx.close();
		
	}

}
