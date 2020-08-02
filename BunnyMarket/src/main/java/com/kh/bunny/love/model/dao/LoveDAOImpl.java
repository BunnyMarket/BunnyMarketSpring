package com.kh.bunny.love.model.dao;

import org.apache.ibatis.session.SqlSession;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.kh.bunny.love.model.vo.Love;

@Repository("loveDAO")
public class LoveDAOImpl implements LoveDAO {

	@Autowired
	SqlSessionTemplate sqlSession;
	@Override
	public int insertLoveAuction(Love love) {
		
		return sqlSession.insert("loveMapper.insertLove", love);
	}

}
