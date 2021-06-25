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
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

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

		if (result > 0) {
			out.println("<script>");
			out.println("alert('사원 등록 성공')");
			out.println("location.href='emp_list.do'");
			out.println("</script>");
		} else {
			out.println("<script>");
			out.println("alert('사원 등록 실패')");
			out.println("history.back()");
			out.println("</script>");
		}
	}

	@RequestMapping("/emp_cont.do")
	public String content(@RequestParam("empno") int empno, Model model) {

		EmpDTO dto = this.dao.empCont(empno);

		model.addAttribute("cont", dto);

		return "emp_cont";
	}

	@RequestMapping("/emp_update.do")
	public ModelAndView modify(@RequestParam("empno") int empno) {

		// 상세 내역을 조회하는 메서드 호출
		EmpDTO dto = this.dao.empCont(empno);
		List<DeptDTO> dList = this.dao.getDeptList();
		List<EmpDTO> mList = this.dao.getMgrList();

		ModelAndView mav = new ModelAndView();
		mav.addObject("modify", dto);
		mav.addObject("deptList", dList);
		mav.addObject("mgrList", mList);
		mav.setViewName("emp_updateForm");

		return mav;
	}

	@RequestMapping("/emp_updateOk.do")
	public void modifyOk(EmpDTO dto, HttpServletResponse response) throws IOException {

		response.setContentType("text/html; charset=UTF-8");

		int result = this.dao.empUpdate(dto);

		PrintWriter out = response.getWriter();

		if (result > 0) {
			out.println("<script>");
			out.println("alert('사원 수정 성공')");
			out.println("location.href='emp_cont.do?empno=" + dto.getEmpno() + "'");
			out.println("</script>");
		} else {
			out.println("<script>");
			out.println("alert('사원 수정 실패')");
			out.println("history.back()");
			out.println("</script>");
		}
	}

	@RequestMapping("/emp_delete.do")
	public void delete(@RequestParam("empno") int empno, HttpServletResponse response) throws IOException {

		response.setContentType("text/html; charset=UTF-8");

		int result = this.dao.empDelete(empno);

		PrintWriter out = response.getWriter();

		if (result > 0) {
			out.println("<script>");
			out.println("alert('사원 삭제 성공')");
			out.println("location.href='emp_list.do'");
			out.println("</script>");
		} else {
			out.println("<script>");
			out.println("alert('사원 삭제 실패')");
			out.println("history.back()");
			out.println("</script>");
		}

	}

}
