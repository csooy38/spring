package com.dev.test;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.dev.service.EmpService;

@Controller
public class EmpController {
	
	@Autowired
	private EmpService empservice;
	
	@RequestMapping(value = "/index")
	public String index(Model model) {
		
		model.addAttribute("list", empservice.empList());
		
		return "sample/index";
	}

}
