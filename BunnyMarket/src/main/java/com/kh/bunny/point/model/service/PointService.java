package com.kh.bunny.point.model.service;

import java.util.List;
import java.util.Map;

import com.kh.bunny.point.model.vo.BunnyPoint;

public interface PointService {

	static int AUCTION_SERVICE_ERROR = 0;
	static int AUCTION_SERVICE_COMPLETE = 1;
	
	int pointChargeInsert(BunnyPoint bunnyPoint);
	
	int selectOneNowPoint(String userId);

	List<Map<String, String>> selectMyPoint(String userId, int pPage, int numPerPage);

	int selectPointTotalContents(String userId);
	
	
}
