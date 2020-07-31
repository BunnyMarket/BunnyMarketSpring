package com.kh.bunny.point.model.dao;

import com.kh.bunny.point.model.vo.BunnyPoint;

public interface PointDAO {

	int pointChargeInsert(BunnyPoint bunnyPoint);

	int selectOneNowPoint(String userId);

}
