package com.kh.bunny.QNA.model.service;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.bunny.QNA.model.dao.QNADAO;
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
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public QNA selectOneQNA(int qNo) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public int updateQNA(QNA qna) {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public int deleteQNA(int qNo) {
		// TODO Auto-generated method stub
		return 0;
	}

}
