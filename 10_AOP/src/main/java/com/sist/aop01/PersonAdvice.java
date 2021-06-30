package com.sist.aop01;

public class PersonAdvice implements Person {
	
	private Person person;
	

	public Person getPerson() {
		return person;
	}


	public void setPerson(Person person) {
		this.person = person;
	}


	@Override
	public void doSomething() {

		// 핵심 기능 이전(before)
		System.out.println("수업 끝나고 집에 와서 문을 열고 집에 들어갑니다.");
		
		try {
			person.doSomething(); 					// 핵심 사항
			System.out.println("잠을 잡니다.");			// 핵심 기능 이후(after-returning)
		}catch (Exception e) {
			System.out.println("화재 발생 : 119에 신고");	// 예외 사항(after-throwing)
		}finally {
			// 예외가 발생하더라도 실행되는 사항(after)
			System.out.println("아침에 일어나서 문을 열고 집을 나섭니다.");
		}
	}
	
	
	
}
