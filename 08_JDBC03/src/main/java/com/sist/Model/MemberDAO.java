package com.sist.Model;

import java.util.List;

public interface MemberDAO {
	
	List<MemberDTO> getMemberList();
	int insertMember(MemberDTO dto);
	MemberDTO getMember(int num);
	int updateMember(MemberDTO dto);
	int deleteMember(int num);
	void updateSequence(int num);
	List<MemberDTO> searchMemberList(String field, String keyword);

}
