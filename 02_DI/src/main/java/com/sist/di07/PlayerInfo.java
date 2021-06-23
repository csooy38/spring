package com.sist.di07;

import lombok.Data;
import lombok.NoArgsConstructor;

@Data				// getter/setter
@NoArgsConstructor	// 인자를 가지지 않는 생성자
public class PlayerInfo {
	
	private Player player;
	
	public void getPlayerInfo() {
		System.out.println("선수 이름 : " + player.getName());
		System.out.println("선수 나이 : " + player.getAge());
		System.out.println("선수 포지션 : " + player.getPosition());
		System.out.println("선수 체중 : " + player.getWeight());
		System.out.println("선수 신장 : " + player.getHeight());
	}

}
