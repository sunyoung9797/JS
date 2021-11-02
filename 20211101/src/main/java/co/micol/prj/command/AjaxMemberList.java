package co.micol.prj.command;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.fasterxml.jackson.core.JsonProcessingException;
import com.fasterxml.jackson.databind.ObjectMapper;

import co.micol.prj.comm.Command;
import co.micol.prj.member.service.MemberService;
import co.micol.prj.member.serviceImpl.MemberServiceImpl;

public class AjaxMemberList implements Command {

	@Override
	public String run(HttpServletRequest request, HttpServletResponse response) {
		// 실제처리
		MemberService memberDao = new MemberServiceImpl();
		ObjectMapper mapper = new ObjectMapper(); // Jackson 라이브러리
		String members = null;
		try {
			members = mapper.writeValueAsString(memberDao.selectMemberList());
		} catch (JsonProcessingException e) {
			e.printStackTrace();
		}
		//members = "{\"data\":"+members+"}";
		System.out.println(members);
		return "ajax:" + members; // ajax:[{"id":"micol","password":"1234"
	}

}
