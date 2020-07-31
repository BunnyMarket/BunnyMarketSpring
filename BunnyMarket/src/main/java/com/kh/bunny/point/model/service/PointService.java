package com.kh.bunny.point.model.service;

import com.kh.bunny.point.model.vo.BunnyPoint;

public interface PointService {

	static int AUCTION_SERVICE_ERROR = 0;
	static int AUCTION_SERVICE_COMPLETE = 1;
	
	int pointChargeInsert(BunnyPoint bunnyPoint);
	
	int selectOneNowPoint(String userId);
	
	
}
