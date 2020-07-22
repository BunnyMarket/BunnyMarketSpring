package com.kh.bunny.notice.model.dao;

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
		
		return sqlSession.selectOne("noticeMapper.selectneNotice",nno);
	}

	@Override
	public int updateNotice(Notice notice) {
		
		return sqlSession.update("noticeMapper.updateNotice", notice);
	}

	@Override
	public int deleteNotice(int nno) {
		
		return sqlSession.delete("noticeMapper.deleteNotice", nno);
	}

}
