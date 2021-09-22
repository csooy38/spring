package com.dev.model;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class EmpDAOImpl implements EmpDAO {
	
	@Autowired
	private SqlSessionTemplate sqlSession;

	@Override
	public List<EmpDTO> getEmpList() {
		// TODO Auto-generated method stub
		return this.sqlSession.selectList("empList");
	}

}
