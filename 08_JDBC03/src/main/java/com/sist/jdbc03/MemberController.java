package com.sist.jdbc03;

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

import com.sist.Model.MemberDAO;
import com.sist.Model.MemberDTO;

@Controller
public class MemberController {

	@Autowired
	private MemberDAO dao;

	@RequestMapping("/member_list.do")
	public String list(Model model) {

		List<MemberDTO> list = this.dao.getMemberList();
		model.addAttribute("memberList", list);

		return "member_list";
	}

	@RequestMapping("/member_add.do")
	public String add() {
		return "member_addForm";
	}

	@RequestMapping("/member_addOk.do")
	public void addOk(MemberDTO dto, HttpServletResponse response) throws IOException {

		response.setContentType("text/html; charset=UTF-8");
		PrintWriter out = response.getWriter();

		int result = this.dao.insertMember(dto);

		if (result > 0) {
			out.println("<script>");
			out.println("alert('회원 추가 성공')");
			out.println("location.href='member_list.do'");
			out.println("</script>");
		} else {
			out.println("<script>");
			out.println("alert('회원 추가 실패')");
			out.println("history.back()");
			out.println("</script>");
		}
	}

	@RequestMapping("/member_cont.do")
	public String content(@RequestParam("num") int num, Model model) {

		MemberDTO dto = this.dao.getMember(num);
		model.addAttribute("dto", dto);

		return "member_cont";
	}

	@RequestMapping("/member_update.do")
	public ModelAndView update(@RequestParam("num") int num, Model model) {

		MemberDTO dto = this.dao.getMember(num);

		ModelAndView mav = new ModelAndView();
		mav.addObject("dto", dto);
		mav.setViewName("member_updateForm");

		return mav;
	}

	@RequestMapping("/member_updateOk.do")
	public void updateOk(MemberDTO dto, HttpServletResponse response) throws IOException {
		
		response.setContentType("text/html; charset=UTF-8");
		PrintWriter out = response.getWriter();
		
		MemberDTO mdto = this.dao.getMember(dto.getNum());
		
		System.out.println("mdto.getpwd>>" + mdto.getPwd());
		System.out.println("dto.getpwd >>" + dto.getPwd());
		
		int result = 0;
		if(mdto.getPwd().equals(dto.getPwd())) {
			result = this.dao.updateMember(dto);
			
			if(result > 0) {
				out.println("<script>");
				out.println("alert('회원 수정 성공')");
				out.println("location.href='member_cont.do?num="+dto.getNum()+"'");
				out.println("</script>");
			}else {
				out.println("<script>");
				out.println("alert('회원 수정 실패')");
				out.println("history.back()");
				out.println("</script>");
			}
		}else {
			out.println("<script>");
			out.println("alert('비밀번호를 확인해주세요.')");
			out.println("history.back()");
			out.println("</script>");
		}
		
		
	}

	@RequestMapping("/member_delete.do")
	public void delete(@RequestParam("num") int num, HttpServletResponse response) throws IOException {
		response.setContentType("text/html; charset=UTF-8");
		PrintWriter out = response.getWriter();
		
		int result = this.dao.deleteMember(num);
		
		if(result > 0) {
			this.dao.updateSequence(num);
			out.println("<script>");
			out.println("alert('회원 삭제 성공')");
			out.println("location.href='member_list.do'");
			out.println("</script>");
		}else {
			out.println("<script>");
			out.println("alert('회원 삭제 실패')");
			out.println("history.back()");
			out.println("</script>");
		}
	}
	
	@RequestMapping("/member_search.do")
	public ModelAndView search(@RequestParam("field") String field, @RequestParam("keyword") String keyword) {
		
		ModelAndView mav = new ModelAndView();
		
		List<MemberDTO> searchList = this.dao.searchMemberList(field, keyword);
		mav.addObject("searchList", searchList);
		mav.setViewName("member_search");
		
		return mav;
	}
	
}
