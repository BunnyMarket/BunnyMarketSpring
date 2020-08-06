package com.kh.bunny.notice.model.service;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.bunny.notice.model.dao.NoticeDAO;
import com.kh.bunny.notice.model.vo.Notice;

@Service("noticeService")
public class NoticeImpl implements NoticeService {

	@Autowired
	NoticeDAO noticeDAO;
	
	@Override
	public List<Map<String, String>> selectNoticeList(int cPage, int numPerPage) {
		
		return noticeDAO.selectNoticeList(cPage, numPerPage);
	}

	@Override
	public int selectNoticeTotalContents() {
		
		return noticeDAO.selectNoticeTotalContents();
	}

	@Override
	public int insertNotice(Notice notice) {
		
		return noticeDAO.insertNotice(notice);
	}

	@Override
	public Notice selectOneNotice(int nno) {
		
		Notice n = noticeDAO.selectOneNotice(nno);
		
		if(n!= null) {
			int result = noticeDAO.updateCount(nno);
		}
		return n;
	}

	@Override
	public int updateNotice(Notice notice) {
		
		return noticeDAO.updateNotice(notice);
	}

	@Override
	public int deleteNotice(int nno) {
		
		return noticeDAO.deleteNotice(nno);
	}

	@Override
	public List<Object> searchNoticeList(String keyword, String condition, int pPage, int numPerPage) {
		return  noticeDAO.searchNoticeList(keyword, condition, pPage, numPerPage);
	}

	@Override
	public int selectSNoticeTotalContents(String keyword, String condition) {
		return noticeDAO.selectSNoticeTotalContents(keyword, condition);
	}

}
