package com.sist.di07;

import lombok.NoArgsConstructor;

import lombok.Data;

@Data
@NoArgsConstructor
public class BaseballTeam {
	
	private String manager;
	private String battingCoach;
	private String pitcherCoach;
	private String hitter;
	private String pitcher;
	
	public BaseballTeam(String manager, String battingCoach, String pitcherCoach) {
		this.manager = manager;
		this.battingCoach = battingCoach;
		this.pitcherCoach = pitcherCoach;
	} // 인자생성자

}
