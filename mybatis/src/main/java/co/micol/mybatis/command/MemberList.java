package co.micol.mybatis.command;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import co.micol.mybatis.comm.Command;
import co.micol.mybatis.member.service.MemberService;
import co.micol.mybatis.member.serviceImpl.MemberServiceImpl;

public class MemberList implements Command {

	public String run(HttpServletRequest request, HttpServletResponse response) {
		MemberService memberDao = new MemberServiceImpl();
		request.setAttribute("members", memberDao.memberSelectList());
		
		return "member/memberList";
	}

}
