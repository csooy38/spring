package com.soft.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

public interface InfoService {

	List<Map<String, Object>> selectInfoList();

	int updateInfo(List<Map<String, Object>> jsonList);

	int deleteInfo(List<Map<String, Object>> jsonList);

	int insertInfo(List<Map<String, Object>> jsonList);

}
