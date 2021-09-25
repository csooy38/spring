package com.soft.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.soft.dao.InfoDao;

@Service
public class InfoServiceImpl implements InfoService {

	@Autowired
	private InfoDao infoDao;

	@Override
	public List<Map<String, Object>> selectInfoList() {
		return infoDao.selectInfoList();
	}

	@Override
	public int insertData(List<Map<String, Object>> jsonList) {
		return infoDao.insertData(jsonList);
	}

	@Override
	public int updateData(List<Map<String, Object>> jsonList) {
		return infoDao.updateData(jsonList);
	}

	@Override
	public int deleteData(List<Map<String, Object>> jsonList) {
		return infoDao.deleteData(jsonList);
	}
}
