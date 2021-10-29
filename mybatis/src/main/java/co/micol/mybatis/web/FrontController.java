package co.micol.mybatis.web;

import java.io.IOException;
import java.util.HashMap;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletConfig;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import co.micol.mybatis.comm.Command;
import co.micol.mybatis.command.HomeCommand;
import co.micol.mybatis.command.MemberJoin;
import co.micol.mybatis.command.MemberJoinForm;
import co.micol.mybatis.command.MemberList;
import co.micol.mybatis.command.MemberLogin;
import co.micol.mybatis.command.MemberLogout;
import co.micol.mybatis.command.MemberSelect;
import co.micol.mybatis.command.NoticeDelete;
import co.micol.mybatis.command.NoticeForm;
import co.micol.mybatis.command.NoticeInsert;
import co.micol.mybatis.command.NoticeList;
import co.micol.mybatis.command.NoticeSelect;
import co.micol.mybatis.command.memberLoginForm;

@WebServlet("*.do")
public class FrontController extends HttpServlet {
	private static final long serialVersionUID = 1L;
    private HashMap<String, Command> map = new HashMap<String, Command>();

    public FrontController() {
        super();
    }


	public void init(ServletConfig config) throws ServletException {
		map.put("/home.do", new HomeCommand()); // 홈
		map.put("/memberList.do", new MemberList()); // 멤버리스트 가져오기
		map.put("/memberSelect.do", new MemberSelect()); // 한명검색
		map.put("/memberLoginForm.do", new memberLoginForm()); //로그인 폼 호출
		map.put("/memberLogin.do", new MemberLogin()); //로그인 처리
		map.put("/memberJoinForm.do", new MemberJoinForm()); //회원가입 폼 호출
		map.put("/memberJoin.do", new MemberJoin()); // 회원가입 처리
		map.put("/memberLogout.do", new MemberLogout()); // 로그아웃
		
		map.put("/noticeList.do", new NoticeList()); //게시글 목록
		map.put("/noticeSelect.do", new NoticeSelect()); //세부내역보기
		map.put("/noticeForm.do", new NoticeForm()); // 게시글 입력 폼
		map.put("/noticeInsert.do", new NoticeInsert()); // 게시글 저장
		map.put("/noticeDelete.do", new NoticeDelete()); // 게시글 삭제
		//map.put("/noticeEdit.do", new NoticeEdit()); // 게시글 수정
	}

	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		String uri = request.getRequestURI();
		String ContextPath = request.getContextPath();
		String page = uri.substring(ContextPath.length());
		
		Command command = map.get(page);
		String viewPage = command.run(request, response);
		
		if(!viewPage.endsWith(".do")) {
			viewPage = "WEB-INF/views/" +viewPage+ ".jsp";
		}
		
		RequestDispatcher dispatcher = request.getRequestDispatcher(viewPage);
		dispatcher.forward(request, response);
		
	}

}
