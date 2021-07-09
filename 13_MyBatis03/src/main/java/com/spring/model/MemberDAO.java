package com.spring.model;

import java.util.List;

public interface MemberDAO {
	
	public List<MemberDTO> getMemberList();
	public int insertMember(MemberDTO dto);
	public MemberDTO getMember(int num);
	public int updateMember(MemberDTO dto);
	public int deleteMember(int num);
	public int reSequence(int num);
	public List<MemberDTO> searchMemberList(String field, String keyword);

}
