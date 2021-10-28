package co.micol.mybatis.notice.service;

import java.util.List;

public interface NoticeMapper { //NoticeService 랑 똑같
	List<NoticeVO> noticeSelectList();
	NoticeVO noticeSelect(NoticeVO vo);
	int noticeInsert(NoticeVO vo);
	int noticeUpdate(NoticeVO vo);
	int noticeDelete(NoticeVO vo);
}
