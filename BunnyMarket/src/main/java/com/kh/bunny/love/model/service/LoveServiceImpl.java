package com.kh.bunny.love.model.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.bunny.love.model.dao.LoveDAO;
import com.kh.bunny.love.model.vo.Love;

@Service("loveService")
public class LoveServiceImpl implements LoveService {

	@Autowired
	LoveDAO loveDAO;
	
	@Override
	public int insertLoveAuction(Love love) {
		return loveDAO.insertLoveAuction(love);
		
	}

	
	
}
