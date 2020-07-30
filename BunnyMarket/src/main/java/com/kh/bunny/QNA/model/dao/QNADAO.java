package com.kh.bunny.QNA.model.dao;

import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.kh.bunny.QNA.model.vo.QNA;


public interface QNADAO {

	List<Map<String, String>> selectQNAList(int cPage, int numPerPage);
	
	int selectQNATotalContents();
	
	int insertQNA(QNA qna);
	
	QNA selectOneQNA(int qNo);
	
	int updateQNA(QNA qna);
	
	int deleteQNA(int qNo);

	int selectCurrentQno();
	
}
