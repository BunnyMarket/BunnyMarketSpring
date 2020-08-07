package com.kh.bunny.review.model.dao;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.kh.bunny.review.model.vo.Review;

@Repository("reviewDAO")
public class ReviewDAOImpl implements ReviewDAO {

	
	@Autowired
	SqlSessionTemplate sqlSession;
	
	
	@Override
	public List<Map<String, String>> selectSellerReview(String userId) {
		// TODO Auto-generated method stub
		return sqlSession.selectList("reviewMapper.selectSellerReview",userId);
	}


	@Override
	public int insertReview(Review review, String userId) {
		
		Map<String, Object> hmap = new HashMap<String, Object>();
		
		hmap.put("userId", userId);
		hmap.put("review", review);
		return sqlSession.insert("reviewMapper.insertReview", hmap);
	}


	@Override
	public int selectOneReCount(int pno, String userId) {
		
		Map<String, Object> hmap = new HashMap<String, Object>();
		
		hmap.put("userId", userId);
		hmap.put("pno", pno);
		
		return sqlSession.selectOne("reivewMapper.selectOneReCount", hmap);
	}

}
