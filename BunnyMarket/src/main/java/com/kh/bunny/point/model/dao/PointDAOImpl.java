package com.kh.bunny.point.model.dao;

import org.apache.ibatis.session.SqlSessionFactory;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.kh.bunny.point.model.vo.BunnyPoint;

@Repository("pointDAO")
public class PointDAOImpl implements PointDAO {

	@Autowired
	SqlSessionTemplate sqlSession;
	
	@Override
	public int pointChargeInsert(BunnyPoint bunnyPoint) {
		return sqlSession.insert("pointMapper.pointChargeInsert", bunnyPoint);
	}

}
