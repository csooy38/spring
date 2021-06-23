package com.sist.di03;

public class ServiceImpl {
	
	private DAO dao;

	public DAO getDao() {
		return dao;
	}

	
	// DAO 타입의 인자가 들어오면 되므로, OracleDAO타입도 MySqlDAO타입도 인자가 될 수 있다.
	public void setDao(DAO dao) {
		this.dao = dao;
	}
	
	// 비지니스 로직
	public void biz() {
		dao.add();
	}
	
}
