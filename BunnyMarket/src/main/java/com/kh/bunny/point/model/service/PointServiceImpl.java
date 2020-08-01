package com.kh.bunny.point.model.service;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.bunny.member.model.vo.Member;
import com.kh.bunny.point.model.dao.PointDAO;
import com.kh.bunny.point.model.vo.BunnyPoint;

@Service("pointService")
public class PointServiceImpl implements PointService{

	@Autowired
	PointDAO pointDAO;

	@Override
	public int pointChargeInsert(BunnyPoint bunnyPoint) {
		return pointDAO.pointChargeInsert(bunnyPoint);
	}

	@Override
	public int selectOneNowPoint(String userId) {
		return pointDAO.selectOneNowPoint(userId);
	}

	@Override
	public List<Map<String, String>> selectMyPoint(String userId, int pPage, int numPerPage) {
		return pointDAO.selectMyPoint(userId, pPage, numPerPage);
	}

	@Override
	public int selectPointTotalContents(String userId) {
		return pointDAO.selectPointTotalContents(userId);
	}
	
}
