package com.sist.aop02;

/*
 * 남자(청소년) 
 * - 수업 끝나고 집에 와서 문을 열고 집에 들어갑니다.	=> 공통 관심 사항(before)
 * - 컴퓨터로 게임을 합니다.					=> 핵심 사항
 * - 잠을 잡니다.							=> 공통 관심 사항(after-returning)
 * - 화재 발생 : 119에 신고					=> 공통 관심 사항(after-throwing)
 * - 아침에 일어나서 문을 열고 집을 나섭니다.		=> 공통 관심 사항(after)
 */
public class Boy implements Person {
	@Override
	public void doSomething() {	// 핵심 사항
		System.out.println("컴퓨터로 게임을 합니다.");
	}
}
