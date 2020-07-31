package com.kh.bunny.QNA.model.service;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.bunny.QNA.model.dao.QNADAO;
import com.kh.bunny.QNA.model.exception.QNAException;
import com.kh.bunny.QNA.model.vo.QComment;
import com.kh.bunny.QNA.model.vo.QNA;

@Service("QNAService")

public class QNAServiceImpl implements QNAService {


	@Autowired
	QNADAO qnaDAO;

	
	@Override
	public List<Map<String, String>> selectQNAList(int cPage, int numPerPage) {
		
		return qnaDAO.selectQNAList(cPage,numPerPage);
	}

	@Override
	public int selectQNATotalContents() {
		
		return qnaDAO.selectQNATotalContents();
	}

	@Override
	public int insertQNA(QNA qna) {
		int result =0;
		
		result = qnaDAO.insertQNA(qna);
		
		if(result == QNA_SERVICE_ERROR) throw new QNAException();
	
		return result;
	}

	@Override
	public QNA selectOneQNA(int qNo) {

		return qnaDAO.selectOneQNA(qNo);
	}

	@Override
	public int updateQNA(QNA qna) {
		int result = 0;
		
		try {
		result = qnaDAO.updateQNA(qna);
		
		if(result == QNA_SERVICE_ERROR)throw new QNAException();
		}catch (Exception e) {
			throw new QNAException("QNA 수정 오류 발생!" + e.getMessage());
		}
		
		return result;
	}

	@Override
	public int deleteQNA(int qNo) {
	int result = qnaDAO.deleteQNA(qNo);
	
	if(result == QNA_SERVICE_ERROR) throw new QNAException();
	else if(result > QNA_SERVICE_ERROR)result = QNA_SERVICE_COMPLETE;
	else throw new QNAException("QNA 삭제 실패!");
	
		return result;
	}

	@Override
	public int selectCurrentQno() {
		return qnaDAO.selectCurrentQno();
	}

	@Override
	public int insertQComment(QComment qcomment) {
		
		return qnaDAO.insertQCcomment(qcomment);
	}

	@Override
	public List<Object> selectQCommentList(int qno) {
		return qnaDAO.selectQCommentList(qno);
	}

	@Override
	public int updateQComment(QComment qcomment) {
		return qnaDAO.updateQComment(qcomment);
	}

	@Override
	public int selectOneReplyQcno(int qcno) {
		return qnaDAO.selectOneReplyQcno(qcno);
	}

	@Override
	public int deleteQComment(int qcno) {
		return qnaDAO.deleteQComment(qcno);

	}

}
