package com.sist.aop02;

// 스프링 AOP에서 공통 관심 사항이 있는 코드들의 묶음 ==> Advice
public class MyAspect {
	private double time;
	
	public void before() {
		time = System.nanoTime();
		System.out.println("수업 끝나고 집에 와서 문을 열고 집에 들어갑니다.");
	}
	
	public void af() {
		time = System.nanoTime() - time;
		System.out.println("아침에 일어나서 문을 열고 집을 나섭니다.");
	}
	
	public void after_returning() {
		System.out.println("잠을 잡니다.");	
	}
	
	public void after_throwing() {
		System.out.println("화재 발생 : 119에 신고");	
	}
}
