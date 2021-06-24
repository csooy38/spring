package com.sist.mvc02;

import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

@Controller
public class MyController {
	
	@RequestMapping("/input")	// 매핑이 중요
	public String aaa() {		// 메서드 이름은 큰 의미X
		
		// "/input"으로 들어오면 "WEB-INF/views/insertForm.jsp"로 이동하라
		return "insertForm";	
	}
	
	@RequestMapping("/inputOk")
	public String bbb(HttpServletRequest request, Model model) {
		
		String name = request.getParameter("name").trim();
		String id = request.getParameter("id").trim();
		
		model.addAttribute("userName", name);
		model.addAttribute("userId", id);		
		
		return "login";
	}
	
	@RequestMapping("/insert")
	public String bbc() {
		
		return "insert";
	}
	
	@RequestMapping("/insertOk")
	public ModelAndView bcc(@RequestParam("id") String userId, 
			@RequestParam("pwd") String userPwd) {
		
		ModelAndView mav = new ModelAndView();
		
		mav.addObject("userId", userId);
		mav.addObject("userPwd", userPwd);
		mav.addObject("insertOk");

		return mav;
	}

}
