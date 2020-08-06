package com.kh.bunny.adminMember.model.DAO;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.RowBounds;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.kh.bunny.adminMember.model.vo.adminMember;

@Repository("adminDAO")
public class AdminDAOImpl implements AdminDAO {


	@Autowired
	SqlSessionTemplate sqlSession;
	
	@Override
	public List<Map<String, String>> selectAdminList(int cPage, int numPerPage){
		RowBounds rows = new RowBounds((cPage-1)*numPerPage,numPerPage);
		return sqlSession.selectList("adminMapper.selectAdminList", null, rows);
	}
	
	@Override
	public int selectAdminTotalContents() {
		return sqlSession.selectOne("adminMapper.selectAdminTotalContents");
	}
	
	@Override
	public int selectOneStatusOn(String userId) {
		System.out.println("dao"+userId);
		return sqlSession.update("adminMapper.selectOneStatusOn",userId);
	}
	@Override
	public int selectOneStatusOff(String userId) {
		System.out.println("dao"+userId);
		return sqlSession.update("adminMapper.selectOneStatusOff",userId);
	}
	@Override
	public int insertadminMember(adminMember am) {
		System.out.println("insert DAO" + am);
		return sqlSession.insert("adminMapper.insertadminMember", am);
	}
	
	@Override
	public adminMember selectOne(String adminId) {
		System.out.println("selectOne DAO" + adminId);
		return sqlSession.selectOne("adminMapper.LoginMember", adminId);
	}

	@Override
	public List<Map<String, Object>> selectChartCategoryCount() {
		return sqlSession.selectList("adminMapper.chartCategoryCount");
	}

	@Override
	public List<Map<String, Object>> selectChartMonthCount() {
		return sqlSession.selectList("adminMapper.chartMonthCount");
	}

	@Override
	public List<Object> searchAdminList(String keyword, String condition, int pPage, int numPerPage) {
		HashMap<Object, Object> hmap = new HashMap<>();
		RowBounds rows = new RowBounds((pPage-1)*numPerPage, numPerPage);
		
		hmap.put("keyword", keyword);
		hmap.put("condition", condition);
	
		return sqlSession.selectList("adminMapper.searchAdminMemberList", hmap, rows);
	}

	@Override
	public int selectSAdminMemberTotalContents(String keyword, String condition) {
		HashMap<Object, Object> hmap = new HashMap<>();
		hmap.put("keyword", keyword);
		hmap.put("condition", condition);
		
		return sqlSession.selectOne("adminMapper.selectSAdminMemberTotalContent", hmap);
	}

	@Override
	public List<Map<String, Object>> selectChartReportCount() {
		return sqlSession.selectList("adminMapper.chartReportCount");
	}
}


