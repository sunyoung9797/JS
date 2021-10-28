package co.micol.mybatis.command;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import co.micol.mybatis.comm.Command;
import co.micol.mybatis.member.service.MemberService;
import co.micol.mybatis.member.service.MemberVO;
import co.micol.mybatis.member.serviceImpl.MemberServiceImpl;

public class MemberJoin implements Command {

	@Override
	public String run(HttpServletRequest request, HttpServletResponse response) {
		MemberService memberDao = new MemberServiceImpl();
		MemberVO vo = new MemberVO();
		
		vo.setId(request.getParameter("id"));
		vo.setPassword(request.getParameter("password"));
		vo.setName(request.getParameter("name"));
		vo.setAddress(request.getParameter("address"));
		vo.setTel(request.getParameter("tel"));
		vo.setAuthor(request.getParameter("author"));
		
		int n = memberDao.memberInsert(vo);
		String viewPage = null;
		if (n != 0) {
			request.setAttribute("message", "회원가입이 성공하였습니다.");
			viewPage = "member/memberJoinSuccess";
		} else {
			request.setAttribute("message", "회원가입이 실패하였습니다.");
			viewPage = "member/memberFail";
		}
		return viewPage;
	}

}
