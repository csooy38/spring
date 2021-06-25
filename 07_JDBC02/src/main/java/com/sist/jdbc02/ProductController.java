package com.sist.jdbc02;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;

import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.sist.model.CategoryDTO;
import com.sist.model.ProductDAO;
import com.sist.model.ProductDTO;

@Controller
public class ProductController {

	@Autowired
	private ProductDAO dao;

	@RequestMapping("/product_list.do")
	public String list(Model model) {

		List<ProductDTO> list = this.dao.getProductList();
		model.addAttribute("List", list);

		return "product_list";
	}

	@RequestMapping("/product_insert.do")
	public String insert(Model model) {

		List<CategoryDTO> list = this.dao.categoryList();
		model.addAttribute("cateList", list);
		return "product_insertForm";
	}

	@RequestMapping("/product_insertOk.do")
	public void insertOk(ProductDTO dto, HttpServletResponse response) throws IOException {

		response.setContentType("text/html; charset=UTF-8");

		int result = this.dao.insertProduct(dto);

		PrintWriter out = response.getWriter();

		if (result > 0) {
			out.println("<script>");
			out.println("alert('제품 등록 성공')");
			out.println("location.href='product_list.do'");
			out.println("</script>");
		} else {
			out.println("<script>");
			out.println("alert('제품 등록 실패')");
			out.println("history.back");
			out.println("</script>");
		}
	}

	@RequestMapping("/product_cont.do")
	public ModelAndView content(@RequestParam("pnum") int pnum) {

		ProductDTO dto = this.dao.getProductCont(pnum);

		ModelAndView mav = new ModelAndView();
		mav.addObject("content", dto);
		mav.setViewName("product_content");

		return mav;
	}

	@RequestMapping("/product_modify.do")
	public String modify(@RequestParam("pnum") int pnum, Model model) {

		ProductDTO pdto = this.dao.getProductCont(pnum);
		List<CategoryDTO> cdto = this.dao.categoryList();

		model.addAttribute("content", pdto);
		model.addAttribute("cateList", cdto);

		return "product_modify";
	}

	@RequestMapping("/product_modifyOk.do")
	public void modifyOk(ProductDTO dto, HttpServletResponse response) throws IOException {
		response.setContentType("text/html; charset=UTF-8");
		
		int result = this.dao.updateProduct(dto);
		
		PrintWriter out = response.getWriter();

		if (result > 0) {
			out.println("<script>");
			out.println("alert('제품 수정 성공')");
			out.println("location.href='product_cont.do?pnum="+dto.getPnum()+"'");
			out.println("</script>");
		} else {
			out.println("<script>");
			out.println("alert('제품 수정 실패')");
			out.println("history.back");
			out.println("</script>");
		}
	}

}
