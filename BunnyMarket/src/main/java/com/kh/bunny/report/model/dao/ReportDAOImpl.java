package com.kh.bunny.report.model.dao;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.RowBounds;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.kh.bunny.product.model.vo.Product;
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
		System.out.println("dao : " + r.getRNo());
		return sqlSession.insert("reportMapper.insertReport", r);
	}

	@Override
	public int selectCurrentRno() {
		
		return sqlSession.selectOne("reportMapper.selectCurrentRno");
	}

	@Override
	public Report selectOneReport(int rNo) {
		
		return sqlSession.selectOne("reportMapper.selectOneReport", rNo);
	}

	@Override
	public int updateReport(Report r) {
	
		return sqlSession.update("reportMapper.updateReport", r);
	}

	@Override
	public int deleteReport(int rno) {
	
		return sqlSession.delete("reportMapper.deleteReport", rno);
	}

	@Override
	public int insertDirectReport(Report r) {
		System.out.println("dao : " + r.getRNo());
		return sqlSession.insert("reportMapper.insertDirectReport", r);
	}

	@Override
	public Product selectOneProduct(int pno) {
		return sqlSession.selectOne("reportMapper.oneProduct", pno);
	}

	@Override
	public List<Object> searchReportList(String keyword, String condition, int pPage, int numPerPage) {
		HashMap<Object, Object> hmap = new HashMap<>();
		RowBounds rows = new RowBounds((pPage-1)*numPerPage, numPerPage);
		
		hmap.put("keyword", keyword);
		hmap.put("condition", condition);
	
		return sqlSession.selectList("reportMapper.searchReportList", hmap, rows);
	}

	@Override
	public int selectSReportTotalContents(String keyword, String condition) {
		HashMap<Object, Object> hmap = new HashMap<>();
		hmap.put("keyword", keyword);
		hmap.put("condition", condition);
		
		return sqlSession.selectOne("reportMapper.selectSReportTotalContent", hmap);
	
	}

}
