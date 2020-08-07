package com.kh.bunny.review.model.service;

import java.util.List;
import java.util.Map;

import com.kh.bunny.review.model.vo.Review;


public interface ReviewService {

	
	
	List<Map<String, String>> selectSellerReview(String userId);

	int insertReview(Review review, String userId);

	int selectOneReCount(int pno, String userId);

}
