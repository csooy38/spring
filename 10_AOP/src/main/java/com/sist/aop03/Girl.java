package com.sist.aop03;

import org.springframework.stereotype.Component;

/*
 * 여자(청소년) 
 * - 수업 끝나고 집에 와서 문을 열고 집에 들어갑니다.	=> 공통 관심 사항(before)
 * - TV로 드라마를 봅니다.					=> 핵심 사항
 * - 잠을 잡니다.							=> 공통 관심 사항(after-returning)
 * - 화재 발생 : 119에 신고					=> 공통 관심 사항(after-throwing)
 * - 아침에 일어나서 문을 열고 집을 나섭니다.		=> 공통 관심 사항(after)
 */
@Component
public class Girl implements Person {

	@Override
	public void doSomething() {	// 핵심 사항
		System.out.println("TV로 드라마를 봅니다.");
	}

}
