package co.micol.mybatis.member.serviceImpl;

import java.util.List;

import org.apache.ibatis.session.SqlSession;

import co.micol.mybatis.comm.DataSource;
import co.micol.mybatis.member.service.MemberMapper;
import co.micol.mybatis.member.service.MemberService;
import co.micol.mybatis.member.service.MemberVO;

public class MemberServiceImpl implements MemberService{
	private SqlSession sqlSession = DataSource.getInstance().openSession(true); // 연결하고 [true 넣는이유 : 자동커밋] 
	private MemberMapper map = sqlSession.getMapper(MemberMapper.class); // Mapper 활용
	
	public List<MemberVO> memberSelectList() {
		return map.memberSelectList(); //Mapper 없이 사용시
	}

	public MemberVO memberSelect(MemberVO vo) {
		return map.memberSelect(vo);
	}

	public int memberInsert(MemberVO vo) {
		return map.memberInsert(vo);
	}

	public int memberUpdate(MemberVO vo) {
		return map.memberUpdate(vo);
	}

	public int memberDelete(MemberVO vo) {
		return map.memberDelete(vo);
	}

}
