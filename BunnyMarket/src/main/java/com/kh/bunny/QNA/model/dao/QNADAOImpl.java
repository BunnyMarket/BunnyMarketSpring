package com.kh.bunny.QNA.model.dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.RowBounds;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.kh.bunny.QNA.model.vo.QNA;

@Repository("qnaDAO")
public class QNADAOImpl implements QNADAO {

	@Autowired
	SqlSessionTemplate sqlSession;

	@Override
	public List<Map<String, String>> selectQNAList(int cPage, int numPerPage) {
		RowBounds rows = new RowBounds((cPage-1)*numPerPage, numPerPage);
		return sqlSession.selectList("qnaMapper.selectQNAList", null, rows) ;
	}

	@Override
	public int selectQNATotalContents() {
		
		return sqlSession.selectOne("qnaMapper.selectQNATotalContent");
	}

	@Override
	public int insertQNA(QNA qna) {
		System.out.println("DAO qna : " + qna);
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
	
}
