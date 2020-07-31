package com.kh.bunny.review.model.service;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.bunny.review.model.dao.ReviewDAO;
import com.kh.bunny.review.model.vo.Review;

@Service("reviewService")
public class ReviewServiceImpl implements ReviewService {
	@Autowired
	ReviewDAO reviewDAO;
	@Override
	public List<Map<String, String>> selectSellerReview(String userId) {

		return reviewDAO.selectSellerReview(userId);
	}
	@Override
	public int insertReview(Review review, String userId) {

		return reviewDAO.insertReview(review,userId);
	}

}
