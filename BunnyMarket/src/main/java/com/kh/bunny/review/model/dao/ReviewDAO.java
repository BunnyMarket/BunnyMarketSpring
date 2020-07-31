package com.kh.bunny.review.model.dao;

import java.util.List;
import java.util.Map;

import com.kh.bunny.review.model.vo.Review;


public interface ReviewDAO {

	

	

	List<Map<String, String>> selectSellerReview(String userId);

	int insertReview(Review review, String userId);
	

	

}
