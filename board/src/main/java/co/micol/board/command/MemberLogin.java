package co.micol.board.command;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import co.micol.prj.member.service.MemberService;
import co.micol.prj.member.serviceImpl.MemberServiceImpl;
import co.micol.prj.member.vo.MemberVO;

public class MemberLogin implements Command {

	@Override
	public String run(HttpServletRequest request, HttpServletResponse response) {
		// 로그인과정
		HttpSession session = request.getSession(); // session 객체를 불러온다.
		//db연결
		MemberService memberDao = new MemberServiceImpl();
		MemberVO vo = new MemberVO();
		vo.setId(request.getParameter("id")); // 폼에서 입력값을 vo 객체에 담음.
		vo.setPassword(request.getParameter("password"));
		
		vo = memberDao.memberLogin(vo); // vo : 메소드(앞), 매개변수(뒤)
		String page = null;
		if(vo.getName() != null) {
			session.setAttribute("id", vo.getId()); // session 에 값을 담아 놓는다.
			session.setAttribute("author", vo.getAuthor());
			session.setAttribute("name", vo.getName());
			page = "member/memberLoginSuccess";	
		} else {
			page = "member/memberLoginFail";
		}
		return page;
	}

}
