package co.micol.mybatis.command;

import java.sql.Date;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import co.micol.mybatis.comm.Command;
import co.micol.mybatis.notice.service.NoticeService;
import co.micol.mybatis.notice.service.NoticeVO;
import co.micol.mybatis.notice.serviceImpl.NoticeServiceImpl;

public class NoticeInsert implements Command {

	@Override
	public String run(HttpServletRequest request, HttpServletResponse response) {
		// TODO Auto-generated method stub
		NoticeService noticeDao  = new NoticeServiceImpl();
		NoticeVO vo = new NoticeVO();
		vo.setId(request.getParameter("id"));
		vo.setName(request.getParameter("name"));
		vo.setWriteDate(Date.valueOf(request.getParameter("writeDate")));
		vo.setTitle(request.getParameter("title"));
		vo.setContents(request.getParameter("contents"));
		
		int n = noticeDao.noticeInsert(vo);
		String viewPage = null;
		if(n != 0) {
			viewPage = "noticeList.do";
		} else {
			request.setAttribute("message", "등록이 실패했습니다.");
			viewPage = "notice/noticeFail";
		}
		return viewPage;
	}

}
