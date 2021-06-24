package com.sist.jdbc01;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.sist.model.DeptDTO;
import com.sist.model.EmpDAO;
import com.sist.model.EmpDTO;

@Controller
public class EmpController {

	@Autowired
	private EmpDAO dao;

	@RequestMapping("/emp_list.do")
	public String list(Model model) {
		
		List<EmpDTO> list = this.dao.getEmpList();
		model.addAttribute("List", list);
		
		return "emp_list";
	}
	
	@RequestMapping("/emp_insert.do")
	public String insert(Model model) {
		
		List<DeptDTO> dList = this.dao.getDeptList();
		List<EmpDTO> mList = this.dao.getMgrList();
		
		model.addAttribute("deptList", dList);
		model.addAttribute("mgrList", mList);
		
		return "emp_insertForm";
	}
	
	@RequestMapping("/emp_insertOk.do")
	public void insertOk(EmpDTO dto, HttpServletResponse response) throws IOException {
		
		response.setContentType("text/html; charset=UTF-8"); 
		
		int result = this.dao.empInsert(dto);
		
		PrintWriter out = response.getWriter();
		
		if(result > 0) {
			out.println("<script>");
			out.println("alert('사원 등록 성공')");
			out.println("location.href='emp_list.do'");
			out.println("</script>");
		}else {
			out.println("<script>");
			out.println("alert('사원 등록 실패')");
			out.println("history.back()");
			out.println("</script>");
		}
	}
	
	
}
