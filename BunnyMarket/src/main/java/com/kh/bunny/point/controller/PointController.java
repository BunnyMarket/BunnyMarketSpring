package com.kh.bunny.point.controller;

import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.kh.bunny.member.model.vo.Member;
import com.kh.bunny.point.model.exception.PointException;
import com.kh.bunny.point.model.service.PointService;
import com.kh.bunny.point.model.vo.BunnyPoint;

@Controller
public class PointController {

	@Autowired
	PointService pointService;
	
	@RequestMapping("/point/pointChargeView.do")
	public String pointChargeView() {
		
		return "payment/pView";
	}
	
	@RequestMapping("/point/pointCharge.do")
	@ResponseBody
	public Map<String, Object> pointCharge(BunnyPoint bunnyPoint, Model model, HttpSession session) {
		
		Member m = (Member)session.getAttribute("member");
		String userId = m.getNickName();
		
		bunnyPoint.setUserId(userId);
		HashMap<String , Object> hmap = new HashMap<String, Object>();
		boolean fineCharge = false;
		System.out.println("포인트로 들어왔어요? : " + bunnyPoint);
		int nowPoint = 0;
		try {
			
			fineCharge = pointService.pointChargeInsert(bunnyPoint) > 0 ? true : false;
			
			nowPoint = pointService.selectOneNowPoint(userId);
			System.out.println("웨?? fineCharge : " + fineCharge);
			
		} catch (Exception e) {
			throw new PointException("[포인트 결제 중 문제 발생] : " + e.getMessage());
		}
		hmap.put("fineCharge", fineCharge);
		hmap.put("nowPoint", nowPoint);
		
		
		return hmap;
	}
}

