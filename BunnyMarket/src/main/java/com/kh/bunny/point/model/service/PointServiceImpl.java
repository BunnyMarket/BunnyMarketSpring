package com.kh.bunny.point.model.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.bunny.point.model.dao.PointDAO;

@Service("pointService")
public class PointServiceImpl implements PointService{

	@Autowired
	PointDAO pointDAO;
	
}
