package com.sist.di11;

import java.util.ArrayList;

import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.context.annotation.ImportResource;

/*
 * DI 설정 시 Java 코드에서 애노테이션을 설정하여 주입하는 방법
 * 
 * - 설정 시 cglib 라이브러리가 반드시 필요.
 *  => pom.xml 파일에 라이브러리 추가해야 한다.
 *  
 * - @Configuration, @Bean 
 * 
 * - @Configuration : 클래스 앞에 선언하는 애노테이션.
 * 	"해당 클래스는 스프링 설정에 사용되는 클래스입니다."라고 알려주는 애노테이션.
 * 
 * - @bean : 메소드 앞에 사용되는 애노테이션.
 * 	"해당 메서드는 객체를 생성하는데 사용됩니다." 의미.
 * 
 * - 애노테이션 역할
 * 	* 컴파일러에게 정보를 알려주는 역할.
 *  * 컴파일 할 때와 설치 시의 작업을 지정하는 역할.
 *  * 실행할 때에 별도의 처리가 필요한 경우 사용되는 역할.
 */

@Configuration
@ImportResource("classpath:baseball4.xml")
public class Config {
	
	@Bean
	public Player player1() {
		ArrayList<String> position = new ArrayList<String>();
		position.add("4번 타자");
		position.add("1루수");
		
		Player player = new Player("추신수", 38, position);
		
		player.setWeight(100);
		player.setHeight(188);
		
		return player;
	}
	
	@Bean
	public Player player2() {
		ArrayList<String> position = new ArrayList<String>();
		position.add("9번 타자");
		position.add("투수");
		
		Player player = new Player("류현진", 33, position);
		
		player.setWeight(110);
		player.setHeight(190);
		
		return player;
	}
}
