package com.dev.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.dev.model.EmpDAO;
import com.dev.model.EmpDTO;

@Service
public class EmpServiceImpl implements EmpService {
	
	@Autowired
	EmpDAO empdao;

	@Override
	public List<EmpDTO> empList() {
		
		return empdao.getEmpList();
	}

}
