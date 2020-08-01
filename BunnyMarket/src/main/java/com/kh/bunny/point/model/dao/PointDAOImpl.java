package com.kh.bunny.point.model.dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.RowBounds;
import org.apache.ibatis.session.SqlSessionFactory;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.kh.bunny.member.model.vo.Member;
import com.kh.bunny.point.model.vo.BunnyPoint;

@Repository("pointDAO")
public class PointDAOImpl implements PointDAO {

	@Autowired
	SqlSessionTemplate sqlSession;
	
	@Override
	public int pointChargeInsert(BunnyPoint bunnyPoint) {
		return sqlSession.insert("pointMapper.pointChargeInsert", bunnyPoint);
	}

	@Override
	public int selectOneNowPoint(String userId) {
		return sqlSession.selectOne("pointMapper.selectOneNowPoint", userId);
	}

	@Override
	public List<Map<String, String>> selectMyPoint(String userId, int pPage, int numPerPage) {
		
		RowBounds rows = new RowBounds((pPage - 1) * numPerPage, numPerPage);
		
		return sqlSession.selectList("pointMapper.selectMyPoint", userId, rows);
	}

	@Override
	public int selectPointTotalContents(String userId) {
		return sqlSession.selectOne("pointMapper.selectPointTotalContents", userId);
	}

}
