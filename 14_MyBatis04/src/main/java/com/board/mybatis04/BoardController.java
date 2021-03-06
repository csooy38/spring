package com.board.mybatis04;

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

import com.board.model.BoardDAO;
import com.board.model.BoardDTO;
import com.board.model.PageDTO;

@Controller
public class BoardController {

	@Autowired
	private BoardDAO dao;
	
	private int totalRecord = 0;
	private final int rowsize = 3;
	
	@RequestMapping("board_list.do")
	public String list(HttpServletRequest request, Model model) {
		
		int page = 0;     // 현재 페이지 변수
		
		if(request.getParameter("page") != null) {
			page = Integer.parseInt(request.getParameter("page"));
		}else {
			page = 1;  // 처음으로 "게시물 전체 목록" 태그를 클릭한 경우
		}
		
		// DB상의 전체 게시물의 수를 확인하는 작업.
		totalRecord = this.dao.getListCount();
		
		PageDTO dto = new PageDTO(page, rowsize, totalRecord);
		
		// 페이지에 해당하는 게시물을 가져오는 메서드 호출
		List<BoardDTO> pageList = this.dao.getBoardList(dto);
		
		model.addAttribute("List", pageList);
		model.addAttribute("Paging", dto);
		
		return "board_list";
	}
	
	
	@RequestMapping("board_write.do")
	public String write() {
		
		return "board_writeForm";
	}
	
	
	@RequestMapping("board_write_ok.do")
	public void writeOk(BoardDTO dto,
			HttpServletResponse response) throws IOException {
		
		int check = this.dao.insertBoard(dto);
		
		response.setContentType("text/html; charset-UTF-8");
		
		PrintWriter out = response.getWriter();
		
		if(check > 0) {
			out.println("<script>");
			out.println("alert('게시판 글쓰기 성공')");
			out.println("location.href='board_list.do'");
			out.println("</script>");
		}else {
			out.println("<script>");
			out.println("alert('게시판 글쓰기 실패')");
			out.println("history.back()");
			out.println("</script>");
		}
	}
	
	
	@RequestMapping("board_cont.do")
	public String content(@RequestParam("no") int board_no,
			@RequestParam("page") int nowPage, Model model) {
		
		this.dao.readCount(board_no);  // 조회 수 증가시키는 메서드 호출
		
		// 게시글 상세내역 조회하는 메서드 호출
		BoardDTO dto = this.dao.boardCont(board_no);
		
		model.addAttribute("Cont", dto);
		
		model.addAttribute("page", nowPage);
		
		return "board_content";
		
	}
	
	
	@RequestMapping("board_update.do")
	public String modify(@RequestParam("no") int board_no,
			@RequestParam("page") int nowPage, Model model) {
		
		// 게시글 상세내역 조회하는 메서드 호출
		BoardDTO dto = this.dao.boardCont(board_no);
		
		model.addAttribute("modify", dto);
		
		model.addAttribute("page", nowPage);
		
		return "board_updateForm";
		
	}
	
	
	@RequestMapping("board_update_ok.do")
	public void modifyOk(BoardDTO dto, 
			@RequestParam("db_pwd") String db_pwd,
			@RequestParam("page") int nowPage,
			HttpServletResponse response) throws IOException {
		
		response.setContentType("text/html; charset=UTF-8");
		
		PrintWriter out = response.getWriter();
		
		int check = 0;
		
		if(dto.getBoard_pwd().equals(db_pwd)) {
			check = this.dao.updateBoard(dto);
			if(check > 0) {
				out.println("<script>");
				out.println("alert('게시글 수정 성공')");
				out.println("location.href='board_cont.do?no="+dto.getBoard_no()+"&page="+nowPage+"'");
				out.println("</script>");
			}else {
				out.println("<script>");
				out.println("alert('게시글 수정 실패~~~')");
				out.println("history.back()");
				out.println("</script>");
			}
		}else {
			out.println("<script>");
			out.println("alert('비밀번호가 틀립니다. 확인해 주세요.')");
			out.println("history.back()");
			out.println("</script>");
		}
		
	}
	
	
	@RequestMapping("board_delete.do")
	public String delete(@RequestParam("no") int board_no,
			@RequestParam("page") int nowPage, Model model) {
		
		// 게시글 상세내역 조회하는 메서드 호출
		BoardDTO dto = this.dao.boardCont(board_no);
		
		model.addAttribute("delete", dto);
		
		model.addAttribute("page", nowPage);
		
		return "board_delete";
		
	}
	
	
	@RequestMapping("board_delete_ok.do")
	public void deleteOk(@RequestParam("board_no") int board_no,
			@RequestParam("db_pwd") String db_pwd,
			@RequestParam("page") int nowPage,
			@RequestParam("pwd") String pwd,
			HttpServletResponse response) throws IOException {
		
		response.setContentType("text/html; charset=UTF-8");
		
		PrintWriter out = response.getWriter();
		
		int check = 0;
		
		if(db_pwd.equals(pwd)) {
			check = this.dao.deleteBoard(board_no);
			if(check > 0) {
				this.dao.reSequence(board_no);
				out.println("<script>");
				out.println("alert('게시물 삭제 성공')");
				out.println("location.href='board_list.do?page="+nowPage+"'");
				out.println("</script>");
			}else {
				out.println("<script>");
				out.println("alert('게시물 삭제 실패~~~')");
				out.println("history.back()");
				out.println("</script>");
			}
		}else {  // 비밀번호가 틀린 경우
			out.println("<script>");
			out.println("alert('비밀번호가 틀립니다. 확인해 주세요...')");
			out.println("history.back()");
			out.println("</script>");
		}
	}
	
	// @RequestMapping("board_search.do")
	// public String search(@RequestParam("field") String field,
	//		@RequestParam("keyword") String keyword,
	//		@RequestParam("page") int nowPage, Model model) {
		
	//	// 검색분류와 검색어에 해당하는 게시글의 갯수를 DB에서 확인하는 작업
	//	totalRecord = this.dao.searchBoardCount(field, keyword);
	//	// 
	//	PageDTO dto = new PageDTO(nowPage, rowsize, totalRecord, field, keyword);
	//	
	//	this.dao.searchBoardList(dto);
	// }
}
