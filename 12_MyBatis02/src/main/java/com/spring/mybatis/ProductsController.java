package com.spring.mybatis;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.spring.model.productDAO;
import com.spring.model.productDTO;

@Controller
public class ProductsController {

	@Autowired
	private productDAO dao;
	
	@RequestMapping("/products_list.do")
	public String list(Model model) {
		
		List<productDTO> list = this.dao.getProductsList();
		model.addAttribute("list", list);
		
		return "products_list";
	}
	
	
}
