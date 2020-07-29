package com.kh.bunny.point.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import com.kh.bunny.point.model.service.PointService;

@Controller
public class PointController {

	@Autowired
	PointService pointService;
	
	@RequestMapping("/point/pointCharge.do")
	public String pointCharge() {
		
		return "payment/pView";
	}
	
}

