package co.micol.mager.member.service;

import java.util.List;

import co.micol.mager.member.vo.MemberVO;

public interface MemberService {
	List<MemberVO> memberSelectList(); // 전체멤버 가져오기	
	MemberVO memberSelect(MemberVO vo); // 한명의 멤버 가져오기
	int memberInsert(MemberVO vo);		// 멤버 추가
	int memberUpdate(MemberVO vo);		// 멤버 수정
	int memberDelete(MemberVO vo);		// 멤버 삭제
}
