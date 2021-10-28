package co.micol.mybatis.member.service;

import java.util.List;

//MemberService 랑 거의 동일.
public interface MemberMapper { //mybatis mapper에서 사용
	List<MemberVO> memberSelectList();
	MemberVO memberSelect(MemberVO vo);
	int memberInsert(MemberVO vo);
	int memberUpdate(MemberVO vo);
	int memberDelete(MemberVO vo);
}
