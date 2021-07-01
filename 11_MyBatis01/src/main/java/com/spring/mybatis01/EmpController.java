package com.spring.mybatis01;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;

import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.spring.model.DeptDTO;
import com.spring.model.EmpDAO;
import com.spring.model.EmpDTO;

@Controller
public class EmpController {

	@Autowired
	private EmpDAO dao;
	
	@RequestMapping("/emp_list.do")
	public String list(Model model) {
		
		List<EmpDTO> list = this.dao.getEmpList();
		model.addAttribute("list", list);
		
		return "emp_list";
	}
	
	@RequestMapping("/emp_insert.do")
	public String insert(Model model) {
		
		List<DeptDTO> deptList = this.dao.getDeptList();
		List<EmpDTO> mgrList = this.dao.getMgrList();
		
		model.addAttribute("deptList", deptList);
		model.addAttribute("mgrList", mgrList);
		
		return "emp_insert";
	}
	
	@RequestMapping("/emp_insertOk.do")
	public void insertOk(EmpDTO dto, HttpServletResponse response) throws IOException {
		
		int check = this.dao.insertEmp(dto);
		response.setContentType("text/html; charset=UTF-8");
		
		PrintWriter out = response.getWriter();
		
		if(check > 0) {
			out.println("<script>");
			out.println("alert('사원 등록 성공!')");
			out.println("location.href='emp_list.do'");
			out.println("</script>");
		}else {
			out.println("<script>");
			out.println("alert('사원 등록 실패!')");
			out.println("history.back()");
			out.println("</script>");
		}
	}
	
	@RequestMapping("/emp_cont.do")
	public String content(@RequestParam("empno") int empno, Model model) {
		
		// 상세 내역을 조회하는 메서드 호출
		EmpDTO dto = this.dao.getCont(empno);
		model.addAttribute("content", dto);
		
		return "emp_cont";
	}
	
	@RequestMapping("/emp_update.do")
	public String update(@RequestParam("empno") int empno, Model model) {
		
		EmpDTO dto = this.dao.getCont(empno);
		List<DeptDTO> deptList = this.dao.getDeptList();
		List<EmpDTO> mgrList = this.dao.getMgrList();
		
		model.addAttribute("content", dto);
		model.addAttribute("deptList", deptList);
		model.addAttribute("mgrList", mgrList);
		
		return "emp_update";
	}
	
	@RequestMapping("/emp_update_ok.do")
	public void updateOk(EmpDTO dto, HttpServletResponse response) throws IOException {
		
		response.setContentType("text/html; charset=UTF-8");
		PrintWriter out = response.getWriter();
		
		int result = this.dao.updateEmp(dto);
		
		if(result > 0) {
			out.println("<script>");
			out.println("alert('사원 수정 성공')");
			out.println("location.href='emp_cont.do?empno="+dto.getEmpno()+"'");
			out.println("</script>");
		}else {
			out.println("<script>");
			out.println("alert('사원 수정 실패')");
			out.println("history.back()");
			out.println("</script>");
		}
	}
	
	@RequestMapping("/emp_delete.do")
	public void delete(@RequestParam("empno") int empno, HttpServletResponse response) throws IOException {
		response.setContentType("text/html; charset=UTF-8");
		PrintWriter out = response.getWriter();
		
		int result = this.dao.deleteEmp(empno);
		
		if(result > 0) {
			out.println("<script>");
			out.println("alert('사원 삭제 성공')");
			out.println("location.href='emp_list.do'");
			out.println("</script>");
		}else {
			out.println("<script>");
			out.println("alert('사원 삭제 실패')");
			out.println("history.back()");
			out.println("</script>");
		}
	}
	
}
