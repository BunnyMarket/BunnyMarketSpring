package com.kh.bunny.notice.model.dao;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.RowBounds;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.kh.bunny.notice.model.vo.Notice;

@Repository("noticeDAO")
public class NoticeDAOImpl implements NoticeDAO {
	
	@Autowired
	SqlSessionTemplate sqlSession;
	
	@Override
	public List<Map<String, String>> selectNoticeList(int cPage, int numPerPage) {
		RowBounds rows = new RowBounds((cPage-1)*numPerPage,numPerPage);
		return sqlSession.selectList("noticeMapper.selectNoticeList", null, rows);
	}

	@Override
	public int selectNoticeTotalContents() {
		
		return sqlSession.selectOne("noticeMapper.selectNoticeTotalContents");
	}

	@Override
	public int insertNotice(Notice notice) {
		
		return sqlSession.insert("noticeMapper.insertNotice", notice);
	}

	@Override
	public Notice selectOneNotice(int nno) {
		
		return sqlSession.selectOne("noticeMapper.selectOneNotice",nno);
	}

	@Override
	public int updateNotice(Notice notice) {
		
		return sqlSession.update("noticeMapper.updateNotice", notice);
	}

	@Override
	public int deleteNotice(int nno) {
		
		return sqlSession.delete("noticeMapper.deleteNotice", nno);
	}

	@Override
	public int updateCount(int nno) {
		return sqlSession.update("noticeMapper.updateNoticeCount",nno);
	}

	@Override
	public List<Object> searchNoticeList(String keyword, String condition, int pPage, int numPerPage) {
		HashMap<Object, Object> hmap = new HashMap<>();
		RowBounds rows = new RowBounds((pPage-1)*numPerPage, numPerPage);
		
		hmap.put("keyword", keyword);
		hmap.put("condition", condition);
	
		return sqlSession.selectList("noticeMapper.searchNoticeList", hmap, rows);
	}

	@Override
	public int selectSNoticeTotalContents(String keyword, String condition) {
		HashMap<Object, Object> hmap = new HashMap<>();
		hmap.put("keyword", keyword);
		hmap.put("condition", condition);
		
		return sqlSession.selectOne("noticeMapper.selectSNoticeTotalContent", hmap);
	
	}
}
