package co.micol.mager.web;

import java.io.IOException;
import java.util.HashMap;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletConfig;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import co.micol.mager.comm.Command;
import co.micol.mager.command.MainCommand;
import co.micol.mager.command.MemberSelectList;

// @WebServlet("/FrontController")
public class FrontController extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private HashMap<String, Command> map = new HashMap<String, Command>();
	
    public FrontController() {
        super();
    }

	/**
	 * 실행할 Command 메소드를 등록한다.
	 */
	public void init(ServletConfig config) throws ServletException {
		map.put("/main.do", new MainCommand()); //처음 호출시 보여주는 페이지
		map.put("/memberSelectList.do", new MemberSelectList());
	}

	/**
	 * 요청을 분석하고 처리하는 부분
	 */
	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("utf-8"); // 한글 깨짐 방지
		String uri = request.getRequestURI(); // 요청 명령을 분석하기 위해 URI를 구함
		String contextPath = request.getContextPath(); // 프로젝트 루트를 찾음
		String page = uri.substring(contextPath.length()); // 실제 수행해야할 호출명
		
		Command command = map.get(page); // command = new MainCommand(); 인터페이스를 통해 명령을 호출.
		String viewPage = command.run(request, response); // 명령을 실행하고 돌려줄 페이지를 받는다.
				
		if(!viewPage.endsWith(".do")) {
			viewPage = "WEB-INF/views/" + viewPage + ".jsp"; // view Resolve
		}
				
		// 보여줄 페이지를 호출하는 부분
		RequestDispatcher dispatcher = request.getRequestDispatcher(viewPage);
		dispatcher.forward(request, response);
	}

}
