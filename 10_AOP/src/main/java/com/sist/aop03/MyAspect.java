package com.sist.aop03;

import org.aspectj.lang.annotation.After;
import org.aspectj.lang.annotation.AfterReturning;
import org.aspectj.lang.annotation.AfterThrowing;
import org.aspectj.lang.annotation.Aspect;
import org.aspectj.lang.annotation.Before;
import org.aspectj.lang.annotation.Pointcut;
import org.springframework.stereotype.Component;

// 스프링 AOP에서 공통 관심 사항이 있는 코드들의 묶음 ==> Advice
@Component
@Aspect
public class MyAspect {
	private double time;
	
	@Pointcut("execution(* doSomething())")	// 어느 클래스든 doSomething() 이 pointcut이 된다
	public void myPointcut() { }
	
	@Before("myPointcut()")	// myPointcut() 메서드 이전에 실행
	public void before() {
		time = System.nanoTime();
		System.out.println("수업 끝나고 집에 와서 문을 열고 집에 들어갑니다.");
	}
	
	@After("myPointcut()")
	public void af() {
		time = System.nanoTime() - time;
		System.out.println("아침에 일어나서 문을 열고 집을 나섭니다.");
		System.out.println("걸린 시간 : " + time + "ns");
	}
	
	@AfterReturning("myPointcut()")
	public void after_returning() {
		System.out.println("잠을 잡니다.");	
	}
	
	@AfterThrowing("myPointcut()")
	public void after_throwing() {
		System.out.println("화재 발생 : 119에 신고");	
	}
}
