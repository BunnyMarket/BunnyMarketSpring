package com.kh.bunny.adminMember.model.DAO;

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
}

