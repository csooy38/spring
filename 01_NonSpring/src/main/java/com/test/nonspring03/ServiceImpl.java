package com.test.nonspring03;

public class ServiceImpl {

	private DAO dao;
	
	public ServiceImpl() {	} // 기본 생성자
	
	public ServiceImpl(DAO dao) {
		this.dao = dao;
	} // 인자생성자

	public DAO getDao() {
		return dao;
	}

	public void setDao(DAO dao) {
		this.dao = dao;
	}
	
	// 비즈니스 로직
	public void biz() {
		dao.add();
	}
}
