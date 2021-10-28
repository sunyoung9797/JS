package co.micol.mybatis.command;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import co.micol.mybatis.comm.Command;
import co.micol.mybatis.member.service.MemberService;
import co.micol.mybatis.member.service.MemberVO;
import co.micol.mybatis.member.serviceImpl.MemberServiceImpl;

public class MemberSelect implements Command {

	@Override
	public String run(HttpServletRequest request, HttpServletResponse response) {
		// TODO Auto-generated method stub
		HttpSession session = request.getSession();
		MemberService memberDao = new MemberServiceImpl();
		MemberVO vo = new MemberVO();
		vo.setId((String) session.getAttribute("id")); //세션이 가지고 있는 id값을 가져온다.
		
		request.setAttribute("member", memberDao.memberSelect(vo));
		return "member/memberSelect";
	}

}
