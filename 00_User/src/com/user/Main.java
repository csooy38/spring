package com.user;

public class Main {
	
	public static void main(String[] args) {
		
		ConnectionMaker connectionMaker = new AConnectionMaker();
		
		UserDAO dao = new UserDAO(connectionMaker);
		
//		dto.setId("leess");
//		dto.setName("이순신");
//		dto.setPwd("1234");
//		
//		dao.add(dto);
//		
//		System.out.println(dto.getId() + " 등록 성공!");
		
		System.out.println("========================");
		
		UserDTO user = dao.getUser("hong");
		
		System.out.println("아이디 >> " + user.getId());
		System.out.println("이  름 >> " + user.getName());
		System.out.println("비밀번호 >> + " + user.getPwd());
		
		
	}

}
