package com.soft.dao;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class InfoDao {

	@Autowired
	private SqlSessionTemplate sqlSession;

	@SuppressWarnings("unchecked")
	public List<Map<String, Object>> selectInfoList() {
		return sqlSession.selectList("infoList");
	}
	
	
}
