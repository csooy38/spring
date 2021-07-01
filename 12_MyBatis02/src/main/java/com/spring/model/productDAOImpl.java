package com.spring.model;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class productDAOImpl implements productDAO {
	
	@Autowired
	private SqlSessionTemplate sqlSession;

	@Override
	public List<productDTO> getProductsList() {

		return this.sqlSession.selectList("productsList");
	}

}
