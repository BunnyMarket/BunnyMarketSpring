package com.kh.bunny.QNA.model.dao;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.RowBounds;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.kh.bunny.QNA.model.vo.QComment;
import com.kh.bunny.QNA.model.vo.QNA;

@Repository("qnaDAO")
public class QNADAOImpl implements QNADAO {

	@Autowired
	SqlSessionTemplate sqlSession;

	@Override
	public List<Map<String, String>> selectQNAList(int cPage, int numPerPage, String userId) {
		RowBounds rows = new RowBounds((cPage-1)*numPerPage, numPerPage);
		return sqlSession.selectList("qnaMapper.selectQNAList", userId, rows) ;
	}

	@Override
	public int selectQNATotalContents(String userId) {
		
		return sqlSession.selectOne("qnaMapper.selectQNATotalContent", userId);
	}

	@Override
	public int insertQNA(QNA qna) {
		return sqlSession.insert("qnaMapper.insertQNA", qna);
	}

	@Override
	public QNA selectOneQNA(int qNo) {
		
		return sqlSession.selectOne("qnaMapper.selectOneQNA", qNo) ;
	}

	@Override
	public int updateQNA(QNA qna) {
		
		return sqlSession.insert("qnaMapper.updateQNA", qna);
	}

	@Override
	public int deleteQNA(int qNo) {
		
		return sqlSession.delete("qnaMapper.deleteQNA", qNo);
	}

	@Override
	public int selectCurrentQno() {
		return sqlSession.selectOne("qnaMapper.selectCurrentQno");
	}

	@Override
	public int insertQCcomment(QComment qcomment) {
		return sqlSession.insert("qnaMapper.insertQComment", qcomment);
	}

	@Override
	public List<Object> selectQCommentList(int qno) {
		return sqlSession.selectList("qnaMapper.selectQCommentList", qno);
	}

	@Override
	public int updateQComment(QComment qcomment) {
		return sqlSession.update("qnaMapper.updateQComment", qcomment);
	}

	@Override
	public int selectOneReplyQcno(int qcno) {
		return sqlSession.selectOne("qnaMapper.selectOneReplyQcno", qcno);
	}

	@Override
	public int deleteQComment(int qcno) {
		return sqlSession.delete("qnaMapper.deleteQComment", qcno);
	}
	
	@Override
	public List<Map<String, String>> selectQnAList(int cPage, int numPerPage) {
		RowBounds rows = new RowBounds((cPage-1)*numPerPage, numPerPage);
		return sqlSession.selectList("qnaMapper.selectQnAList", null, rows) ;
	}
	
	@Override
	public List<Object> selectQCommentList() {
		return sqlSession.selectList("qnaMapper.selectQCommentAllList");
	}

	@Override
	public List<Object> searchQnAList(String keyword, String condition, int pPage, int numPerPage) {
		HashMap<Object, Object> hmap = new HashMap<>();
		RowBounds rows = new RowBounds((pPage-1)*numPerPage, numPerPage);
		
		hmap.put("keyword", keyword);
		hmap.put("condition", condition);
	
		return sqlSession.selectList("qnaMapper.searchQnAList", hmap, rows);
	
	}

	@Override
	public int selectSQnATotalContents(String keyword, String condition) {
		HashMap<Object, Object> hmap = new HashMap<>();
		hmap.put("keyword", keyword);
		hmap.put("condition", condition);
		
		return sqlSession.selectOne("qnaMapper.selectSQnATotalContent", hmap);
	
	}

}
