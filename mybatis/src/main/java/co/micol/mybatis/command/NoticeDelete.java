package co.micol.mybatis.command;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import co.micol.mybatis.comm.Command;
import co.micol.mybatis.notice.service.NoticeService;
import co.micol.mybatis.notice.service.NoticeVO;
import co.micol.mybatis.notice.serviceImpl.NoticeServiceImpl;

public class NoticeDelete implements Command {

	@Override
	public String run(HttpServletRequest request, HttpServletResponse response) {
		// TODO Auto-generated method stub
		NoticeService noticeDao = new NoticeServiceImpl();
		NoticeVO vo = new NoticeVO();
		vo.setNid(Integer.valueOf(request.getParameter("nid")));
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
