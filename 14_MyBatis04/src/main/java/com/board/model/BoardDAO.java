package com.board.model;

import java.util.List;

public interface BoardDAO {

	public int getListCount();                          // 전체 게시물 수를 확인하는 메서드.
	public List<BoardDTO> getBoardList(PageDTO dto);    // 전체 리스트를 호출 추상메서드. 
	public int insertBoard(BoardDTO dto);               // 게시물 추가 호출 추상메서드.
	public void readCount(int no);                      // 조회수를 증가시키는 추상메서드.
	public BoardDTO boardCont(int no);                  // 게시물 상세 내역 호출 추상메서드.
	public int updateBoard(BoardDTO dto);               // 게시물 수정 호출 추상메서드.
	public int deleteBoard(int no);                     // 게시물 삭제 호출 추상메서드.
	public void reSequence(int no);                     // 삭제 시 게시물 번호 재작업 추상메서드.
	public int searchBoardCount(String field, String keyword);  // 검색된 내용에 대한 촐 게시물 수 확인 추상메서드.
	public List<BoardDTO> searchBoardList(PageDTO dto); // 게시물 검색 호출 추상메서드.

}
