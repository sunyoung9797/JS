package co.micol.board.command;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import co.micol.board.notice.service.NoticeService;
import co.micol.board.notice.service.NoticeVO;
import co.micol.board.notice.serviceImpl.NoticeServiceImpl;

public class NoticeDelete implements Command {

	@Override
	public String run(HttpServletRequest request, HttpServletResponse response) {
		// 게시글 삭제
		NoticeService noticeDao = new NoticeServiceImpl(); //자기자신으로 초기화 못하고 impl로함
		NoticeVO vo = new NoticeVO();
		vo.setnId(Integer.valueOf(request.getParameter("nId")));
		int n = noticeDao.noticeDelete(vo);
		String viewPage = null;
		if(n != 0) {
			viewPage = "noticeList.do";
		} else {
			request.setAttribute("message", "삭제실패했습니다.");
			viewPage = "notice/noticeFail";
		}
		
		return viewPage;
	}

}
