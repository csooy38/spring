package com.soft.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

public interface InfoService {

	List<Map<String, Object>> selectInfoList();

	int insertData(List<Map<String, Object>> jsonList);

	int updateData(List<Map<String, Object>> jsonList);

	int deleteData(List<Map<String, Object>> jsonList);

}
