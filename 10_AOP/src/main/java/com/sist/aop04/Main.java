package com.sist.aop04;

import org.springframework.context.support.AbstractApplicationContext;
import org.springframework.context.support.GenericXmlApplicationContext;

public class Main {

	public static void main(String[] args) {

		AbstractApplicationContext ctx = new GenericXmlApplicationContext("classpath:aop04.xml");
		
		Staff staff = (Staff)ctx.getBean("staff");
		staff.getStaffInfo();
		
		System.out.println("===============================");
		
		Student student = (Student)ctx.getBean("student");
		student.getStudentInfo();
		
		ctx.close();
	}

}
