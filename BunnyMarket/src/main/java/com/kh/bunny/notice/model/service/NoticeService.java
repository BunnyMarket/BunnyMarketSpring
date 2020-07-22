package com.kh.bunny.notice.model.service;

import java.util.List;
import java.util.Map;

import com.kh.bunny.notice.model.vo.Notice;

public interface NoticeService {
	
	// 페이징 select
	List<Map<String, String>> selectNoticeList(int cPage, int numPerPage);
	
	int selectNoticeTotalContents();
	
	int insertNotice(Notice notice);
	
	Notice selectOneNotice(int nno);
	
	int updateNotice(Notice notice);
	
	int deleteNotice(int nno);

}
