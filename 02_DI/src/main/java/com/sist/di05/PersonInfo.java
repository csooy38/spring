package com.sist.di05;

public class PersonInfo {
	
	private Person person;
	
	public PersonInfo() { }

	public PersonInfo(Person person) {
		this.person = person;
	} // 인자생성자
	
	public void getPersonInfo() {
		if(person != null) {
			System.out.println("이  름 : " + person.getName());
			System.out.println("성  별 : " + person.getGender());
			System.out.println("나  이 : " + person.getAge());
			System.out.println("주민번호 : " + person.getJuminNo());
		}
	}
}
