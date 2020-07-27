package com.kh.bunny.report.model.dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.RowBounds;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.kh.bunny.report.model.vo.Report;

@Repository("ReportDAO")
public class ReportDAOImpl implements ReportDAO {

	@Autowired
	SqlSessionTemplate sqlSession;
	
	@Override
	public List<Map<String, String>> selectReportList(int cPage, int numPerPage) {
		RowBounds rows = new RowBounds((cPage-1)*numPerPage, numPerPage);
		return sqlSession.selectList("reportMapper.selectReportList", null, rows);
	}

	@Override
	public int selectReportTotalContents() {
		
		return sqlSession.selectOne("reportMapper.selectReportTotalContents");
	}

	@Override
	public int insertReport(Report r) {
		
		return sqlSession.insert("reportMapper.insertReport", r);
	}

	@Override
	public int selectCurrentRno() {
		
		return sqlSession.selectOne("reportMapper.selectCurrenRno");
	}

}
