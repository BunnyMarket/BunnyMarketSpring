package com.kh.bunny.notice.model.dao;

import java.util.List;
import java.util.Map;

import com.kh.bunny.notice.model.vo.Notice;

public interface NoticeDAO {
	
	List<Map<String, String>> selectNoticeList(int cPage, int numPerPage);

	int selectNoticeTotalContents();
	int insertNotice(Notice notice);
	Notice selectOneNotice(int nno);
	int updateNotice(Notice notice);
	int deleteNotice(int nno);


}
